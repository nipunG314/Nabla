#ifndef __IRR_ASSET_TRAITS_H_INCLUDED__
#define __IRR_ASSET_TRAITS_H_INCLUDED__

#include "IGPUBuffer.h"
#include "ITexture.h"
#include "IMeshBuffer.h"
#include "irr/asset/ICPUMeshBuffer.h"
#include "IMesh.h"
#include "irr/asset/ICPUMesh.h"

namespace irr { namespace video
{

template<typename AssetType>
struct asset_traits;

template<>
struct asset_traits<asset::ICPUBuffer> { using GPUObjectType = video::IGPUBuffer; };
template<>
struct asset_traits<asset::ICPUMeshBuffer> { using GPUObjectType = video::IGPUMeshBuffer; };
template<>
struct asset_traits<asset::ICPUMesh> { using GPUObjectType = scene::IGPUMesh; };
template<>
struct asset_traits<asset::ICPUTexture> { using GPUObjectType = video::ITexture; };

}}

#endif //__IRR_ASSET_TRAITS_H_INCLUDED__