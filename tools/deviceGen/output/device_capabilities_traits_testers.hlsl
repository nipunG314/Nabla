// Limits Testers
// VK 1.0
NBL_GENERATE_MEMBER_TESTER(maxImageDimension1D);
NBL_GENERATE_MEMBER_TESTER(maxImageDimension2D);
NBL_GENERATE_MEMBER_TESTER(maxImageDimension3D);
NBL_GENERATE_MEMBER_TESTER(maxImageDimensionCube);
NBL_GENERATE_MEMBER_TESTER(maxImageArrayLayers);
NBL_GENERATE_MEMBER_TESTER(maxBufferViewTexels);
NBL_GENERATE_MEMBER_TESTER(maxUBOSize);
NBL_GENERATE_MEMBER_TESTER(maxSSBOSize);
NBL_GENERATE_MEMBER_TESTER(maxPushConstantsSize);
NBL_GENERATE_MEMBER_TESTER(maxMemoryAllocationCount);
NBL_GENERATE_MEMBER_TESTER(maxSamplerAllocationCount);
NBL_GENERATE_MEMBER_TESTER(bufferImageGranularity);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorSamplers);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorUBOs);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorSSBOs);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorImages);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorStorageImages);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorInputAttachments);
NBL_GENERATE_MEMBER_TESTER(maxPerStageResources);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetSamplers);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetUBOs);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetDynamicOffsetUBOs);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetSSBOs);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetDynamicOffsetSSBOs);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetImages);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetStorageImages);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetInputAttachments);
NBL_GENERATE_MEMBER_TESTER(maxVertexOutputComponents);
NBL_GENERATE_MEMBER_TESTER(maxWorkgroupSize[3]);
NBL_GENERATE_MEMBER_TESTER(subPixelPrecisionBits);
NBL_GENERATE_MEMBER_TESTER(subTexelPrecisionBits);
NBL_GENERATE_MEMBER_TESTER(mipmapPrecisionBits);
NBL_GENERATE_MEMBER_TESTER(maxDrawIndirectCount);
NBL_GENERATE_MEMBER_TESTER(maxSamplerLodBias);
NBL_GENERATE_MEMBER_TESTER(maxSamplerAnisotropyLog2);
NBL_GENERATE_MEMBER_TESTER(maxViewports);
NBL_GENERATE_MEMBER_TESTER(maxViewportDims[2]);
NBL_GENERATE_MEMBER_TESTER(viewportBoundsRange[2]);
NBL_GENERATE_MEMBER_TESTER(viewportSubPixelBits);
NBL_GENERATE_MEMBER_TESTER(minMemoryMapAlignment);
NBL_GENERATE_MEMBER_TESTER(bufferViewAlignment);
NBL_GENERATE_MEMBER_TESTER(minUBOAlignment);
NBL_GENERATE_MEMBER_TESTER(minSSBOAlignment);
NBL_GENERATE_MEMBER_TESTER(minTexelOffset);
NBL_GENERATE_MEMBER_TESTER(maxTexelOffset);
NBL_GENERATE_MEMBER_TESTER(minTexelGatherOffset);
NBL_GENERATE_MEMBER_TESTER(maxTexelGatherOffset);
NBL_GENERATE_MEMBER_TESTER(minInterpolationOffset);
NBL_GENERATE_MEMBER_TESTER(maxInterpolationOffset);
NBL_GENERATE_MEMBER_TESTER(subPixelInterpolationOffsetBits);
NBL_GENERATE_MEMBER_TESTER(maxFramebufferWidth);
NBL_GENERATE_MEMBER_TESTER(maxFramebufferHeight);
NBL_GENERATE_MEMBER_TESTER(maxFramebufferLayers);
NBL_GENERATE_MEMBER_TESTER(maxSampleMaskWords);
NBL_GENERATE_MEMBER_TESTER(maxClipDistances);
NBL_GENERATE_MEMBER_TESTER(maxCullDistances);
NBL_GENERATE_MEMBER_TESTER(maxCombinedClipAndCullDistances);
NBL_GENERATE_MEMBER_TESTER(discreteQueuePriorities);
NBL_GENERATE_MEMBER_TESTER(pointSizeRange[2]);
NBL_GENERATE_MEMBER_TESTER(lineWidthRange[2]);
NBL_GENERATE_MEMBER_TESTER(pointSizeGranularity);
NBL_GENERATE_MEMBER_TESTER(lineWidthGranularity);
NBL_GENERATE_MEMBER_TESTER(strictLines);
NBL_GENERATE_MEMBER_TESTER(standardSampleLocations);
NBL_GENERATE_MEMBER_TESTER(optimalBufferCopyOffsetAlignment);
NBL_GENERATE_MEMBER_TESTER(optimalBufferCopyRowPitchAlignment);
NBL_GENERATE_MEMBER_TESTER(nonCoherentAtomSize);
// VK 1.1
NBL_GENERATE_MEMBER_TESTER(subgroupSize);
NBL_GENERATE_MEMBER_TESTER(subgroupOpsShaderStages);
NBL_GENERATE_MEMBER_TESTER(shaderSubgroupClustered);
NBL_GENERATE_MEMBER_TESTER(shaderSubgroupArithmetic);
NBL_GENERATE_MEMBER_TESTER(shaderSubgroupQuad);
NBL_GENERATE_MEMBER_TESTER(shaderSubgroupQuadAllStages);
NBL_GENERATE_MEMBER_TESTER(pointClippingBehavior);
NBL_GENERATE_MEMBER_TESTER(maxMultiviewViewCount);
NBL_GENERATE_MEMBER_TESTER(maxMultiviewInstanceIndex);
NBL_GENERATE_MEMBER_TESTER(maxPerSetDescriptors);
NBL_GENERATE_MEMBER_TESTER(maxMemoryAllocationSize);
// VK 1.2
NBL_GENERATE_MEMBER_TESTER(shaderSignedZeroInfNanPreserveFloat64);
NBL_GENERATE_MEMBER_TESTER(shaderDenormPreserveFloat16);
NBL_GENERATE_MEMBER_TESTER(shaderDenormPreserveFloat32);
NBL_GENERATE_MEMBER_TESTER(shaderDenormPreserveFloat64);
NBL_GENERATE_MEMBER_TESTER(shaderDenormFlushToZeroFloat16);
NBL_GENERATE_MEMBER_TESTER(shaderDenormFlushToZeroFloat32);
NBL_GENERATE_MEMBER_TESTER(shaderDenormFlushToZeroFloat64);
NBL_GENERATE_MEMBER_TESTER(shaderRoundingModeRTEFloat16);
NBL_GENERATE_MEMBER_TESTER(shaderRoundingModeRTEFloat32);
NBL_GENERATE_MEMBER_TESTER(shaderRoundingModeRTEFloat64);
NBL_GENERATE_MEMBER_TESTER(shaderRoundingModeRTZFloat16);
NBL_GENERATE_MEMBER_TESTER(shaderRoundingModeRTZFloat32);
NBL_GENERATE_MEMBER_TESTER(shaderRoundingModeRTZFloat64);
NBL_GENERATE_MEMBER_TESTER(maxUpdateAfterBindDescriptorsInAllPools);
NBL_GENERATE_MEMBER_TESTER(shaderUniformBufferArrayNonUniformIndexingNative);
NBL_GENERATE_MEMBER_TESTER(shaderSampledImageArrayNonUniformIndexingNative);
NBL_GENERATE_MEMBER_TESTER(shaderStorageBufferArrayNonUniformIndexingNative);
NBL_GENERATE_MEMBER_TESTER(shaderStorageImageArrayNonUniformIndexingNative);
NBL_GENERATE_MEMBER_TESTER(shaderInputAttachmentArrayNonUniformIndexingNative);
NBL_GENERATE_MEMBER_TESTER(robustBufferAccessUpdateAfterBind);
NBL_GENERATE_MEMBER_TESTER(quadDivergentImplicitLod);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorUpdateAfterBindSamplers);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorUpdateAfterBindUBOs);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorUpdateAfterBindSSBOs);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorUpdateAfterBindImages);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorUpdateAfterBindStorageImages);
NBL_GENERATE_MEMBER_TESTER(maxPerStageDescriptorUpdateAfterBindInputAttachments);
NBL_GENERATE_MEMBER_TESTER(maxPerStageUpdateAfterBindResources);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetUpdateAfterBindSamplers);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetUpdateAfterBindUBOs);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetUpdateAfterBindDynamicOffsetUBOs);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetUpdateAfterBindSSBOs);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetUpdateAfterBindDynamicOffsetSSBOs);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetUpdateAfterBindImages);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetUpdateAfterBindStorageImages);
NBL_GENERATE_MEMBER_TESTER(maxDescriptorSetUpdateAfterBindInputAttachments);
NBL_GENERATE_MEMBER_TESTER(supportedDepthResolveModes);
NBL_GENERATE_MEMBER_TESTER(supportedStencilResolveModes);
NBL_GENERATE_MEMBER_TESTER(independentResolveNone);
NBL_GENERATE_MEMBER_TESTER(independentResolve);
// VK 1.3
NBL_GENERATE_MEMBER_TESTER(minSubgroupSize);
NBL_GENERATE_MEMBER_TESTER(maxSubgroupSize);
NBL_GENERATE_MEMBER_TESTER(maxComputeWorkgroupSubgroups);
NBL_GENERATE_MEMBER_TESTER(requiredSubgroupSizeStages);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct8BitUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct8BitSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct8BitMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct4x8BitPackedUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct4x8BitPackedSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct4x8BitPackedMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct16BitUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct16BitSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct16BitMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct32BitUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct32BitSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct32BitMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct64BitUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct64BitSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProduct64BitMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating8BitUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating8BitSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating16BitUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating16BitSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating32BitUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating32BitSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating64BitUnsignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating64BitSignedAccelerated);
NBL_GENERATE_MEMBER_TESTER(integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated);
NBL_GENERATE_MEMBER_TESTER(maxBufferSize);
// Nabla Core Extensions
// Extensions
NBL_GENERATE_MEMBER_TESTER(shaderTrinaryMinmax);
NBL_GENERATE_MEMBER_TESTER(shaderExplicitVertexParameter);
NBL_GENERATE_MEMBER_TESTER(gpuShaderHalfFloatAMD);
NBL_GENERATE_MEMBER_TESTER(shaderImageLoadStoreLod);
NBL_GENERATE_MEMBER_TESTER(queueFamilyForeign);
NBL_GENERATE_MEMBER_TESTER(shaderStencilExport);
NBL_GENERATE_MEMBER_TESTER(postDepthCoverage);
NBL_GENERATE_MEMBER_TESTER(decorateString);
NBL_GENERATE_MEMBER_TESTER(shaderNonSemanticInfo);
NBL_GENERATE_MEMBER_TESTER(shaderEarlyAndLateFragmentTests);
NBL_GENERATE_MEMBER_TESTER(fragmentShaderBarycentric);
NBL_GENERATE_MEMBER_TESTER(logicOp);
NBL_GENERATE_MEMBER_TESTER(vertexPipelineStoresAndAtomics);
NBL_GENERATE_MEMBER_TESTER(fragmentStoresAndAtomics);
NBL_GENERATE_MEMBER_TESTER(shaderTessellationAndGeometryPointSize);
NBL_GENERATE_MEMBER_TESTER(shaderStorageImageMultisample);
NBL_GENERATE_MEMBER_TESTER(shaderStorageImageReadWithoutFormat);
NBL_GENERATE_MEMBER_TESTER(shaderStorageImageArrayDynamicIndexing);
NBL_GENERATE_MEMBER_TESTER(shaderFloat64);
NBL_GENERATE_MEMBER_TESTER(variableMultisampleRate);
NBL_GENERATE_MEMBER_TESTER(drawIndirectCount);
NBL_GENERATE_MEMBER_TESTER(storagePushConstant8);
NBL_GENERATE_MEMBER_TESTER(shaderFloat16);
NBL_GENERATE_MEMBER_TESTER(samplerFilterMinmax);
NBL_GENERATE_MEMBER_TESTER(vulkanMemoryModelAvailabilityVisibilityChains);
// Nabla
NBL_GENERATE_MEMBER_TESTER(computeUnits);
NBL_GENERATE_MEMBER_TESTER(dispatchBase);
NBL_GENERATE_MEMBER_TESTER(allowCommandBufferQueryCopies);
NBL_GENERATE_MEMBER_TESTER(maxOptimallyResidentWorkgroupInvocations);
NBL_GENERATE_MEMBER_TESTER(maxResidentInvocations);
NBL_GENERATE_MEMBER_TESTER(spirvVersion);

// Features Testers
// VK 1.0
NBL_GENERATE_MEMBER_TESTER(robustBufferAccess);
NBL_GENERATE_MEMBER_TESTER(depthBounds);
NBL_GENERATE_MEMBER_TESTER(wideLines);
NBL_GENERATE_MEMBER_TESTER(largePoints);
NBL_GENERATE_MEMBER_TESTER(alphaToOne);
NBL_GENERATE_MEMBER_TESTER(pipelineStatisticsQuery);
NBL_GENERATE_MEMBER_TESTER(shaderCullDistance);
// VK 1.1
// VK 1.2
NBL_GENERATE_MEMBER_TESTER(bufferDeviceAddressMultiDevice);
// VK 1.3
// Nabla Core Extensions
NBL_GENERATE_MEMBER_TESTER(robustBufferAccess2);
NBL_GENERATE_MEMBER_TESTER(robustImageAccess2);
// Extensions
// Nabla