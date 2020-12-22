#ifndef _COMMON_INCLUDED_
#define _COMMON_INCLUDED_

#define MAX_ACCUMULATED_SAMPLES (1024*1024)


#ifdef __cplusplus
	#define mat4 nbl::core::matrix4SIMD
	#define mat4x3 nbl::core::matrix3x4SIMD
#endif


struct SLight
{
	#ifdef __cplusplus
	SLight() : obb() {}
	SLight(const SLight& other) : obb(other.obb) {}
	SLight(const nbl::core::aabbox3df& bbox, const nbl::core::matrix3x4SIMD& tform) : SLight()
	{
		auto extent = bbox.getExtent();
		obb.setScale(nbl::core::vectorSIMDf(extent.X,extent.Y,extent.Z));
		obb.setTranslation(nbl::core::vectorSIMDf(bbox.MinEdge.X,bbox.MinEdge.Y,bbox.MinEdge.Z));

		obb = nbl::core::concatenateBFollowedByA(tform,obb);
	}
	
	inline SLight& operator=(SLight&& other) noexcept
	{
		std::swap(obb, other.obb);

		return *this;
	}

	// also known as an upper bound on lumens put into the scene
	inline float computeFluxBound(const nbl::core::vectorSIMDf& radiance) const
	{
		const nbl::core::vectorSIMDf rec709LumaCoeffs(0.2126f, 0.7152f, 0.0722f, 0.f);
		const auto unitHemisphereArea = 2.f*nbl::core::PI<float>();
				
		const auto unitBoxScale = obb.getScale();
		const float obbArea = 2.f*(unitBoxScale.x*unitBoxScale.y+unitBoxScale.x*unitBoxScale.z+unitBoxScale.y*unitBoxScale.z);
				
		return nbl::core::dot(radiance,rec709LumaCoeffs).x*unitHemisphereArea*obbArea;
	}
	#endif

	mat4x3 obb; // needs row_major qualifier
};


#endif