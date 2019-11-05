#ifndef __IRR_I_DESCRIPTOR_SET_LAYOUT_H_INCLUDED__
#define __IRR_I_DESCRIPTOR_SET_LAYOUT_H_INCLUDED__

#include "irr/core/core.h"
#include "irr/asset/ShaderCommons.h"

namespace irr
{
namespace asset
{

enum E_DESCRIPTOR_TYPE
{
    EDT_COMBINED_IMAGE_SAMPLER = 1,
    EDT_STORAGE_IMAGE = 3,
    EDT_UNIFORM_TEXEL_BUFFER = 4,
    EDT_STORAGE_TEXEL_BUFFER = 5,
    EDT_UNIFORM_BUFFER = 6,
    EDT_STORAGE_BUFFER = 7,
    EDT_UNIFORM_BUFFER_DYNAMIC = 8,
    EDT_STORAGE_BUFFER_DYNAMIC = 9,
    EDT_INPUT_ATTACHMENT = 10
};

template<typename SamplerType>
class IDescriptorSetLayout : public virtual core::IReferenceCounted
{
	public:
		struct SBinding
		{
			uint32_t binding;
			E_DESCRIPTOR_TYPE type;
			uint32_t count;
			E_SHADER_STAGE stageFlags;
			const core::smart_refctd_ptr<SamplerType>* samplers;

			bool operator==(const SBinding& rhs) const
			{
				if (binding != rhs.binding)
					return false;
				if (type != rhs.type)
					return false;
				if (count != rhs.type)
					return false;
				if (stageFlags != rhs.stageFlags)
					return false;

				if (!samplers && !rhs.samplers)
					return true;
				else if ((samplers && !rhs.samplers) || (!samplers && rhs.samplers))
					return false;

				for (uint32_t i = 0u; i < count; ++i)
					if (samplers[i] != rhs.samplers[i])
						return false;

				return true;
			}
			bool operator!=(const SBinding& rhs) const
			{
				return !((*this == rhs));
			}
		};

	public:
		IDescriptorSetLayout(const SBinding* const _begin, const SBinding* const _end) : 
			m_bindings(core::make_refctd_dynamic_array<core::smart_refctd_dynamic_array<SBinding>>(_end-_begin))
		{
			size_t bndCount = _end-_begin;
			size_t immSamplerCount = 0ull;
			for (size_t i = 0ull; i < bndCount; ++i) {
				const auto& bnd = _begin[i];
				if (bnd.type==EDT_COMBINED_IMAGE_SAMPLER && bnd.samplers)
					immSamplerCount += bnd.count;
			}
			m_samplers = core::make_refctd_dynamic_array<core::smart_refctd_dynamic_array<core::smart_refctd_ptr<SamplerType>>>(immSamplerCount);

			size_t immSamplersOffset = 0u;
			for (size_t i = 0ull; i < bndCount; ++i)
			{
				auto& bnd_out = m_bindings->operator[](i);
				const auto& bnd_in = _begin[i];

				bnd_out.type = bnd_in.type;
				bnd_out.count = bnd_in.count;
				bnd_out.stageFlags = bnd_in.stageFlags;
				bnd_out.samplers = nullptr;
				if (bnd_in.type==EDT_COMBINED_IMAGE_SAMPLER && bnd_in.samplers)
				{
					bnd_out.samplers = reinterpret_cast<const core::smart_refctd_ptr<SamplerType>*>(immSamplersOffset);
					for (uint32_t s = 0ull; s < bnd_in.count; ++s)
						m_samplers->operator[](immSamplersOffset+s) = bnd_in.samplers[s];
					immSamplersOffset += bnd_in.count;
				}
			}

			for (size_t i = 0ull; i < m_bindings->size(); ++i)
			{
				auto& bnd = m_bindings->operator[](i);

				static_assert(sizeof(size_t)==sizeof(bnd.samplers), "Bad reinterpret_cast!");
				if (bnd.type==EDT_COMBINED_IMAGE_SAMPLER && bnd.samplers)
					bnd.samplers = m_samplers->data() + reinterpret_cast<size_t>(bnd.samplers);
			}
		}
		virtual ~IDescriptorSetLayout() = default;

		core::smart_refctd_dynamic_array<SBinding> m_bindings;
		core::smart_refctd_dynamic_array<core::smart_refctd_ptr<SamplerType>> m_samplers;

	public:
		bool isIdenticallyDefined(const IDescriptorSetLayout<SamplerType>* _other) const
		{
			if (getBindings().length() != _other->getBindings().length())
				return false;

			const size_t cnt = getBindings().length();
			const SBinding* lhs = getBindings().begin();
			const SBinding* rhs = _other->getBindings().begin();
			for (size_t i = 0ull; i < cnt; ++i)
				if (lhs[i] != rhs[i])
					return false;
			return true;
		}

		core::SRange<const SBinding> getBindings() const { return {m_bindings->data(), m_bindings->data()+m_bindings->size()}; }
};

}
}

#endif