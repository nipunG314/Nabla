#ifndef __IRR_I_DESCRIPTOR_SET_H_INCLUDED__
#define __IRR_I_DESCRIPTOR_SET_H_INCLUDED__

#include "irr/core/memory/refctd_dynamic_array.h"
#include "irr/asset/SSamplerParams.h"
#include "irr/asset/IDescriptorSetLayout.h"//for E_DESCRIPTOR_TYPE
#include "irr/asset/format/EFormat.h"

namespace irr { namespace asset
{

enum E_IMAGE_LAYOUT
{
    EIL_UNDEFINED = 0,
    EIL_GENERAL = 1,
    EIL_COLOR_ATTACHMENT_OPTIMAL = 2,
    EIL_DEPTH_STENCIL_ATTACHMENT_OPTIMAL = 3,
    EIL_DEPTH_STENCIL_READ_ONLY_OPTIMAL = 4,
    EIL_SHADER_READ_ONLY_OPTIMAL = 5,
    EIL_TRANSFER_SRC_OPTIMAL = 6,
    EIL_TRANSFER_DST_OPTIMAL = 7,
    EIL_PREINITIALIZED = 8,
    EIL_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL = 1000117000,
    EIL_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL = 1000117001,
    EIL_PRESENT_SRC_KHR = 1000001002,
    EIL_SHARED_PRESENT_KHR = 1000111000,
    EIL_SHADING_RATE_OPTIMAL_NV = 1000164003,
    EIL_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT = 1000218000
};

template<typename BufferType, typename TextureType, typename BufferViewType>
class IDescriptorSet
{
public:
    struct SDescriptorBufferInfo
    {
        core::smart_refctd_ptr<BufferType> buffer;
        size_t offset;
        size_t range;
    };
    struct SDescriptorImageInfo
    {
        SSamplerParams sampler;
        core::smart_refctd_ptr<TextureType> imageView;
        //! Irrelevant in OpenGL backend
        E_IMAGE_LAYOUT imageLayout;
    };

    struct SWriteDescriptorSet
    {
        uint32_t binding;
        E_DESCRIPTOR_TYPE descriptorType;
        core::smart_refctd_dynamic_array<SDescriptorBufferInfo> bufferInfo;
        core::smart_refctd_dynamic_array<SDescriptorImageInfo> imageInfo;
        core::smart_refctd_dynamic_array<core::smart_refctd_ptr<BufferViewType>> texelBufferView;
    };

protected:
    IDescriptorSet(core::smart_refctd_dynamic_array<SWriteDescriptorSet>&& _descriptors) : m_descriptors(std::move(_descriptors)) {}
    virtual ~IDescriptorSet() = default;

    core::smart_refctd_dynamic_array<SWriteDescriptorSet> m_descriptors;
};

}}

#endif