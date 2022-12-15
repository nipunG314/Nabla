// Copyright (C) 2018-2022 - DevSH Graphics Programming Sp. z O.O.
// This file is part of the "Nabla Engine".
// For conditions of distribution and use, see copyright notice in nabla.h
#include "nbl/asset/utils/CHLSLCompiler.h"
#include "nbl/asset/utils/shadercUtils.h"

#include <sstream>
#include <regex>
#include <iterator>

#include <dxc/dxcapi.h>
#include <combaseapi.h>

using namespace nbl;
using namespace nbl::asset;


CHLSLCompiler::CHLSLCompiler(core::smart_refctd_ptr<system::ISystem>&& system)
    : IShaderCompiler(std::move(system))
{
    IDxcUtils* utils;
    auto res = DxcCreateInstance(CLSID_DxcUtils, IID_PPV_ARGS(&utils));
    assert(SUCCEEDED(res));

    IDxcCompiler3* compiler;
    res = DxcCreateInstance(CLSID_DxcCompiler, IID_PPV_ARGS(&compiler));
    assert(SUCCEEDED(res));

    m_dxcUtils = std::unique_ptr<IDxcUtils>(utils);
    m_dxcCompiler = std::unique_ptr<IDxcCompiler3>(compiler);
}

CHLSLCompiler::~CHLSLCompiler()
{
    m_dxcUtils->Release();
    m_dxcCompiler->Release();
}

CHLSLCompiler::DxcCompilationResult CHLSLCompiler::dxcCompile(std::string& source, LPCWSTR* args, uint32_t argCount, const SOptions& options) const
{
    if (options.genDebugInfo)
    {
        std::ostringstream insertion;
        insertion << "// commandline compiler options : ";

        std::wstring_convert<std::codecvt_utf8<wchar_t>, wchar_t> conv;
        for (uint32_t arg = 0; arg < argCount; arg ++)
        {
            auto str = conv.to_bytes(args[arg]);
            insertion << str.c_str() << " ";
        }

        insertion << "\n";
        insertIntoStart(source, std::move(insertion));
    }
    
    IDxcBlobEncoding* src;
    auto res = m_dxcUtils->CreateBlob(reinterpret_cast<const void*>(source.data()), source.size(), CP_UTF8, &src);
    assert(SUCCEEDED(res));

    DxcBuffer sourceBuffer;
    sourceBuffer.Ptr = src->GetBufferPointer();
    sourceBuffer.Size = src->GetBufferSize();
    sourceBuffer.Encoding = 0;

    IDxcResult* compileResult;
    res = m_dxcCompiler->Compile(&sourceBuffer, args, argCount, nullptr, IID_PPV_ARGS(&compileResult));
    // If the compilation failed, this should still be a successful result
    assert(SUCCEEDED(res));

    HRESULT compilationStatus = 0;
    res = compileResult->GetStatus(&compilationStatus);
    assert(SUCCEEDED(res));

    IDxcBlobEncoding* errorBuffer;
    res = compileResult->GetErrorBuffer(&errorBuffer);
    assert(SUCCEEDED(res));

    DxcCompilationResult result;
    result.errorMessages = std::unique_ptr<IDxcBlobEncoding>(errorBuffer);
    result.compileResult = std::unique_ptr<IDxcResult>(compileResult);
    result.objectBlob = nullptr;

    if (!SUCCEEDED(compilationStatus))
    {
        options.preprocessorOptions.logger.log(result.GetErrorMessagesString(), system::ILogger::ELL_ERROR);
        return result;
    }

    IDxcBlob* resultingBlob;
    res = compileResult->GetResult(&resultingBlob);
    assert(SUCCEEDED(res));

    result.objectBlob = std::unique_ptr<IDxcBlob>(resultingBlob);

    return result;
}

core::smart_refctd_ptr<ICPUShader> CHLSLCompiler::compileToSPIRV(const char* code, const IShaderCompiler::SCompilerOptions& options) const
{
    auto hlslOptions = option_cast(options);

    if (!code)
    {
        hlslOptions.preprocessorOptions.logger.log("code is nullptr", system::ILogger::ELL_ERROR);
        return nullptr;
    }
    
    auto newCode = std::string(code);//preprocessShader(code, hlslOptions.stage, hlslOptions.preprocessorOptions);

    // Suffix is the shader model version
    std::wstring targetProfile(L"XX_6_2");

    // Set profile two letter prefix based on stage
    switch (options.stage) {
    case asset::IShader::ESS_VERTEX:
        targetProfile.replace(0, 2, L"vs");
        break;
    case asset::IShader::ESS_TESSELLATION_CONTROL:
        targetProfile.replace(0, 2, L"ds");
        break;
    case asset::IShader::ESS_TESSELLATION_EVALUATION:
        targetProfile.replace(0, 2, L"hs");
        break;
    case asset::IShader::ESS_GEOMETRY:
        targetProfile.replace(0, 2, L"gs");
        break;
    case asset::IShader::ESS_FRAGMENT:
        targetProfile.replace(0, 2, L"ps");
        break;
    case asset::IShader::ESS_COMPUTE:
        targetProfile.replace(0, 2, L"cs");
        break;
    case asset::IShader::ESS_TASK:
        targetProfile.replace(0, 2, L"as");
        break;
    case asset::IShader::ESS_MESH:
        targetProfile.replace(0, 2, L"ms");
        break;
    default:
        hlslOptions.preprocessorOptions.logger.log("invalid shader stage %i", system::ILogger::ELL_ERROR, options.stage);
        return nullptr;
    };

    LPCWSTR arguments[] = {
        // These will always be present
        L"-spirv",
        L"-HV", L"2021",
        L"-T", targetProfile.c_str(),

        // These are debug only
        L"-Zi", // Enables debug information
        L"-Qembed_debug" //Embeds debug information
    };

    const uint32_t nonDebugArgs = 5;
    const uint32_t allArgs = nonDebugArgs + 2;

    DxcCompilationResult compileResult = dxcCompile(newCode, &arguments[0], hlslOptions.genDebugInfo ? allArgs : nonDebugArgs, hlslOptions);

    if (!compileResult.objectBlob)
    {
        return nullptr;
    }

    auto outSpirv = core::make_smart_refctd_ptr<ICPUBuffer>(compileResult.objectBlob->GetBufferSize());
    memcpy(outSpirv->getPointer(), compileResult.objectBlob->GetBufferPointer(), compileResult.objectBlob->GetBufferSize());

    return core::make_smart_refctd_ptr<asset::ICPUShader>(std::move(outSpirv), hlslOptions.stage, IShader::E_CONTENT_TYPE::ECT_SPIRV, hlslOptions.preprocessorOptions.sourceIdentifier.data());
}

void CHLSLCompiler::insertIntoStart(std::string& code, std::ostringstream&& ins) const
{
    code.insert(0u, ins.str());
}
