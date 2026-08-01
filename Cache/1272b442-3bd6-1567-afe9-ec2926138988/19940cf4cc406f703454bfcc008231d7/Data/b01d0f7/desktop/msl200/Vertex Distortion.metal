#pragma clang diagnostic ignored "-Wmissing-prototypes"
#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
return 0;
}
}
#ifndef sc_TextureRenderingLayout_Regular
#define sc_TextureRenderingLayout_Regular 0
#define sc_TextureRenderingLayout_StereoInstancedClipped 1
#define sc_TextureRenderingLayout_StereoMultiview 2
#endif
// SCC_BACKEND_SHADER_FLAGS_BEGIN__
// SCC_BACKEND_SHADER_FLAG_DISABLE_FRUSTUM_CULLING
// SCC_BACKEND_SHADER_FLAGS_END__
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 sc_FragData0 0
//output uvec4 sc_RayTracingPositionAndMask 0
//output uvec4 sc_RayTracingNormalAndMore 1
//sampler sampler intensityTextureSmpSC 0:19
//sampler sampler sc_EnvmapDiffuseSmpSC 0:20
//sampler sampler sc_EnvmapSpecularSmpSC 0:21
//sampler sampler sc_RayTracingGlobalIlluminationSmpSC 0:23
//sampler sampler sc_RayTracingReflectionsSmpSC 0:24
//sampler sampler sc_RayTracingShadowsSmpSC 0:25
//sampler sampler sc_SSAOTextureSmpSC 0:26
//sampler sampler sc_ScreenTextureSmpSC 0:27
//sampler sampler sc_ShadowTextureSmpSC 0:28
//texture texture2D intensityTexture 0:1:0:19
//texture texture2D sc_EnvmapDiffuse 0:2:0:20
//texture texture2D sc_EnvmapSpecular 0:3:0:21
//texture texture2D sc_RayTracingGlobalIllumination 0:12:0:23
//texture texture2D sc_RayTracingReflections 0:13:0:24
//texture texture2D sc_RayTracingShadows 0:14:0:25
//texture texture2D sc_SSAOTexture 0:15:0:26
//texture texture2D sc_ScreenTexture 0:16:0:27
//texture texture2D sc_ShadowTexture 0:17:0:28
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:30:4720 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapSpecularSize 1136
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float4x4 sc_PrevFrameModelMatrix 3248
//float3 sc_LocalAabbMin 3376
//float3 sc_LocalAabbMax 3392
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float4 weights0 3616
//float4 weights1 3632
//float4 sc_StereoClipPlanes 3664:[2]:16
//float2 sc_TAAJitterOffset 3704
//int sc_RayTracingReceiverEffectsMask 3824
//float3 sc_RayTracingOriginScale 3984
//uint sc_RayTracingReceiverMask 4000
//float3 sc_RayTracingOriginOffset 4032
//uint sc_RayTracingReceiverId 4048
//float4 voxelization_params_0 4064
//float4 voxelization_params_frustum_lrbt 4080
//float4 voxelization_params_frustum_nf 4096
//float3 voxelization_params_camera_pos 4112
//float4x4 sc_ModelMatrixVoxelization 4128
//float correctedIntensity 4192
//float3x3 intensityTextureTransform 4256
//float4 intensityTextureUvMinMax 4304
//float4 intensityTextureBorderColor 4320
//int PreviewEnabled 4484
//float alphaTestThreshold 4492
//float strength 4496
//float noiseScale 4500
//float animatedSpeed 4504
//float offset 4508
//float Port_Import_N046 4516
//float Port_Import_N037 4560
//float Port_Input1_N038 4564
//float Port_Input2_N038 4568
//float Port_Import_N054 4592
//float2 Port_Scale_N017 4600
//float3 Port_Albedo_N006 4608
//float Port_Opacity_N006 4624
//float3 Port_Emissive_N006 4656
//float Port_Metallic_N006 4672
//float Port_Roughness_N006 4676
//float3 Port_AO_N006 4688
//float3 Port_SpecularAO_N006 4704
//}
//spec_const bool BLEND_MODE_AVERAGE 0 0
//spec_const bool BLEND_MODE_BRIGHT 1 0
//spec_const bool BLEND_MODE_COLOR_BURN 2 0
//spec_const bool BLEND_MODE_COLOR_DODGE 3 0
//spec_const bool BLEND_MODE_COLOR 4 0
//spec_const bool BLEND_MODE_DARKEN 5 0
//spec_const bool BLEND_MODE_DIFFERENCE 6 0
//spec_const bool BLEND_MODE_DIVIDE 7 0
//spec_const bool BLEND_MODE_DIVISION 8 0
//spec_const bool BLEND_MODE_EXCLUSION 9 0
//spec_const bool BLEND_MODE_FORGRAY 10 0
//spec_const bool BLEND_MODE_HARD_GLOW 11 0
//spec_const bool BLEND_MODE_HARD_LIGHT 12 0
//spec_const bool BLEND_MODE_HARD_MIX 13 0
//spec_const bool BLEND_MODE_HARD_PHOENIX 14 0
//spec_const bool BLEND_MODE_HARD_REFLECT 15 0
//spec_const bool BLEND_MODE_HUE 16 0
//spec_const bool BLEND_MODE_INTENSE 17 0
//spec_const bool BLEND_MODE_LIGHTEN 18 0
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19 0
//spec_const bool BLEND_MODE_LUMINOSITY 20 0
//spec_const bool BLEND_MODE_NEGATION 21 0
//spec_const bool BLEND_MODE_NOTBRIGHT 22 0
//spec_const bool BLEND_MODE_OVERLAY 23 0
//spec_const bool BLEND_MODE_PIN_LIGHT 24 0
//spec_const bool BLEND_MODE_REALISTIC 25 0
//spec_const bool BLEND_MODE_SATURATION 26 0
//spec_const bool BLEND_MODE_SOFT_LIGHT 27 0
//spec_const bool BLEND_MODE_SUBTRACT 28 0
//spec_const bool BLEND_MODE_VIVID_LIGHT 29 0
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 31 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 32 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 33 0
//spec_const bool UseViewSpaceDepthVariant 34 1
//spec_const bool animated 35 0
//spec_const bool intensityTextureHasSwappedViews 36 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 37 0
//spec_const bool sc_BlendMode_Add 38 0
//spec_const bool sc_BlendMode_AlphaTest 39 0
//spec_const bool sc_BlendMode_AlphaToCoverage 40 0
//spec_const bool sc_BlendMode_ColoredGlass 41 0
//spec_const bool sc_BlendMode_Custom 42 0
//spec_const bool sc_BlendMode_Max 43 0
//spec_const bool sc_BlendMode_Min 44 0
//spec_const bool sc_BlendMode_MultiplyOriginal 45 0
//spec_const bool sc_BlendMode_Multiply 46 0
//spec_const bool sc_BlendMode_Normal 47 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 48 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 49 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 50 0
//spec_const bool sc_BlendMode_Screen 51 0
//spec_const bool sc_DepthOnly 52 0
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 53 0
//spec_const bool sc_EnvmapSpecularHasSwappedViews 54 0
//spec_const bool sc_FramebufferFetch 55 0
//spec_const bool sc_HasDiffuseEnvmap 56 0
//spec_const bool sc_IsEditor 57 0
//spec_const bool sc_LightEstimation 58 0
//spec_const bool sc_MotionVectorsPass 59 0
//spec_const bool sc_OITCompositingPass 60 0
//spec_const bool sc_OITDepthBoundsPass 61 0
//spec_const bool sc_OITDepthGatherPass 62 0
//spec_const bool sc_OutputBounds 63 0
//spec_const bool sc_ProjectiveShadowsCaster 64 0
//spec_const bool sc_ProjectiveShadowsReceiver 65 0
//spec_const bool sc_RayTracingGlobalIlluminationHasSwappedViews 66 0
//spec_const bool sc_RayTracingReflectionsHasSwappedViews 67 0
//spec_const bool sc_RayTracingShadowsHasSwappedViews 68 0
//spec_const bool sc_RenderAlphaToColor 69 0
//spec_const bool sc_SSAOEnabled 70 0
//spec_const bool sc_ScreenTextureHasSwappedViews 71 0
//spec_const bool sc_TAAEnabled 72 0
//spec_const bool sc_VertexBlendingUseNormals 73 0
//spec_const bool sc_VertexBlending 74 0
//spec_const bool sc_Voxelization 75 0
//spec_const int SC_DEVICE_CLASS 76 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 77 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 78 -1
//spec_const int intensityTextureLayout 79 0
//spec_const int sc_AmbientLightMode0 80 0
//spec_const int sc_AmbientLightMode1 81 0
//spec_const int sc_AmbientLightMode2 82 0
//spec_const int sc_AmbientLightMode_Constant 83 0
//spec_const int sc_AmbientLightMode_EnvironmentMap 84 0
//spec_const int sc_AmbientLightMode_FromCamera 85 0
//spec_const int sc_AmbientLightMode_SphericalHarmonics 86 0
//spec_const int sc_AmbientLightsCount 87 0
//spec_const int sc_DepthBufferMode 88 0
//spec_const int sc_DirectionalLightsCount 89 0
//spec_const int sc_EnvLightMode 90 0
//spec_const int sc_EnvmapDiffuseLayout 91 0
//spec_const int sc_EnvmapSpecularLayout 92 0
//spec_const int sc_LightEstimationSGCount 93 0
//spec_const int sc_PointLightsCount 94 0
//spec_const int sc_RayTracingGlobalIlluminationLayout 95 0
//spec_const int sc_RayTracingReflectionsLayout 96 0
//spec_const int sc_RayTracingShadowsLayout 97 0
//spec_const int sc_RenderingSpace 98 -1
//spec_const int sc_ScreenTextureLayout 99 0
//spec_const int sc_ShaderCacheConstant 100 0
//spec_const int sc_SkinBonesCount 101 0
//spec_const int sc_StereoRenderingMode 102 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 103 0
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(32)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(33)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool UseViewSpaceDepthVariant [[function_constant(34)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool animated [[function_constant(35)]];
constant bool animated_tmp = is_function_constant_defined(animated) ? animated : false;
constant bool intensityTextureHasSwappedViews [[function_constant(36)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(37)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(38)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(39)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(40)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(41)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(42)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(43)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(44)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(45)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(46)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(47)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(48)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(49)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(50)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(51)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(52)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(53)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(54)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(55)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(56)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_IsEditor [[function_constant(57)]];
constant bool sc_IsEditor_tmp = is_function_constant_defined(sc_IsEditor) ? sc_IsEditor : false;
constant bool sc_LightEstimation [[function_constant(58)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(59)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(60)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(61)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(62)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OutputBounds [[function_constant(63)]];
constant bool sc_OutputBounds_tmp = is_function_constant_defined(sc_OutputBounds) ? sc_OutputBounds : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(64)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(65)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RayTracingGlobalIlluminationHasSwappedViews [[function_constant(66)]];
constant bool sc_RayTracingGlobalIlluminationHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingGlobalIlluminationHasSwappedViews) ? sc_RayTracingGlobalIlluminationHasSwappedViews : false;
constant bool sc_RayTracingReflectionsHasSwappedViews [[function_constant(67)]];
constant bool sc_RayTracingReflectionsHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingReflectionsHasSwappedViews) ? sc_RayTracingReflectionsHasSwappedViews : false;
constant bool sc_RayTracingShadowsHasSwappedViews [[function_constant(68)]];
constant bool sc_RayTracingShadowsHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracingShadowsHasSwappedViews) ? sc_RayTracingShadowsHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(69)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(70)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(71)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_TAAEnabled [[function_constant(72)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(73)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(74)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sc_Voxelization [[function_constant(75)]];
constant bool sc_Voxelization_tmp = is_function_constant_defined(sc_Voxelization) ? sc_Voxelization : false;
constant int SC_DEVICE_CLASS [[function_constant(76)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(77)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(78)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int intensityTextureLayout [[function_constant(79)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(80)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(81)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(82)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(83)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(84)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(85)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(86)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(87)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(88)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(89)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(90)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(91)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(92)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(93)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_PointLightsCount [[function_constant(94)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracingGlobalIlluminationLayout [[function_constant(95)]];
constant int sc_RayTracingGlobalIlluminationLayout_tmp = is_function_constant_defined(sc_RayTracingGlobalIlluminationLayout) ? sc_RayTracingGlobalIlluminationLayout : 0;
constant int sc_RayTracingReflectionsLayout [[function_constant(96)]];
constant int sc_RayTracingReflectionsLayout_tmp = is_function_constant_defined(sc_RayTracingReflectionsLayout) ? sc_RayTracingReflectionsLayout : 0;
constant int sc_RayTracingShadowsLayout [[function_constant(97)]];
constant int sc_RayTracingShadowsLayout_tmp = is_function_constant_defined(sc_RayTracingShadowsLayout) ? sc_RayTracingShadowsLayout : 0;
constant int sc_RenderingSpace [[function_constant(98)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(99)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(100)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(101)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(102)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(103)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 SurfacePosition_ObjectSpace;
float3 VertexNormal_WorldSpace;
float3 VertexNormal_ObjectSpace;
float2 gTriplanarCoords;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int sc_RayTracingReceiverEffectsMask;
float4 sc_RayTracingReflectionsSize;
float4 sc_RayTracingReflectionsDims;
float4 sc_RayTracingReflectionsView;
float4 sc_RayTracingGlobalIlluminationSize;
float4 sc_RayTracingGlobalIlluminationDims;
float4 sc_RayTracingGlobalIlluminationView;
float4 sc_RayTracingShadowsSize;
float4 sc_RayTracingShadowsDims;
float4 sc_RayTracingShadowsView;
float3 sc_RayTracingOriginScale;
uint sc_RayTracingReceiverMask;
float3 sc_RayTracingOriginScaleInv;
float3 sc_RayTracingOriginOffset;
uint sc_RayTracingReceiverId;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float strength;
float noiseScale;
float animatedSpeed;
float offset;
float Port_Import_N031;
float Port_Import_N046;
float3 Port_Import_N034;
float3 Port_Import_N029;
float Port_Import_N037;
float Port_Input1_N038;
float Port_Input2_N038;
float3 Port_Import_N064;
float Port_Import_N054;
float2 Port_Scale_N017;
float3 Port_Albedo_N006;
float Port_Opacity_N006;
float3 Port_Normal_N006;
float3 Port_Emissive_N006;
float Port_Metallic_N006;
float Port_Roughness_N006;
float3 Port_AO_N006;
float3 Port_SpecularAO_N006;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> sc_EnvmapDiffuse [[id(2)]];
texture2d<float> sc_EnvmapSpecular [[id(3)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(12)]];
texture2d<float> sc_RayTracingReflections [[id(13)]];
texture2d<float> sc_RayTracingShadows [[id(14)]];
texture2d<float> sc_SSAOTexture [[id(15)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
texture2d<float> sc_ShadowTexture [[id(17)]];
sampler intensityTextureSmpSC [[id(19)]];
sampler sc_EnvmapDiffuseSmpSC [[id(20)]];
sampler sc_EnvmapSpecularSmpSC [[id(21)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(23)]];
sampler sc_RayTracingReflectionsSmpSC [[id(24)]];
sampler sc_RayTracingShadowsSmpSC [[id(25)]];
sampler sc_SSAOTextureSmpSC [[id(26)]];
sampler sc_ScreenTextureSmpSC [[id(27)]];
sampler sc_ShadowTextureSmpSC [[id(28)]];
constant userUniformsObj* UserUniforms [[id(30)]];
};
struct main_vert_out
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
float snoise(thread const float2& v)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 i=floor(v+float2(dot(v,float2(0.36602542))));
float2 x0=(v-i)+float2(dot(i,float2(0.21132487)));
float2 i1=float2(0.0);
bool2 l9_0=bool2(x0.x>x0.y);
i1=float2(l9_0.x ? float2(1.0,0.0).x : float2(0.0,1.0).x,l9_0.y ? float2(1.0,0.0).y : float2(0.0,1.0).y);
float2 x1=(x0+float2(0.21132487))-i1;
float2 x2=x0+float2(-0.57735026);
float2 param=i;
float2 l9_1=param-(floor(param*0.0034602077)*289.0);
i=l9_1;
float3 param_1=float3(i.y)+float3(0.0,i1.y,1.0);
float3 l9_2=((param_1*34.0)+float3(1.0))*param_1;
float3 l9_3=l9_2-(floor(l9_2*0.0034602077)*289.0);
float3 l9_4=l9_3;
float3 param_2=(l9_4+float3(i.x))+float3(0.0,i1.x,1.0);
float3 l9_5=((param_2*34.0)+float3(1.0))*param_2;
float3 l9_6=l9_5-(floor(l9_5*0.0034602077)*289.0);
float3 l9_7=l9_6;
float3 p=l9_7;
float3 m=fast::max(float3(0.5)-float3(dot(x0,x0),dot(x1,x1),dot(x2,x2)),float3(0.0));
m*=m;
m*=m;
float3 x=(fract(p*float3(0.024390243))*2.0)-float3(1.0);
float3 h=abs(x)-float3(0.5);
float3 ox=floor(x+float3(0.5));
float3 a0=x-ox;
m*=(float3(1.7928429)-(((a0*a0)+(h*h))*0.85373473));
float3 g=float3(0.0);
g.x=(a0.x*x0.x)+(h.x*x0.y);
float2 l9_8=(a0.yz*float2(x1.x,x2.x))+(h.yz*float2(x1.y,x2.y));
g=float3(g.x,l9_8.x,l9_8.y);
return 130.0*dot(m,g);
}
else
{
return 0.0;
}
}
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_2=param;
param=l9_2;
}
sc_Vertex_t l9_3=param;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_4=l9_3;
float3 l9_5=in.blendShape0Pos;
float3 l9_6=in.blendShape0Normal;
float l9_7=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_8=l9_4;
float3 l9_9=l9_5;
float l9_10=l9_7;
float3 l9_11=l9_8.position.xyz+(l9_9*l9_10);
l9_8.position=float4(l9_11.x,l9_11.y,l9_11.z,l9_8.position.w);
l9_4=l9_8;
l9_4.normal+=(l9_6*l9_7);
l9_3=l9_4;
sc_Vertex_t l9_12=l9_3;
float3 l9_13=in.blendShape1Pos;
float3 l9_14=in.blendShape1Normal;
float l9_15=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_16=l9_12;
float3 l9_17=l9_13;
float l9_18=l9_15;
float3 l9_19=l9_16.position.xyz+(l9_17*l9_18);
l9_16.position=float4(l9_19.x,l9_19.y,l9_19.z,l9_16.position.w);
l9_12=l9_16;
l9_12.normal+=(l9_14*l9_15);
l9_3=l9_12;
sc_Vertex_t l9_20=l9_3;
float3 l9_21=in.blendShape2Pos;
float3 l9_22=in.blendShape2Normal;
float l9_23=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_24=l9_20;
float3 l9_25=l9_21;
float l9_26=l9_23;
float3 l9_27=l9_24.position.xyz+(l9_25*l9_26);
l9_24.position=float4(l9_27.x,l9_27.y,l9_27.z,l9_24.position.w);
l9_20=l9_24;
l9_20.normal+=(l9_22*l9_23);
l9_3=l9_20;
}
else
{
sc_Vertex_t l9_28=l9_3;
float3 l9_29=in.blendShape0Pos;
float l9_30=(*sc_set0.UserUniforms).weights0.x;
float3 l9_31=l9_28.position.xyz+(l9_29*l9_30);
l9_28.position=float4(l9_31.x,l9_31.y,l9_31.z,l9_28.position.w);
l9_3=l9_28;
sc_Vertex_t l9_32=l9_3;
float3 l9_33=in.blendShape1Pos;
float l9_34=(*sc_set0.UserUniforms).weights0.y;
float3 l9_35=l9_32.position.xyz+(l9_33*l9_34);
l9_32.position=float4(l9_35.x,l9_35.y,l9_35.z,l9_32.position.w);
l9_3=l9_32;
sc_Vertex_t l9_36=l9_3;
float3 l9_37=in.blendShape2Pos;
float l9_38=(*sc_set0.UserUniforms).weights0.z;
float3 l9_39=l9_36.position.xyz+(l9_37*l9_38);
l9_36.position=float4(l9_39.x,l9_39.y,l9_39.z,l9_36.position.w);
l9_3=l9_36;
sc_Vertex_t l9_40=l9_3;
float3 l9_41=in.blendShape3Pos;
float l9_42=(*sc_set0.UserUniforms).weights0.w;
float3 l9_43=l9_40.position.xyz+(l9_41*l9_42);
l9_40.position=float4(l9_43.x,l9_43.y,l9_43.z,l9_40.position.w);
l9_3=l9_40;
sc_Vertex_t l9_44=l9_3;
float3 l9_45=in.blendShape4Pos;
float l9_46=(*sc_set0.UserUniforms).weights1.x;
float3 l9_47=l9_44.position.xyz+(l9_45*l9_46);
l9_44.position=float4(l9_47.x,l9_47.y,l9_47.z,l9_44.position.w);
l9_3=l9_44;
sc_Vertex_t l9_48=l9_3;
float3 l9_49=in.blendShape5Pos;
float l9_50=(*sc_set0.UserUniforms).weights1.y;
float3 l9_51=l9_48.position.xyz+(l9_49*l9_50);
l9_48.position=float4(l9_51.x,l9_51.y,l9_51.z,l9_48.position.w);
l9_3=l9_48;
}
}
param=l9_3;
sc_Vertex_t l9_52=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_53=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_53=float4(1.0,fract(in.boneData.yzw));
l9_53.x-=dot(l9_53.yzw,float3(1.0));
}
float4 l9_54=l9_53;
float4 l9_55=l9_54;
int l9_56=int(in.boneData.x);
int l9_57=int(in.boneData.y);
int l9_58=int(in.boneData.z);
int l9_59=int(in.boneData.w);
int l9_60=l9_56;
float4 l9_61=l9_52.position;
float3 l9_62=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_63=l9_60;
float4 l9_64=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[0];
float4 l9_65=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[1];
float4 l9_66=(*sc_set0.sc_BonesUBO).sc_Bones[l9_63].boneMatrix[2];
float4 l9_67[3];
l9_67[0]=l9_64;
l9_67[1]=l9_65;
l9_67[2]=l9_66;
l9_62=float3(dot(l9_61,l9_67[0]),dot(l9_61,l9_67[1]),dot(l9_61,l9_67[2]));
}
else
{
l9_62=l9_61.xyz;
}
float3 l9_68=l9_62;
float3 l9_69=l9_68;
float l9_70=l9_55.x;
int l9_71=l9_57;
float4 l9_72=l9_52.position;
float3 l9_73=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_74=l9_71;
float4 l9_75=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[0];
float4 l9_76=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[1];
float4 l9_77=(*sc_set0.sc_BonesUBO).sc_Bones[l9_74].boneMatrix[2];
float4 l9_78[3];
l9_78[0]=l9_75;
l9_78[1]=l9_76;
l9_78[2]=l9_77;
l9_73=float3(dot(l9_72,l9_78[0]),dot(l9_72,l9_78[1]),dot(l9_72,l9_78[2]));
}
else
{
l9_73=l9_72.xyz;
}
float3 l9_79=l9_73;
float3 l9_80=l9_79;
float l9_81=l9_55.y;
int l9_82=l9_58;
float4 l9_83=l9_52.position;
float3 l9_84=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_85=l9_82;
float4 l9_86=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[0];
float4 l9_87=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[1];
float4 l9_88=(*sc_set0.sc_BonesUBO).sc_Bones[l9_85].boneMatrix[2];
float4 l9_89[3];
l9_89[0]=l9_86;
l9_89[1]=l9_87;
l9_89[2]=l9_88;
l9_84=float3(dot(l9_83,l9_89[0]),dot(l9_83,l9_89[1]),dot(l9_83,l9_89[2]));
}
else
{
l9_84=l9_83.xyz;
}
float3 l9_90=l9_84;
float3 l9_91=l9_90;
float l9_92=l9_55.z;
int l9_93=l9_59;
float4 l9_94=l9_52.position;
float3 l9_95=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_96=l9_93;
float4 l9_97=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[0];
float4 l9_98=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[1];
float4 l9_99=(*sc_set0.sc_BonesUBO).sc_Bones[l9_96].boneMatrix[2];
float4 l9_100[3];
l9_100[0]=l9_97;
l9_100[1]=l9_98;
l9_100[2]=l9_99;
l9_95=float3(dot(l9_94,l9_100[0]),dot(l9_94,l9_100[1]),dot(l9_94,l9_100[2]));
}
else
{
l9_95=l9_94.xyz;
}
float3 l9_101=l9_95;
float3 l9_102=(((l9_69*l9_70)+(l9_80*l9_81))+(l9_91*l9_92))+(l9_101*l9_55.w);
l9_52.position=float4(l9_102.x,l9_102.y,l9_102.z,l9_52.position.w);
int l9_103=l9_56;
float3x3 l9_104=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_103].normalMatrix[2].xyz));
float3x3 l9_105=l9_104;
float3x3 l9_106=l9_105;
int l9_107=l9_57;
float3x3 l9_108=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_107].normalMatrix[2].xyz));
float3x3 l9_109=l9_108;
float3x3 l9_110=l9_109;
int l9_111=l9_58;
float3x3 l9_112=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_111].normalMatrix[2].xyz));
float3x3 l9_113=l9_112;
float3x3 l9_114=l9_113;
int l9_115=l9_59;
float3x3 l9_116=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_115].normalMatrix[2].xyz));
float3x3 l9_117=l9_116;
float3x3 l9_118=l9_117;
l9_52.normal=((((l9_106*l9_52.normal)*l9_55.x)+((l9_110*l9_52.normal)*l9_55.y))+((l9_114*l9_52.normal)*l9_55.z))+((l9_118*l9_52.normal)*l9_55.w);
l9_52.tangent=((((l9_106*l9_52.tangent)*l9_55.x)+((l9_110*l9_52.tangent)*l9_55.y))+((l9_114*l9_52.tangent)*l9_55.z))+((l9_118*l9_52.tangent)*l9_55.w);
}
param=l9_52;
if (sc_RenderingSpace_tmp==3)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPosAndMotion=float4(float3(0.0).x,float3(0.0).y,float3(0.0).z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPosAndMotion=float4(param.position.xyz.x,param.position.xyz.y,param.position.xyz.z,out.varPosAndMotion.w);
out.varNormalAndMotion=float4(param.normal.x,param.normal.y,param.normal.z,out.varNormalAndMotion.w);
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
float3 l9_119=((*sc_set0.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varPosAndMotion=float4(l9_119.x,l9_119.y,l9_119.z,out.varPosAndMotion.w);
float3 l9_120=(*sc_set0.UserUniforms).sc_NormalMatrix*param.normal;
out.varNormalAndMotion=float4(l9_120.x,l9_120.y,l9_120.z,out.varNormalAndMotion.w);
float3 l9_121=(*sc_set0.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_121.x,l9_121.y,l9_121.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(out.varPosAndMotion.xyz,1.0)).xyz;
Globals.VertexNormal_WorldSpace=out.varNormalAndMotion.xyz;
Globals.VertexNormal_ObjectSpace=normalize(((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Globals.VertexNormal_WorldSpace,0.0)).xyz);
Globals.gTriplanarCoords=float2(0.0);
float3 WorldPosition=out.varPosAndMotion.xyz;
float3 WorldNormal=out.varNormalAndMotion.xyz;
float3 WorldTangent=out.varTangent.xyz;
float3 Position_N0=float3(0.0);
Position_N0=Globals.SurfacePosition_ObjectSpace;
float Output_N11=0.0;
float param_1=(*sc_set0.UserUniforms).strength;
Output_N11=param_1;
float Value_N31=0.0;
Value_N31=Output_N11;
float3 AABBMax_N41=float3(0.0);
AABBMax_N41=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 AABBMin_N42=float3(0.0);
AABBMin_N42=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 Output_N44=float3(0.0);
Output_N44=AABBMax_N41-AABBMin_N42;
float Output_N45=0.0;
Output_N45=length(Output_N44);
float Value_N46=0.0;
Value_N46=(*sc_set0.UserUniforms).Port_Import_N046;
float Output_N28=0.0;
Output_N28=(Value_N31*Output_N45)*Value_N46;
float Export_N47=0.0;
Export_N47=Output_N28;
float Output_N39=0.0;
float param_2=0.0;
float3 param_3=float3(0.0);
float3 param_4=float3(0.0,1.0,0.0);
float3 param_5=float3(1.0);
float3 param_6=float3(0.0);
float param_7=1.0;
ssGlobals param_9=Globals;
float l9_122=0.0;
float l9_123=(*sc_set0.UserUniforms).noiseScale;
l9_122=l9_123;
float3 l9_124=float3(0.0);
l9_124=float3(l9_122);
param_5=l9_124;
float l9_125=0.0;
float l9_126=0.0;
float l9_127=0.0;
ssGlobals l9_128=param_9;
float l9_129;
if ((int(animated_tmp)!=0))
{
float l9_130=0.0;
float l9_131=(*sc_set0.UserUniforms).animatedSpeed;
l9_130=l9_131;
float l9_132=0.0;
l9_132=l9_128.gTimeElapsed*l9_130;
float l9_133=0.0;
float l9_134=(*sc_set0.UserUniforms).offset;
l9_133=l9_134;
float l9_135=0.0;
l9_135=l9_132+l9_133;
l9_126=l9_135;
l9_129=l9_126;
}
else
{
float l9_136=0.0;
float l9_137=(*sc_set0.UserUniforms).offset;
l9_136=l9_137;
l9_127=l9_136;
l9_129=l9_127;
}
l9_125=l9_129;
float3 l9_138=float3(0.0);
l9_138=float3(l9_125);
param_6=l9_138;
float l9_139=0.0;
l9_139=(*sc_set0.UserUniforms).Port_Import_N037;
float l9_140=0.0;
l9_140=fast::clamp(l9_139+0.001,(*sc_set0.UserUniforms).Port_Input1_N038+0.001,(*sc_set0.UserUniforms).Port_Input2_N038+0.001)-0.001;
param_7=l9_140;
float3 l9_141=float3(0.0);
l9_141=param_9.SurfacePosition_ObjectSpace;
float3 l9_142=float3(0.0);
l9_142=l9_141;
float3 l9_143=float3(0.0);
l9_143=(*sc_set0.UserUniforms).sc_LocalAabbMax;
float3 l9_144=float3(0.0);
l9_144=(*sc_set0.UserUniforms).sc_LocalAabbMin;
float3 l9_145=float3(0.0);
l9_145=l9_143-l9_144;
float l9_146=0.0;
l9_146=length(l9_145);
float3 l9_147=float3(0.0);
l9_147=l9_142/(float3(l9_146)+float3(1.234e-06));
float3 l9_148=float3(0.0);
l9_148=l9_147;
float l9_149=0.0;
l9_149=fast::max((*sc_set0.UserUniforms).Port_Import_N054,0.0);
float3 l9_150=float3(0.0);
l9_150=l9_148*float3(l9_149);
param_3=l9_150;
float3 l9_151=float3(0.0);
l9_151=param_9.VertexNormal_ObjectSpace;
param_4=l9_151;
float3 l9_152=param_3;
float3 l9_153=param_4;
l9_152+=param_6;
l9_152*=param_5;
l9_153=abs(l9_153);
float l9_154=l9_153.x;
float l9_155=l9_153.y;
bool l9_156=l9_154>l9_155;
bool l9_157;
if (l9_156)
{
l9_157=l9_153.x>l9_153.z;
}
else
{
l9_157=l9_156;
}
int3 l9_158;
if (l9_157)
{
l9_158=int3(0,1,2);
}
else
{
bool3 l9_159=bool3(l9_153.y>l9_153.z);
l9_158=int3(l9_159.x ? int3(1,2,0).x : int3(2,0,1).x,l9_159.y ? int3(1,2,0).y : int3(2,0,1).y,l9_159.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_160=l9_158;
float l9_161=l9_153.x;
float l9_162=l9_153.y;
bool l9_163=l9_161<l9_162;
bool l9_164;
if (l9_163)
{
l9_164=l9_153.x<l9_153.z;
}
else
{
l9_164=l9_163;
}
int3 l9_165;
if (l9_164)
{
l9_165=int3(0,1,2);
}
else
{
bool3 l9_166=bool3(l9_153.y<l9_153.z);
l9_165=int3(l9_166.x ? int3(1,2,0).x : int3(2,0,1).x,l9_166.y ? int3(1,2,0).y : int3(2,0,1).y,l9_166.z ? int3(1,2,0).z : int3(2,0,1).z);
}
int3 l9_167=l9_165;
int3 l9_168=(int3(3)-l9_167)-l9_160;
param_9.gTriplanarCoords=float2(l9_152[l9_160.y],l9_152[l9_160.z]);
float2 l9_169=float2(0.0);
l9_169=param_9.gTriplanarCoords;
float l9_170=0.0;
float2 l9_171=l9_169;
float2 l9_172=(*sc_set0.UserUniforms).Port_Scale_N017;
l9_171.x=floor(l9_171.x*10000.0)*9.9999997e-05;
l9_171.y=floor(l9_171.y*10000.0)*9.9999997e-05;
l9_171*=(l9_172*0.5);
float2 l9_173=l9_171;
float l9_174=(snoise(l9_173)*0.5)+0.5;
l9_174=floor(l9_174*10000.0)*9.9999997e-05;
l9_170=l9_174;
param_2=l9_170;
float l9_175=param_2;
param_9.gTriplanarCoords=float2(l9_152[l9_168.y],l9_152[l9_168.z]);
float2 l9_176=float2(0.0);
l9_176=param_9.gTriplanarCoords;
float l9_177=0.0;
float2 l9_178=l9_176;
float2 l9_179=(*sc_set0.UserUniforms).Port_Scale_N017;
l9_178.x=floor(l9_178.x*10000.0)*9.9999997e-05;
l9_178.y=floor(l9_178.y*10000.0)*9.9999997e-05;
l9_178*=(l9_179*0.5);
float2 l9_180=l9_178;
float l9_181=(snoise(l9_180)*0.5)+0.5;
l9_181=floor(l9_181*10000.0)*9.9999997e-05;
l9_177=l9_181;
param_2=l9_177;
float l9_182=param_2;
float2 l9_183=float2(l9_153[l9_160.x],l9_153[l9_168.x]);
l9_183=pow(l9_183,float2(1.0/(1.0-(param_7*0.99000001))));
float param_8=((l9_175*l9_183.x)+(l9_182*l9_183.y))/(l9_183.x+l9_183.y);
Output_N39=param_8;
float Export_N40=0.0;
Export_N40=Output_N39;
float3 Normal_N5=float3(0.0);
Normal_N5=Globals.VertexNormal_ObjectSpace;
float3 Output_N9=float3(0.0);
float3 param_10=Normal_N5;
float l9_184=dot(param_10,param_10);
float l9_185;
if (l9_184>0.0)
{
l9_185=1.0/sqrt(l9_184);
}
else
{
l9_185=0.0;
}
float l9_186=l9_185;
float3 param_11=param_10*l9_186;
Output_N9=param_11;
float3 Output_N7=float3(0.0);
Output_N7=(float3(Export_N47)*float3(Export_N40))*Output_N9;
float3 Output_N14=float3(0.0);
Output_N14=Position_N0+Output_N7;
float3 VectorOut_N13=float3(0.0);
VectorOut_N13=((*sc_set0.UserUniforms).sc_ModelMatrix*float4(Output_N14,1.0)).xyz;
WorldPosition=VectorOut_N13;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPosAndMotion.xyz;
WorldNormal=out.varNormalAndMotion.xyz;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_12=v;
float3 param_13=WorldPosition;
float3 param_14=WorldNormal;
float3 param_15=WorldTangent;
float4 param_16=v.position;
out.varPosAndMotion=float4(param_13.x,param_13.y,param_13.z,out.varPosAndMotion.w);
float3 l9_187=normalize(param_14);
out.varNormalAndMotion=float4(l9_187.x,l9_187.y,l9_187.z,out.varNormalAndMotion.w);
float3 l9_188=normalize(param_15);
out.varTangent=float4(l9_188.x,l9_188.y,l9_188.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_189=param_12.position;
float4 l9_190=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_191=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_191=0;
}
else
{
l9_191=gl_InstanceIndex%2;
}
int l9_192=l9_191;
l9_190=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_192]*l9_189;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_193=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_193=0;
}
else
{
l9_193=gl_InstanceIndex%2;
}
int l9_194=l9_193;
l9_190=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_194]*l9_189;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_195=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_195=0;
}
else
{
l9_195=gl_InstanceIndex%2;
}
int l9_196=l9_195;
l9_190=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_196]*l9_189;
}
else
{
l9_190=l9_189;
}
}
}
float4 l9_197=l9_190;
out.varViewSpaceDepth=-l9_197.z;
}
float4 l9_198=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_198=param_16;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_199=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_199=0;
}
else
{
l9_199=gl_InstanceIndex%2;
}
int l9_200=l9_199;
l9_198=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_200]*param_12.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_201=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_201=0;
}
else
{
l9_201=gl_InstanceIndex%2;
}
int l9_202=l9_201;
l9_198=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_202]*float4(out.varPosAndMotion.xyz,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_203=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_203=0;
}
else
{
l9_203=gl_InstanceIndex%2;
}
int l9_204=l9_203;
l9_198=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_204]*float4(out.varPosAndMotion.xyz,1.0);
}
}
}
}
out.varTex01=float4(param_12.texture0,param_12.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_205=param_12.position;
float4 l9_206=l9_205;
if (sc_RenderingSpace_tmp==1)
{
l9_206=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_205;
}
float4 l9_207=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_206;
float2 l9_208=((l9_207.xy/float2(l9_207.w))*0.5)+float2(0.5);
out.varShadowTex=l9_208;
}
float4 l9_209=l9_198;
if (sc_DepthBufferMode_tmp==1)
{
int l9_210=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_210=0;
}
else
{
l9_210=gl_InstanceIndex%2;
}
int l9_211=l9_210;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_211][2].w!=0.0)
{
float l9_212=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_209.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_209.w))*l9_212)-1.0)*l9_209.w;
}
}
float4 l9_213=l9_209;
l9_198=l9_213;
float4 l9_214=l9_198;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_215=l9_214.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_214.w);
l9_214=float4(l9_215.x,l9_215.y,l9_214.z,l9_214.w);
}
float4 l9_216=l9_214;
l9_198=l9_216;
float4 l9_217=l9_198;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_217.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_218=l9_217;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_219=dot(l9_218,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_220=l9_219;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_220;
}
}
float4 l9_221=float4(l9_217.x,-l9_217.y,(l9_217.z*0.5)+(l9_217.w*0.5),l9_217.w);
out.gl_Position=l9_221;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_223=param_12;
sc_Vertex_t l9_224=l9_223;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_225=l9_224;
float3 l9_226=in.blendShape0Pos;
float3 l9_227=in.blendShape0Normal;
float l9_228=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_229=l9_225;
float3 l9_230=l9_226;
float l9_231=l9_228;
float3 l9_232=l9_229.position.xyz+(l9_230*l9_231);
l9_229.position=float4(l9_232.x,l9_232.y,l9_232.z,l9_229.position.w);
l9_225=l9_229;
l9_225.normal+=(l9_227*l9_228);
l9_224=l9_225;
sc_Vertex_t l9_233=l9_224;
float3 l9_234=in.blendShape1Pos;
float3 l9_235=in.blendShape1Normal;
float l9_236=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_237=l9_233;
float3 l9_238=l9_234;
float l9_239=l9_236;
float3 l9_240=l9_237.position.xyz+(l9_238*l9_239);
l9_237.position=float4(l9_240.x,l9_240.y,l9_240.z,l9_237.position.w);
l9_233=l9_237;
l9_233.normal+=(l9_235*l9_236);
l9_224=l9_233;
sc_Vertex_t l9_241=l9_224;
float3 l9_242=in.blendShape2Pos;
float3 l9_243=in.blendShape2Normal;
float l9_244=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_245=l9_241;
float3 l9_246=l9_242;
float l9_247=l9_244;
float3 l9_248=l9_245.position.xyz+(l9_246*l9_247);
l9_245.position=float4(l9_248.x,l9_248.y,l9_248.z,l9_245.position.w);
l9_241=l9_245;
l9_241.normal+=(l9_243*l9_244);
l9_224=l9_241;
}
else
{
sc_Vertex_t l9_249=l9_224;
float3 l9_250=in.blendShape0Pos;
float l9_251=(*sc_set0.UserUniforms).weights0.x;
float3 l9_252=l9_249.position.xyz+(l9_250*l9_251);
l9_249.position=float4(l9_252.x,l9_252.y,l9_252.z,l9_249.position.w);
l9_224=l9_249;
sc_Vertex_t l9_253=l9_224;
float3 l9_254=in.blendShape1Pos;
float l9_255=(*sc_set0.UserUniforms).weights0.y;
float3 l9_256=l9_253.position.xyz+(l9_254*l9_255);
l9_253.position=float4(l9_256.x,l9_256.y,l9_256.z,l9_253.position.w);
l9_224=l9_253;
sc_Vertex_t l9_257=l9_224;
float3 l9_258=in.blendShape2Pos;
float l9_259=(*sc_set0.UserUniforms).weights0.z;
float3 l9_260=l9_257.position.xyz+(l9_258*l9_259);
l9_257.position=float4(l9_260.x,l9_260.y,l9_260.z,l9_257.position.w);
l9_224=l9_257;
sc_Vertex_t l9_261=l9_224;
float3 l9_262=in.blendShape3Pos;
float l9_263=(*sc_set0.UserUniforms).weights0.w;
float3 l9_264=l9_261.position.xyz+(l9_262*l9_263);
l9_261.position=float4(l9_264.x,l9_264.y,l9_264.z,l9_261.position.w);
l9_224=l9_261;
sc_Vertex_t l9_265=l9_224;
float3 l9_266=in.blendShape4Pos;
float l9_267=(*sc_set0.UserUniforms).weights1.x;
float3 l9_268=l9_265.position.xyz+(l9_266*l9_267);
l9_265.position=float4(l9_268.x,l9_268.y,l9_268.z,l9_265.position.w);
l9_224=l9_265;
sc_Vertex_t l9_269=l9_224;
float3 l9_270=in.blendShape5Pos;
float l9_271=(*sc_set0.UserUniforms).weights1.y;
float3 l9_272=l9_269.position.xyz+(l9_270*l9_271);
l9_269.position=float4(l9_272.x,l9_272.y,l9_272.z,l9_269.position.w);
l9_224=l9_269;
}
}
l9_223=l9_224;
sc_Vertex_t l9_273=l9_223;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_274=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_274=float4(1.0,fract(in.boneData.yzw));
l9_274.x-=dot(l9_274.yzw,float3(1.0));
}
float4 l9_275=l9_274;
float4 l9_276=l9_275;
int l9_277=int(in.boneData.x);
int l9_278=int(in.boneData.y);
int l9_279=int(in.boneData.z);
int l9_280=int(in.boneData.w);
int l9_281=l9_277;
float4 l9_282=l9_273.position;
float3 l9_283=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_284=l9_281;
float4 l9_285=(*sc_set0.sc_BonesUBO).sc_Bones[l9_284].boneMatrix[0];
float4 l9_286=(*sc_set0.sc_BonesUBO).sc_Bones[l9_284].boneMatrix[1];
float4 l9_287=(*sc_set0.sc_BonesUBO).sc_Bones[l9_284].boneMatrix[2];
float4 l9_288[3];
l9_288[0]=l9_285;
l9_288[1]=l9_286;
l9_288[2]=l9_287;
l9_283=float3(dot(l9_282,l9_288[0]),dot(l9_282,l9_288[1]),dot(l9_282,l9_288[2]));
}
else
{
l9_283=l9_282.xyz;
}
float3 l9_289=l9_283;
float3 l9_290=l9_289;
float l9_291=l9_276.x;
int l9_292=l9_278;
float4 l9_293=l9_273.position;
float3 l9_294=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_295=l9_292;
float4 l9_296=(*sc_set0.sc_BonesUBO).sc_Bones[l9_295].boneMatrix[0];
float4 l9_297=(*sc_set0.sc_BonesUBO).sc_Bones[l9_295].boneMatrix[1];
float4 l9_298=(*sc_set0.sc_BonesUBO).sc_Bones[l9_295].boneMatrix[2];
float4 l9_299[3];
l9_299[0]=l9_296;
l9_299[1]=l9_297;
l9_299[2]=l9_298;
l9_294=float3(dot(l9_293,l9_299[0]),dot(l9_293,l9_299[1]),dot(l9_293,l9_299[2]));
}
else
{
l9_294=l9_293.xyz;
}
float3 l9_300=l9_294;
float3 l9_301=l9_300;
float l9_302=l9_276.y;
int l9_303=l9_279;
float4 l9_304=l9_273.position;
float3 l9_305=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_306=l9_303;
float4 l9_307=(*sc_set0.sc_BonesUBO).sc_Bones[l9_306].boneMatrix[0];
float4 l9_308=(*sc_set0.sc_BonesUBO).sc_Bones[l9_306].boneMatrix[1];
float4 l9_309=(*sc_set0.sc_BonesUBO).sc_Bones[l9_306].boneMatrix[2];
float4 l9_310[3];
l9_310[0]=l9_307;
l9_310[1]=l9_308;
l9_310[2]=l9_309;
l9_305=float3(dot(l9_304,l9_310[0]),dot(l9_304,l9_310[1]),dot(l9_304,l9_310[2]));
}
else
{
l9_305=l9_304.xyz;
}
float3 l9_311=l9_305;
float3 l9_312=l9_311;
float l9_313=l9_276.z;
int l9_314=l9_280;
float4 l9_315=l9_273.position;
float3 l9_316=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_317=l9_314;
float4 l9_318=(*sc_set0.sc_BonesUBO).sc_Bones[l9_317].boneMatrix[0];
float4 l9_319=(*sc_set0.sc_BonesUBO).sc_Bones[l9_317].boneMatrix[1];
float4 l9_320=(*sc_set0.sc_BonesUBO).sc_Bones[l9_317].boneMatrix[2];
float4 l9_321[3];
l9_321[0]=l9_318;
l9_321[1]=l9_319;
l9_321[2]=l9_320;
l9_316=float3(dot(l9_315,l9_321[0]),dot(l9_315,l9_321[1]),dot(l9_315,l9_321[2]));
}
else
{
l9_316=l9_315.xyz;
}
float3 l9_322=l9_316;
float3 l9_323=(((l9_290*l9_291)+(l9_301*l9_302))+(l9_312*l9_313))+(l9_322*l9_276.w);
l9_273.position=float4(l9_323.x,l9_323.y,l9_323.z,l9_273.position.w);
int l9_324=l9_277;
float3x3 l9_325=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_324].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_324].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_324].normalMatrix[2].xyz));
float3x3 l9_326=l9_325;
float3x3 l9_327=l9_326;
int l9_328=l9_278;
float3x3 l9_329=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_328].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_328].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_328].normalMatrix[2].xyz));
float3x3 l9_330=l9_329;
float3x3 l9_331=l9_330;
int l9_332=l9_279;
float3x3 l9_333=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_332].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_332].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_332].normalMatrix[2].xyz));
float3x3 l9_334=l9_333;
float3x3 l9_335=l9_334;
int l9_336=l9_280;
float3x3 l9_337=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_336].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_336].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_336].normalMatrix[2].xyz));
float3x3 l9_338=l9_337;
float3x3 l9_339=l9_338;
l9_273.normal=((((l9_327*l9_273.normal)*l9_276.x)+((l9_331*l9_273.normal)*l9_276.y))+((l9_335*l9_273.normal)*l9_276.z))+((l9_339*l9_273.normal)*l9_276.w);
l9_273.tangent=((((l9_327*l9_273.tangent)*l9_276.x)+((l9_331*l9_273.tangent)*l9_276.y))+((l9_335*l9_273.tangent)*l9_276.z))+((l9_339*l9_273.tangent)*l9_276.w);
}
l9_223=l9_273;
float l9_340=(*sc_set0.UserUniforms).voxelization_params_0.y;
float l9_341=(*sc_set0.UserUniforms).voxelization_params_0.z;
float l9_342=(*sc_set0.UserUniforms).voxelization_params_0.w;
float l9_343=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_344=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_345=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_346=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_347=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_348=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float3 l9_349=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float l9_350=l9_340/l9_341;
int l9_351=gl_InstanceIndex;
int l9_352=l9_351;
l9_223.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_223.position;
float3 l9_353=l9_223.position.xyz;
float3 l9_354=float3(float(l9_352%int(l9_342))*l9_340,float(l9_352/int(l9_342))*l9_340,(float(l9_352)*l9_350)+l9_347);
float3 l9_355=l9_353+l9_354;
float4 l9_356=float4(l9_355-l9_349,1.0);
float l9_357=l9_343;
float l9_358=l9_344;
float l9_359=l9_345;
float l9_360=l9_346;
float l9_361=l9_347;
float l9_362=l9_348;
float4x4 l9_363=float4x4(float4(2.0/(l9_358-l9_357),0.0,0.0,(-(l9_358+l9_357))/(l9_358-l9_357)),float4(0.0,2.0/(l9_360-l9_359),0.0,(-(l9_360+l9_359))/(l9_360-l9_359)),float4(0.0,0.0,(-2.0)/(l9_362-l9_361),(-(l9_362+l9_361))/(l9_362-l9_361)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_364=l9_363;
float4 l9_365=l9_364*l9_356;
l9_365.w=1.0;
out.varScreenPos=l9_365;
float4 l9_366=l9_365*1.0;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_366.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_367=l9_366;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_368=dot(l9_367,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_369=l9_368;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_369;
}
}
float4 l9_370=float4(l9_366.x,-l9_366.y,(l9_366.z*0.5)+(l9_366.w*0.5),l9_366.w);
out.gl_Position=l9_370;
param_12=l9_223;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
sc_Vertex_t l9_371=param_12;
sc_Vertex_t l9_372=l9_371;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_373=l9_372;
float3 l9_374=in.blendShape0Pos;
float3 l9_375=in.blendShape0Normal;
float l9_376=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_377=l9_373;
float3 l9_378=l9_374;
float l9_379=l9_376;
float3 l9_380=l9_377.position.xyz+(l9_378*l9_379);
l9_377.position=float4(l9_380.x,l9_380.y,l9_380.z,l9_377.position.w);
l9_373=l9_377;
l9_373.normal+=(l9_375*l9_376);
l9_372=l9_373;
sc_Vertex_t l9_381=l9_372;
float3 l9_382=in.blendShape1Pos;
float3 l9_383=in.blendShape1Normal;
float l9_384=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_385=l9_381;
float3 l9_386=l9_382;
float l9_387=l9_384;
float3 l9_388=l9_385.position.xyz+(l9_386*l9_387);
l9_385.position=float4(l9_388.x,l9_388.y,l9_388.z,l9_385.position.w);
l9_381=l9_385;
l9_381.normal+=(l9_383*l9_384);
l9_372=l9_381;
sc_Vertex_t l9_389=l9_372;
float3 l9_390=in.blendShape2Pos;
float3 l9_391=in.blendShape2Normal;
float l9_392=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_393=l9_389;
float3 l9_394=l9_390;
float l9_395=l9_392;
float3 l9_396=l9_393.position.xyz+(l9_394*l9_395);
l9_393.position=float4(l9_396.x,l9_396.y,l9_396.z,l9_393.position.w);
l9_389=l9_393;
l9_389.normal+=(l9_391*l9_392);
l9_372=l9_389;
}
else
{
sc_Vertex_t l9_397=l9_372;
float3 l9_398=in.blendShape0Pos;
float l9_399=(*sc_set0.UserUniforms).weights0.x;
float3 l9_400=l9_397.position.xyz+(l9_398*l9_399);
l9_397.position=float4(l9_400.x,l9_400.y,l9_400.z,l9_397.position.w);
l9_372=l9_397;
sc_Vertex_t l9_401=l9_372;
float3 l9_402=in.blendShape1Pos;
float l9_403=(*sc_set0.UserUniforms).weights0.y;
float3 l9_404=l9_401.position.xyz+(l9_402*l9_403);
l9_401.position=float4(l9_404.x,l9_404.y,l9_404.z,l9_401.position.w);
l9_372=l9_401;
sc_Vertex_t l9_405=l9_372;
float3 l9_406=in.blendShape2Pos;
float l9_407=(*sc_set0.UserUniforms).weights0.z;
float3 l9_408=l9_405.position.xyz+(l9_406*l9_407);
l9_405.position=float4(l9_408.x,l9_408.y,l9_408.z,l9_405.position.w);
l9_372=l9_405;
sc_Vertex_t l9_409=l9_372;
float3 l9_410=in.blendShape3Pos;
float l9_411=(*sc_set0.UserUniforms).weights0.w;
float3 l9_412=l9_409.position.xyz+(l9_410*l9_411);
l9_409.position=float4(l9_412.x,l9_412.y,l9_412.z,l9_409.position.w);
l9_372=l9_409;
sc_Vertex_t l9_413=l9_372;
float3 l9_414=in.blendShape4Pos;
float l9_415=(*sc_set0.UserUniforms).weights1.x;
float3 l9_416=l9_413.position.xyz+(l9_414*l9_415);
l9_413.position=float4(l9_416.x,l9_416.y,l9_416.z,l9_413.position.w);
l9_372=l9_413;
sc_Vertex_t l9_417=l9_372;
float3 l9_418=in.blendShape5Pos;
float l9_419=(*sc_set0.UserUniforms).weights1.y;
float3 l9_420=l9_417.position.xyz+(l9_418*l9_419);
l9_417.position=float4(l9_420.x,l9_420.y,l9_420.z,l9_417.position.w);
l9_372=l9_417;
}
}
l9_371=l9_372;
sc_Vertex_t l9_421=l9_371;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_422=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_422=float4(1.0,fract(in.boneData.yzw));
l9_422.x-=dot(l9_422.yzw,float3(1.0));
}
float4 l9_423=l9_422;
float4 l9_424=l9_423;
int l9_425=int(in.boneData.x);
int l9_426=int(in.boneData.y);
int l9_427=int(in.boneData.z);
int l9_428=int(in.boneData.w);
int l9_429=l9_425;
float4 l9_430=l9_421.position;
float3 l9_431=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_432=l9_429;
float4 l9_433=(*sc_set0.sc_BonesUBO).sc_Bones[l9_432].boneMatrix[0];
float4 l9_434=(*sc_set0.sc_BonesUBO).sc_Bones[l9_432].boneMatrix[1];
float4 l9_435=(*sc_set0.sc_BonesUBO).sc_Bones[l9_432].boneMatrix[2];
float4 l9_436[3];
l9_436[0]=l9_433;
l9_436[1]=l9_434;
l9_436[2]=l9_435;
l9_431=float3(dot(l9_430,l9_436[0]),dot(l9_430,l9_436[1]),dot(l9_430,l9_436[2]));
}
else
{
l9_431=l9_430.xyz;
}
float3 l9_437=l9_431;
float3 l9_438=l9_437;
float l9_439=l9_424.x;
int l9_440=l9_426;
float4 l9_441=l9_421.position;
float3 l9_442=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_443=l9_440;
float4 l9_444=(*sc_set0.sc_BonesUBO).sc_Bones[l9_443].boneMatrix[0];
float4 l9_445=(*sc_set0.sc_BonesUBO).sc_Bones[l9_443].boneMatrix[1];
float4 l9_446=(*sc_set0.sc_BonesUBO).sc_Bones[l9_443].boneMatrix[2];
float4 l9_447[3];
l9_447[0]=l9_444;
l9_447[1]=l9_445;
l9_447[2]=l9_446;
l9_442=float3(dot(l9_441,l9_447[0]),dot(l9_441,l9_447[1]),dot(l9_441,l9_447[2]));
}
else
{
l9_442=l9_441.xyz;
}
float3 l9_448=l9_442;
float3 l9_449=l9_448;
float l9_450=l9_424.y;
int l9_451=l9_427;
float4 l9_452=l9_421.position;
float3 l9_453=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_454=l9_451;
float4 l9_455=(*sc_set0.sc_BonesUBO).sc_Bones[l9_454].boneMatrix[0];
float4 l9_456=(*sc_set0.sc_BonesUBO).sc_Bones[l9_454].boneMatrix[1];
float4 l9_457=(*sc_set0.sc_BonesUBO).sc_Bones[l9_454].boneMatrix[2];
float4 l9_458[3];
l9_458[0]=l9_455;
l9_458[1]=l9_456;
l9_458[2]=l9_457;
l9_453=float3(dot(l9_452,l9_458[0]),dot(l9_452,l9_458[1]),dot(l9_452,l9_458[2]));
}
else
{
l9_453=l9_452.xyz;
}
float3 l9_459=l9_453;
float3 l9_460=l9_459;
float l9_461=l9_424.z;
int l9_462=l9_428;
float4 l9_463=l9_421.position;
float3 l9_464=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_465=l9_462;
float4 l9_466=(*sc_set0.sc_BonesUBO).sc_Bones[l9_465].boneMatrix[0];
float4 l9_467=(*sc_set0.sc_BonesUBO).sc_Bones[l9_465].boneMatrix[1];
float4 l9_468=(*sc_set0.sc_BonesUBO).sc_Bones[l9_465].boneMatrix[2];
float4 l9_469[3];
l9_469[0]=l9_466;
l9_469[1]=l9_467;
l9_469[2]=l9_468;
l9_464=float3(dot(l9_463,l9_469[0]),dot(l9_463,l9_469[1]),dot(l9_463,l9_469[2]));
}
else
{
l9_464=l9_463.xyz;
}
float3 l9_470=l9_464;
float3 l9_471=(((l9_438*l9_439)+(l9_449*l9_450))+(l9_460*l9_461))+(l9_470*l9_424.w);
l9_421.position=float4(l9_471.x,l9_471.y,l9_471.z,l9_421.position.w);
int l9_472=l9_425;
float3x3 l9_473=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_472].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_472].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_472].normalMatrix[2].xyz));
float3x3 l9_474=l9_473;
float3x3 l9_475=l9_474;
int l9_476=l9_426;
float3x3 l9_477=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_476].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_476].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_476].normalMatrix[2].xyz));
float3x3 l9_478=l9_477;
float3x3 l9_479=l9_478;
int l9_480=l9_427;
float3x3 l9_481=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_480].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_480].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_480].normalMatrix[2].xyz));
float3x3 l9_482=l9_481;
float3x3 l9_483=l9_482;
int l9_484=l9_428;
float3x3 l9_485=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_484].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_484].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_484].normalMatrix[2].xyz));
float3x3 l9_486=l9_485;
float3x3 l9_487=l9_486;
l9_421.normal=((((l9_475*l9_421.normal)*l9_424.x)+((l9_479*l9_421.normal)*l9_424.y))+((l9_483*l9_421.normal)*l9_424.z))+((l9_487*l9_421.normal)*l9_424.w);
l9_421.tangent=((((l9_475*l9_421.tangent)*l9_424.x)+((l9_479*l9_421.tangent)*l9_424.y))+((l9_483*l9_421.tangent)*l9_424.z))+((l9_487*l9_421.tangent)*l9_424.w);
}
l9_371=l9_421;
float3 l9_488=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float2 l9_489=((l9_371.position.xy/float2(l9_371.position.w))*0.5)+float2(0.5);
out.varTex01=float4(l9_489.x,l9_489.y,out.varTex01.z,out.varTex01.w);
l9_371.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_371.position;
float3 l9_490=l9_371.position.xyz-l9_488;
l9_371.position=float4(l9_490.x,l9_490.y,l9_490.z,l9_371.position.w);
out.varPosAndMotion=float4(l9_371.position.xyz.x,l9_371.position.xyz.y,l9_371.position.xyz.z,out.varPosAndMotion.w);
float3 l9_491=normalize(l9_371.normal);
out.varNormalAndMotion=float4(l9_491.x,l9_491.y,l9_491.z,out.varNormalAndMotion.w);
float l9_492=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_493=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_494=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_495=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_496=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_497=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float l9_498=l9_492;
float l9_499=l9_493;
float l9_500=l9_494;
float l9_501=l9_495;
float l9_502=l9_496;
float l9_503=l9_497;
float4x4 l9_504=float4x4(float4(2.0/(l9_499-l9_498),0.0,0.0,(-(l9_499+l9_498))/(l9_499-l9_498)),float4(0.0,2.0/(l9_501-l9_500),0.0,(-(l9_501+l9_500))/(l9_501-l9_500)),float4(0.0,0.0,(-2.0)/(l9_503-l9_502),(-(l9_503+l9_502))/(l9_503-l9_502)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_505=l9_504;
float4 l9_506=float4(0.0);
float3 l9_507=(l9_505*l9_371.position).xyz;
l9_506=float4(l9_507.x,l9_507.y,l9_507.z,l9_506.w);
l9_506.w=1.0;
out.varScreenPos=l9_506;
float4 l9_508=l9_506*1.0;
float4 l9_509=l9_508;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_509.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_510=l9_509;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_511=dot(l9_510,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_512=l9_511;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_512;
}
}
float4 l9_513=float4(l9_509.x,-l9_509.y,(l9_509.z*0.5)+(l9_509.w*0.5),l9_509.w);
out.gl_Position=l9_513;
param_12=l9_371;
}
}
v=param_12;
float3 param_17=out.varPosAndMotion.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float4 l9_514=((*sc_set0.UserUniforms).sc_PrevFrameModelMatrix*(*sc_set0.UserUniforms).sc_ModelMatrixInverse)*float4(param_17,1.0);
float3 l9_515=param_17;
float3 l9_516=l9_514.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
int l9_517=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_517=0;
}
else
{
l9_517=gl_InstanceIndex%2;
}
int l9_518=l9_517;
float4 l9_519=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_518]*float4(l9_515,1.0);
float2 l9_520=l9_519.xy/float2(l9_519.w);
l9_519=float4(l9_520.x,l9_520.y,l9_519.z,l9_519.w);
int l9_521=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_521=0;
}
else
{
l9_521=gl_InstanceIndex%2;
}
int l9_522=l9_521;
float4 l9_523=(*sc_set0.UserUniforms).sc_PrevFrameViewProjectionMatrixArray[l9_522]*float4(l9_516,1.0);
float2 l9_524=l9_523.xy/float2(l9_523.w);
l9_523=float4(l9_524.x,l9_524.y,l9_523.z,l9_523.w);
float2 l9_525=(l9_519.xy-l9_523.xy)*0.5;
out.varPosAndMotion.w=l9_525.x;
out.varNormalAndMotion.w=l9_525.y;
}
}
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexNormal_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int sc_RayTracingReceiverEffectsMask;
float4 sc_RayTracingReflectionsSize;
float4 sc_RayTracingReflectionsDims;
float4 sc_RayTracingReflectionsView;
float4 sc_RayTracingGlobalIlluminationSize;
float4 sc_RayTracingGlobalIlluminationDims;
float4 sc_RayTracingGlobalIlluminationView;
float4 sc_RayTracingShadowsSize;
float4 sc_RayTracingShadowsDims;
float4 sc_RayTracingShadowsView;
float3 sc_RayTracingOriginScale;
uint sc_RayTracingReceiverMask;
float3 sc_RayTracingOriginScaleInv;
float3 sc_RayTracingOriginOffset;
uint sc_RayTracingReceiverId;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float strength;
float noiseScale;
float animatedSpeed;
float offset;
float Port_Import_N031;
float Port_Import_N046;
float3 Port_Import_N034;
float3 Port_Import_N029;
float Port_Import_N037;
float Port_Input1_N038;
float Port_Input2_N038;
float3 Port_Import_N064;
float Port_Import_N054;
float2 Port_Scale_N017;
float3 Port_Albedo_N006;
float Port_Opacity_N006;
float3 Port_Normal_N006;
float3 Port_Emissive_N006;
float Port_Metallic_N006;
float Port_Roughness_N006;
float3 Port_AO_N006;
float3 Port_SpecularAO_N006;
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> sc_EnvmapDiffuse [[id(2)]];
texture2d<float> sc_EnvmapSpecular [[id(3)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(12)]];
texture2d<float> sc_RayTracingReflections [[id(13)]];
texture2d<float> sc_RayTracingShadows [[id(14)]];
texture2d<float> sc_SSAOTexture [[id(15)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
texture2d<float> sc_ShadowTexture [[id(17)]];
sampler intensityTextureSmpSC [[id(19)]];
sampler sc_EnvmapDiffuseSmpSC [[id(20)]];
sampler sc_EnvmapSpecularSmpSC [[id(21)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(23)]];
sampler sc_RayTracingReflectionsSmpSC [[id(24)]];
sampler sc_RayTracingShadowsSmpSC [[id(25)]];
sampler sc_SSAOTextureSmpSC [[id(26)]];
sampler sc_ScreenTextureSmpSC [[id(27)]];
sampler sc_ShadowTextureSmpSC [[id(28)]];
constant userUniformsObj* UserUniforms [[id(30)]];
};
struct main_frag_out
{
float4 sc_FragData0 [[color(0)]];
};
struct main_frag_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
float l9_10=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_11=param_6;
float l9_12=param_8;
float l9_13=l9_12+1.0;
l9_13=(l9_13*l9_13)*0.125;
float l9_14=(l9_11*(1.0-l9_13))+l9_13;
float l9_15=param_7;
float l9_16=param_8;
float l9_17=l9_16+1.0;
l9_17=(l9_17*l9_17)*0.125;
float l9_18=(l9_15*(1.0-l9_17))+l9_17;
float l9_19=1.0/(l9_14*l9_18);
float param_9=VdotH;
float3 param_10=F0;
float l9_20=param_9;
float3 l9_21=param_10;
float3 l9_22=float3(1.0);
float l9_23=1.0-l9_20;
float l9_24=l9_23*l9_23;
float l9_25=(l9_24*l9_24)*l9_23;
float3 l9_26=l9_21+((l9_22-l9_21)*l9_25);
float3 l9_27=l9_26;
return l9_27*(((l9_10*l9_19)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_28=param_11;
float3 l9_29=param_12;
float3 l9_30=float3(1.0);
float l9_31=1.0-l9_28;
float l9_32=l9_31*l9_31;
float l9_33=(l9_32*l9_32)*l9_31;
float3 l9_34=l9_29+((l9_30-l9_29)*l9_33);
float3 l9_35=l9_34;
return ((l9_35*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float3 getSpecularDominantDir(thread const float3& N,thread const float3& R,thread const float& roughness)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float lerpFactor=(roughness*roughness)*roughness;
return normalize(mix(R,N,float3(lerpFactor)));
}
else
{
return R;
}
}
float3 envBRDFApprox(thread const SurfaceProperties& surfaceProperties,thread const float& NdotV)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float param=surfaceProperties.roughness;
float param_1=NdotV;
float4 l9_0=(float4(-1.0,-0.0275,-0.57200003,0.022)*param)+float4(1.0,0.0425,1.04,-0.039999999);
float l9_1=(fast::min(l9_0.x*l9_0.x,exp2((-9.2799997)*param_1))*l9_0.x)+l9_0.y;
float2 l9_2=(float2(-1.04,1.04)*l9_1)+l9_0.zw;
float2 l9_3=l9_2;
float2 AB=l9_3;
return fast::max((surfaceProperties.specColor*AB.x)+float3(AB.y),float3(0.0));
}
else
{
float3 fresnelMax=fast::max(float3(1.0-surfaceProperties.roughness),surfaceProperties.specColor);
float param_2=NdotV;
float3 param_3=surfaceProperties.specColor;
float3 param_4=fresnelMax;
float l9_4=1.0-param_2;
float l9_5=l9_4*l9_4;
float l9_6=(l9_5*l9_5)*l9_4;
float3 l9_7=param_3+((param_4-param_3)*l9_6);
return l9_7;
}
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
l9_236=l9_278;
float l9_279=l9_236.x;
int l9_280=l9_239.x;
bool l9_281=l9_245;
float l9_282=l9_246;
if ((l9_280==0)||(l9_280==3))
{
float l9_283=l9_279;
float l9_284=0.0;
float l9_285=1.0;
bool l9_286=l9_281;
float l9_287=l9_282;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_279=l9_283;
l9_282=l9_287;
}
l9_236.x=l9_279;
l9_246=l9_282;
float l9_290=l9_236.y;
int l9_291=l9_239.y;
bool l9_292=l9_245;
float l9_293=l9_246;
if ((l9_291==0)||(l9_291==3))
{
float l9_294=l9_290;
float l9_295=0.0;
float l9_296=1.0;
bool l9_297=l9_292;
float l9_298=l9_293;
float l9_299=fast::clamp(l9_294,l9_295,l9_296);
float l9_300=step(abs(l9_294-l9_299),9.9999997e-06);
l9_298*=(l9_300+((1.0-float(l9_297))*(1.0-l9_300)));
l9_294=l9_299;
l9_290=l9_294;
l9_293=l9_298;
}
l9_236.y=l9_290;
l9_246=l9_293;
float2 l9_301=l9_236;
int l9_302=l9_234;
int l9_303=l9_235;
float l9_304=l9_244;
float2 l9_305=l9_301;
int l9_306=l9_302;
int l9_307=l9_303;
float3 l9_308=float3(0.0);
if (l9_306==0)
{
l9_308=float3(l9_305,0.0);
}
else
{
if (l9_306==1)
{
l9_308=float3(l9_305.x,(l9_305.y*0.5)+(0.5-(float(l9_307)*0.5)),0.0);
}
else
{
l9_308=float3(l9_305,float(l9_307));
}
}
float3 l9_309=l9_308;
float3 l9_310=l9_309;
float4 l9_311=intensityTexture.sample(intensityTextureSmpSC,l9_310.xy,bias(l9_304));
float4 l9_312=l9_311;
if (l9_242)
{
l9_312=mix(l9_243,l9_312,float4(l9_246));
}
float4 l9_313=l9_312;
float3 l9_314=l9_313.xyz;
float3 l9_315=l9_314;
float l9_316=16.0;
float l9_317=((((l9_315.x*256.0)+l9_315.y)+(l9_315.z/256.0))/257.00391)*l9_316;
float l9_318=l9_317;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_318=fast::max(l9_318,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_318=fast::min(l9_318,1.0);
}
float l9_319=l9_225;
float3 l9_320=param_8;
float3 l9_321=param_9;
float l9_322=l9_226;
float l9_323=l9_318;
float3 l9_324=transformColor(l9_319,l9_320,l9_321,l9_322,l9_323);
return l9_324;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 sc_OutputMotionVectorIfNeeded(thread const float4& finalColor,thread float4& varPosAndMotion,thread float4& varNormalAndMotion)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float2 param=float2(varPosAndMotion.w,varNormalAndMotion.w);
float l9_0=(param.x*5.0)+0.5;
float l9_1=floor(l9_0*65535.0);
float l9_2=floor(l9_1*0.00390625);
float2 l9_3=float2(l9_2/255.0,(l9_1-(l9_2*256.0))/255.0);
float l9_4=(param.y*5.0)+0.5;
float l9_5=floor(l9_4*65535.0);
float l9_6=floor(l9_5*0.00390625);
float2 l9_7=float2(l9_6/255.0,(l9_5-(l9_6*256.0))/255.0);
float4 l9_8=float4(l9_3,l9_7);
return l9_8;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPosAndMotion.xyz);
Globals.PositionWS=in.varPosAndMotion.xyz;
Globals.VertexNormal_WorldSpace=normalize(in.varNormalAndMotion.xyz);
float4 Output_N6=float4(0.0);
float3 param=(*sc_set0.UserUniforms).Port_Albedo_N006;
float param_1=(*sc_set0.UserUniforms).Port_Opacity_N006;
float3 param_2=(*sc_set0.UserUniforms).Port_Emissive_N006;
float param_3=(*sc_set0.UserUniforms).Port_Metallic_N006;
float param_4=(*sc_set0.UserUniforms).Port_Roughness_N006;
float3 param_5=(*sc_set0.UserUniforms).Port_AO_N006;
float3 param_6=(*sc_set0.UserUniforms).Port_SpecularAO_N006;
ssGlobals param_8=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_8.BumpedNormal=param_8.VertexNormal_WorldSpace;
}
float l9_0=param_1;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_0<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1=gl_FragCoord;
float2 l9_2=floor(mod(l9_1.xy,float2(4.0)));
float l9_3=(mod(dot(l9_2,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_0<l9_3)
{
discard_fragment();
}
}
float4 param_7;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_7=float4(param,param_1);
}
else
{
float3 l9_4=param;
float l9_5=param_1;
float3 l9_6=param_8.BumpedNormal;
float3 l9_7=param_8.PositionWS;
float3 l9_8=param_8.ViewDirWS;
float3 l9_9=param_2;
float l9_10=param_3;
float l9_11=param_4;
float3 l9_12=param_5;
float3 l9_13=param_6;
SurfaceProperties l9_14;
l9_14.albedo=float3(0.0);
l9_14.opacity=1.0;
l9_14.normal=float3(0.0);
l9_14.positionWS=float3(0.0);
l9_14.viewDirWS=float3(0.0);
l9_14.metallic=0.0;
l9_14.roughness=0.0;
l9_14.emissive=float3(0.0);
l9_14.ao=float3(1.0);
l9_14.specularAo=float3(1.0);
l9_14.bakedShadows=float3(1.0);
SurfaceProperties l9_15=l9_14;
SurfaceProperties l9_16=l9_15;
l9_16.opacity=l9_5;
float3 l9_17=l9_4;
float3 l9_18;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_18=float3(pow(l9_17.x,2.2),pow(l9_17.y,2.2),pow(l9_17.z,2.2));
}
else
{
l9_18=l9_17*l9_17;
}
float3 l9_19=l9_18;
l9_16.albedo=l9_19;
l9_16.normal=normalize(l9_6);
l9_16.positionWS=l9_7;
l9_16.viewDirWS=l9_8;
float3 l9_20=l9_9;
float3 l9_21;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_21=float3(pow(l9_20.x,2.2),pow(l9_20.y,2.2),pow(l9_20.z,2.2));
}
else
{
l9_21=l9_20*l9_20;
}
float3 l9_22=l9_21;
l9_16.emissive=l9_22;
l9_16.metallic=l9_10;
l9_16.roughness=l9_11;
l9_16.ao=l9_12;
l9_16.specularAo=l9_13;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 l9_23=l9_16.positionWS;
l9_16.ao=evaluateSSAO(l9_23,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC);
}
SurfaceProperties l9_24=l9_16;
SurfaceProperties l9_25=l9_24;
float3 l9_26=mix(float3(0.039999999),l9_25.albedo*l9_25.metallic,float3(l9_25.metallic));
float3 l9_27=mix(l9_25.albedo*(1.0-l9_25.metallic),float3(0.0),float3(l9_25.metallic));
l9_24.albedo=l9_27;
l9_24.specColor=l9_26;
SurfaceProperties l9_28=l9_24;
l9_16=l9_28;
SurfaceProperties l9_29=l9_16;
LightingComponents l9_30;
l9_30.directDiffuse=float3(0.0);
l9_30.directSpecular=float3(0.0);
l9_30.indirectDiffuse=float3(1.0);
l9_30.indirectSpecular=float3(0.0);
l9_30.emitted=float3(0.0);
l9_30.transmitted=float3(0.0);
LightingComponents l9_31=l9_30;
LightingComponents l9_32=l9_31;
float3 l9_33=l9_29.viewDirWS;
int l9_34=0;
float4 l9_35=float4(l9_29.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_36;
LightProperties l9_37;
int l9_38=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_38<sc_DirectionalLightsCount_tmp)
{
l9_36.direction=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_38].direction;
l9_36.color=(*sc_set0.UserUniforms).sc_DirectionalLights[l9_38].color;
l9_37.direction=l9_36.direction;
l9_37.color=l9_36.color.xyz;
l9_37.attenuation=l9_36.color.w;
l9_37.attenuation*=l9_35[(l9_34<3) ? l9_34 : 3];
l9_34++;
LightingComponents l9_39=l9_32;
LightProperties l9_40=l9_37;
SurfaceProperties l9_41=l9_29;
float3 l9_42=l9_33;
SurfaceProperties l9_43=l9_41;
float3 l9_44=l9_40.direction;
float l9_45=dot(l9_43.normal,l9_44);
float l9_46=fast::clamp(l9_45,0.0,1.0);
float3 l9_47=float3(l9_46);
l9_39.directDiffuse+=((l9_47*l9_40.color)*l9_40.attenuation);
SurfaceProperties l9_48=l9_41;
float3 l9_49=l9_40.direction;
float3 l9_50=l9_42;
l9_39.directSpecular+=((calculateDirectSpecular(l9_48,l9_49,l9_50)*l9_40.color)*l9_40.attenuation);
LightingComponents l9_51=l9_39;
l9_32=l9_51;
l9_38++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_52;
LightProperties l9_53;
int l9_54=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_54<sc_PointLightsCount_tmp)
{
l9_52.falloffEnabled=(*sc_set0.UserUniforms).sc_PointLights[l9_54].falloffEnabled!=0;
l9_52.falloffEndDistance=(*sc_set0.UserUniforms).sc_PointLights[l9_54].falloffEndDistance;
l9_52.negRcpFalloffEndDistance4=(*sc_set0.UserUniforms).sc_PointLights[l9_54].negRcpFalloffEndDistance4;
l9_52.angleScale=(*sc_set0.UserUniforms).sc_PointLights[l9_54].angleScale;
l9_52.angleOffset=(*sc_set0.UserUniforms).sc_PointLights[l9_54].angleOffset;
l9_52.direction=(*sc_set0.UserUniforms).sc_PointLights[l9_54].direction;
l9_52.position=(*sc_set0.UserUniforms).sc_PointLights[l9_54].position;
l9_52.color=(*sc_set0.UserUniforms).sc_PointLights[l9_54].color;
float3 l9_55=l9_52.position-l9_29.positionWS;
l9_53.direction=normalize(l9_55);
l9_53.color=l9_52.color.xyz;
l9_53.attenuation=l9_52.color.w;
l9_53.attenuation*=l9_35[(l9_34<3) ? l9_34 : 3];
float3 l9_56=l9_53.direction;
float3 l9_57=l9_52.direction;
float l9_58=l9_52.angleScale;
float l9_59=l9_52.angleOffset;
float l9_60=dot(l9_56,l9_57);
float l9_61=fast::clamp((l9_60*l9_58)+l9_59,0.0,1.0);
float l9_62=l9_61*l9_61;
l9_53.attenuation*=l9_62;
if (l9_52.falloffEnabled)
{
float l9_63=length(l9_55);
float l9_64=l9_52.falloffEndDistance;
l9_53.attenuation*=computeDistanceAttenuation(l9_63,l9_64);
}
l9_34++;
LightingComponents l9_65=l9_32;
LightProperties l9_66=l9_53;
SurfaceProperties l9_67=l9_29;
float3 l9_68=l9_33;
SurfaceProperties l9_69=l9_67;
float3 l9_70=l9_66.direction;
float l9_71=dot(l9_69.normal,l9_70);
float l9_72=fast::clamp(l9_71,0.0,1.0);
float3 l9_73=float3(l9_72);
l9_65.directDiffuse+=((l9_73*l9_66.color)*l9_66.attenuation);
SurfaceProperties l9_74=l9_67;
float3 l9_75=l9_66.direction;
float3 l9_76=l9_68;
l9_65.directSpecular+=((calculateDirectSpecular(l9_74,l9_75,l9_76)*l9_66.color)*l9_66.attenuation);
LightingComponents l9_77=l9_65;
l9_32=l9_77;
l9_54++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_78=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_79=abs(in.varShadowTex-float2(0.5));
float l9_80=fast::max(l9_79.x,l9_79.y);
float l9_81=step(l9_80,0.5);
float4 l9_82=sc_set0.sc_ShadowTexture.sample(sc_set0.sc_ShadowTextureSmpSC,in.varShadowTex)*l9_81;
float3 l9_83=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_82.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float l9_84=l9_82.w*(*sc_set0.UserUniforms).sc_ShadowDensity;
l9_78=mix(float3(1.0),l9_83,float3(l9_84));
}
else
{
l9_78=float3(1.0);
}
float3 l9_85=l9_78;
float3 l9_86=l9_85;
l9_32.directDiffuse*=l9_86;
l9_32.directSpecular*=l9_86;
}
if (((*sc_set0.UserUniforms).sc_RayTracingReceiverEffectsMask&4)!=0)
{
float4 l9_87=gl_FragCoord;
float2 l9_88=l9_87.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_89=l9_88;
float2 l9_90=l9_89;
float l9_91=0.0;
int l9_92;
if ((int(sc_RayTracingShadowsHasSwappedViews_tmp)!=0))
{
int l9_93=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_93=0;
}
else
{
l9_93=in.varStereoViewID;
}
int l9_94=l9_93;
l9_92=1-l9_94;
}
else
{
int l9_95=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_95=0;
}
else
{
l9_95=in.varStereoViewID;
}
int l9_96=l9_95;
l9_92=l9_96;
}
int l9_97=l9_92;
float2 l9_98=l9_90;
int l9_99=sc_RayTracingShadowsLayout_tmp;
int l9_100=l9_97;
float l9_101=l9_91;
float2 l9_102=l9_98;
int l9_103=l9_99;
int l9_104=l9_100;
float3 l9_105=float3(0.0);
if (l9_103==0)
{
l9_105=float3(l9_102,0.0);
}
else
{
if (l9_103==1)
{
l9_105=float3(l9_102.x,(l9_102.y*0.5)+(0.5-(float(l9_104)*0.5)),0.0);
}
else
{
l9_105=float3(l9_102,float(l9_104));
}
}
float3 l9_106=l9_105;
float3 l9_107=l9_106;
float4 l9_108=sc_set0.sc_RayTracingShadows.sample(sc_set0.sc_RayTracingShadowsSmpSC,l9_107.xy,bias(l9_101));
float4 l9_109=l9_108;
float4 l9_110=l9_109;
float l9_111=l9_110.x;
float l9_112=1.0-l9_111;
l9_32.directDiffuse*=l9_112;
l9_32.directSpecular*=l9_112;
}
SurfaceProperties l9_113=l9_29;
float3 l9_114=l9_113.normal;
float3 l9_115=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_116=l9_114;
float3 l9_117=l9_116;
float l9_118=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_119=float2(0.0);
float l9_120=l9_117.x;
float l9_121=-l9_117.z;
float l9_122=(l9_120<0.0) ? (-1.0) : 1.0;
float l9_123=l9_122*acos(fast::clamp(l9_121/length(float2(l9_120,l9_121)),-1.0,1.0));
l9_119.x=l9_123-1.5707964;
l9_119.y=acos(l9_117.y);
l9_119/=float2(6.2831855,3.1415927);
l9_119.y=1.0-l9_119.y;
l9_119.x+=(l9_118/360.0);
l9_119.x=fract((l9_119.x+floor(l9_119.x))+1.0);
float2 l9_124=l9_119;
float2 l9_125=l9_124;
float4 l9_126=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_127=l9_125;
float2 l9_128=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_129=5.0;
l9_125=calcSeamlessPanoramicUvsForSampling(l9_127,l9_128,l9_129);
}
float2 l9_130=l9_125;
float l9_131=13.0;
int l9_132;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_133=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_133=0;
}
else
{
l9_133=in.varStereoViewID;
}
int l9_134=l9_133;
l9_132=1-l9_134;
}
else
{
int l9_135=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_135=0;
}
else
{
l9_135=in.varStereoViewID;
}
int l9_136=l9_135;
l9_132=l9_136;
}
int l9_137=l9_132;
float2 l9_138=l9_130;
int l9_139=sc_EnvmapSpecularLayout_tmp;
int l9_140=l9_137;
float l9_141=l9_131;
float2 l9_142=l9_138;
int l9_143=l9_139;
int l9_144=l9_140;
float3 l9_145=float3(0.0);
if (l9_143==0)
{
l9_145=float3(l9_142,0.0);
}
else
{
if (l9_143==1)
{
l9_145=float3(l9_142.x,(l9_142.y*0.5)+(0.5-(float(l9_144)*0.5)),0.0);
}
else
{
l9_145=float3(l9_142,float(l9_144));
}
}
float3 l9_146=l9_145;
float3 l9_147=l9_146;
float4 l9_148=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_147.xy,bias(l9_141));
float4 l9_149=l9_148;
l9_126=l9_149;
}
else
{
if ((int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_150=l9_125;
float2 l9_151=(*sc_set0.UserUniforms).sc_EnvmapDiffuseSize.xy;
float l9_152=0.0;
l9_125=calcSeamlessPanoramicUvsForSampling(l9_150,l9_151,l9_152);
float2 l9_153=l9_125;
float l9_154=-13.0;
int l9_155;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_156=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_156=0;
}
else
{
l9_156=in.varStereoViewID;
}
int l9_157=l9_156;
l9_155=1-l9_157;
}
else
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=in.varStereoViewID;
}
int l9_159=l9_158;
l9_155=l9_159;
}
int l9_160=l9_155;
float2 l9_161=l9_153;
int l9_162=sc_EnvmapDiffuseLayout_tmp;
int l9_163=l9_160;
float l9_164=l9_154;
float2 l9_165=l9_161;
int l9_166=l9_162;
int l9_167=l9_163;
float3 l9_168=float3(0.0);
if (l9_166==0)
{
l9_168=float3(l9_165,0.0);
}
else
{
if (l9_166==1)
{
l9_168=float3(l9_165.x,(l9_165.y*0.5)+(0.5-(float(l9_167)*0.5)),0.0);
}
else
{
l9_168=float3(l9_165,float(l9_167));
}
}
float3 l9_169=l9_168;
float3 l9_170=l9_169;
float4 l9_171=sc_set0.sc_EnvmapDiffuse.sample(sc_set0.sc_EnvmapDiffuseSmpSC,l9_170.xy,bias(l9_164));
float4 l9_172=l9_171;
l9_126=l9_172;
}
else
{
float2 l9_173=l9_125;
float l9_174=13.0;
int l9_175;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_176=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_176=0;
}
else
{
l9_176=in.varStereoViewID;
}
int l9_177=l9_176;
l9_175=1-l9_177;
}
else
{
int l9_178=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_178=0;
}
else
{
l9_178=in.varStereoViewID;
}
int l9_179=l9_178;
l9_175=l9_179;
}
int l9_180=l9_175;
float2 l9_181=l9_173;
int l9_182=sc_EnvmapSpecularLayout_tmp;
int l9_183=l9_180;
float l9_184=l9_174;
float2 l9_185=l9_181;
int l9_186=l9_182;
int l9_187=l9_183;
float3 l9_188=float3(0.0);
if (l9_186==0)
{
l9_188=float3(l9_185,0.0);
}
else
{
if (l9_186==1)
{
l9_188=float3(l9_185.x,(l9_185.y*0.5)+(0.5-(float(l9_187)*0.5)),0.0);
}
else
{
l9_188=float3(l9_185,float(l9_187));
}
}
float3 l9_189=l9_188;
float3 l9_190=l9_189;
float4 l9_191=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_190.xy,bias(l9_184));
float4 l9_192=l9_191;
l9_126=l9_192;
}
}
float4 l9_193=l9_126;
float3 l9_194=l9_193.xyz*(1.0/l9_193.w);
float3 l9_195=l9_194*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_115=l9_195;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_196=(*sc_set0.UserUniforms).sc_Sh[0];
float3 l9_197=(*sc_set0.UserUniforms).sc_Sh[1];
float3 l9_198=(*sc_set0.UserUniforms).sc_Sh[2];
float3 l9_199=(*sc_set0.UserUniforms).sc_Sh[3];
float3 l9_200=(*sc_set0.UserUniforms).sc_Sh[4];
float3 l9_201=(*sc_set0.UserUniforms).sc_Sh[5];
float3 l9_202=(*sc_set0.UserUniforms).sc_Sh[6];
float3 l9_203=(*sc_set0.UserUniforms).sc_Sh[7];
float3 l9_204=(*sc_set0.UserUniforms).sc_Sh[8];
float3 l9_205=-l9_114;
float l9_206=0.0;
l9_206=l9_205.x;
float l9_207=l9_205.y;
float l9_208=l9_205.z;
float l9_209=l9_206*l9_206;
float l9_210=l9_207*l9_207;
float l9_211=l9_208*l9_208;
float l9_212=l9_206*l9_207;
float l9_213=l9_207*l9_208;
float l9_214=l9_206*l9_208;
float3 l9_215=((((((l9_204*0.42904299)*(l9_209-l9_210))+((l9_202*0.74312502)*l9_211))+(l9_196*0.88622701))-(l9_202*0.24770799))+((((l9_200*l9_212)+(l9_203*l9_214))+(l9_201*l9_213))*0.85808599))+((((l9_199*l9_206)+(l9_197*l9_207))+(l9_198*l9_208))*1.0233279);
l9_115=l9_215*(*sc_set0.UserUniforms).sc_ShIntensity;
}
}
if (((*sc_set0.UserUniforms).sc_RayTracingReceiverEffectsMask&2)!=0)
{
float4 l9_216=gl_FragCoord;
float2 l9_217=l9_216.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_218=l9_217;
float2 l9_219=l9_218;
float l9_220=0.0;
int l9_221;
if ((int(sc_RayTracingGlobalIlluminationHasSwappedViews_tmp)!=0))
{
int l9_222=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_222=0;
}
else
{
l9_222=in.varStereoViewID;
}
int l9_223=l9_222;
l9_221=1-l9_223;
}
else
{
int l9_224=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_224=0;
}
else
{
l9_224=in.varStereoViewID;
}
int l9_225=l9_224;
l9_221=l9_225;
}
int l9_226=l9_221;
float2 l9_227=l9_219;
int l9_228=sc_RayTracingGlobalIlluminationLayout_tmp;
int l9_229=l9_226;
float l9_230=l9_220;
float2 l9_231=l9_227;
int l9_232=l9_228;
int l9_233=l9_229;
float3 l9_234=float3(0.0);
if (l9_232==0)
{
l9_234=float3(l9_231,0.0);
}
else
{
if (l9_232==1)
{
l9_234=float3(l9_231.x,(l9_231.y*0.5)+(0.5-(float(l9_233)*0.5)),0.0);
}
else
{
l9_234=float3(l9_231,float(l9_233));
}
}
float3 l9_235=l9_234;
float3 l9_236=l9_235;
float4 l9_237=sc_set0.sc_RayTracingGlobalIllumination.sample(sc_set0.sc_RayTracingGlobalIlluminationSmpSC,l9_236.xy,bias(l9_230));
float4 l9_238=l9_237;
float4 l9_239=l9_238;
float4 l9_240=l9_239;
l9_115=mix(l9_115,l9_240.xyz,float3(l9_240.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_115+=((*sc_set0.UserUniforms).sc_AmbientLights[0].color*(*sc_set0.UserUniforms).sc_AmbientLights[0].intensity);
}
else
{
l9_115.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_115+=((*sc_set0.UserUniforms).sc_AmbientLights[1].color*(*sc_set0.UserUniforms).sc_AmbientLights[1].intensity);
}
else
{
l9_115.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_115+=((*sc_set0.UserUniforms).sc_AmbientLights[2].color*(*sc_set0.UserUniforms).sc_AmbientLights[2].intensity);
}
else
{
l9_115.x+=(1e-06*(*sc_set0.UserUniforms).sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_241=l9_114;
float3 l9_242=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_243;
float l9_244;
int l9_245=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_245<sc_LightEstimationSGCount_tmp)
{
l9_243.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_245].color;
l9_243.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_245].sharpness;
l9_243.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_245].axis;
float3 l9_246=l9_241;
float l9_247=dot(l9_243.axis,l9_246);
float l9_248=l9_243.sharpness;
float l9_249=0.36000001;
float l9_250=1.0/(4.0*l9_249);
float l9_251=exp(-l9_248);
float l9_252=l9_251*l9_251;
float l9_253=1.0/l9_248;
float l9_254=(1.0+(2.0*l9_252))-l9_253;
float l9_255=((l9_251-l9_252)*l9_253)-l9_252;
float l9_256=sqrt(1.0-l9_254);
float l9_257=l9_249*l9_247;
float l9_258=l9_250*l9_256;
float l9_259=l9_257+l9_258;
float l9_260=l9_247;
float l9_261=fast::clamp(l9_260,0.0,1.0);
float l9_262=l9_261;
if (step(abs(l9_257),l9_258)>0.5)
{
l9_244=(l9_259*l9_259)/l9_256;
}
else
{
l9_244=l9_262;
}
l9_262=l9_244;
float l9_263=(l9_254*l9_262)+l9_255;
sc_SphericalGaussianLight_t l9_264=l9_243;
float3 l9_265=(l9_264.color/float3(l9_264.sharpness))*6.2831855;
float3 l9_266=(l9_265*l9_263)/float3(3.1415927);
l9_242+=l9_266;
l9_245++;
continue;
}
else
{
break;
}
}
float3 l9_267=l9_242;
l9_115+=l9_267;
}
float3 l9_268=l9_115;
float3 l9_269=l9_268;
l9_32.indirectDiffuse=l9_269;
SurfaceProperties l9_270=l9_29;
float3 l9_271=l9_33;
float3 l9_272=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
SurfaceProperties l9_273=l9_270;
float3 l9_274=l9_271;
float3 l9_275=l9_273.normal;
float3 l9_276=reflect(-l9_274,l9_275);
float3 l9_277=l9_275;
float3 l9_278=l9_276;
float l9_279=l9_273.roughness;
l9_276=getSpecularDominantDir(l9_277,l9_278,l9_279);
float l9_280=l9_273.roughness;
float l9_281=pow(l9_280,0.66666669);
float l9_282=fast::clamp(l9_281,0.0,1.0);
float l9_283=l9_282*5.0;
float l9_284=l9_283;
float l9_285=l9_284;
float3 l9_286=l9_276;
float l9_287=l9_285;
float3 l9_288=l9_286;
float l9_289=l9_287;
float4 l9_290=float4(0.0);
float3 l9_291=l9_288;
float l9_292=(*sc_set0.UserUniforms).sc_EnvmapRotation.y;
float2 l9_293=float2(0.0);
float l9_294=l9_291.x;
float l9_295=-l9_291.z;
float l9_296=(l9_294<0.0) ? (-1.0) : 1.0;
float l9_297=l9_296*acos(fast::clamp(l9_295/length(float2(l9_294,l9_295)),-1.0,1.0));
l9_293.x=l9_297-1.5707964;
l9_293.y=acos(l9_291.y);
l9_293/=float2(6.2831855,3.1415927);
l9_293.y=1.0-l9_293.y;
l9_293.x+=(l9_292/360.0);
l9_293.x=fract((l9_293.x+floor(l9_293.x))+1.0);
float2 l9_298=l9_293;
float2 l9_299=l9_298;
if (SC_DEVICE_CLASS_tmp>=2)
{
float l9_300=floor(l9_289);
float l9_301=ceil(l9_289);
float l9_302=l9_289-l9_300;
float2 l9_303=l9_299;
float2 l9_304=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_305=l9_300;
float2 l9_306=calcSeamlessPanoramicUvsForSampling(l9_303,l9_304,l9_305);
float2 l9_307=l9_306;
float l9_308=l9_300;
float2 l9_309=l9_307;
float l9_310=l9_308;
int l9_311;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_312=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_312=0;
}
else
{
l9_312=in.varStereoViewID;
}
int l9_313=l9_312;
l9_311=1-l9_313;
}
else
{
int l9_314=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_314=0;
}
else
{
l9_314=in.varStereoViewID;
}
int l9_315=l9_314;
l9_311=l9_315;
}
int l9_316=l9_311;
float2 l9_317=l9_309;
int l9_318=sc_EnvmapSpecularLayout_tmp;
int l9_319=l9_316;
float l9_320=l9_310;
float2 l9_321=l9_317;
int l9_322=l9_318;
int l9_323=l9_319;
float3 l9_324=float3(0.0);
if (l9_322==0)
{
l9_324=float3(l9_321,0.0);
}
else
{
if (l9_322==1)
{
l9_324=float3(l9_321.x,(l9_321.y*0.5)+(0.5-(float(l9_323)*0.5)),0.0);
}
else
{
l9_324=float3(l9_321,float(l9_323));
}
}
float3 l9_325=l9_324;
float3 l9_326=l9_325;
float4 l9_327=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_326.xy,level(l9_320));
float4 l9_328=l9_327;
float4 l9_329=l9_328;
float4 l9_330=l9_329;
float2 l9_331=l9_299;
float2 l9_332=(*sc_set0.UserUniforms).sc_EnvmapSpecularSize.xy;
float l9_333=l9_301;
float2 l9_334=calcSeamlessPanoramicUvsForSampling(l9_331,l9_332,l9_333);
float2 l9_335=l9_334;
float l9_336=l9_301;
float2 l9_337=l9_335;
float l9_338=l9_336;
int l9_339;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_340=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_340=0;
}
else
{
l9_340=in.varStereoViewID;
}
int l9_341=l9_340;
l9_339=1-l9_341;
}
else
{
int l9_342=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_342=0;
}
else
{
l9_342=in.varStereoViewID;
}
int l9_343=l9_342;
l9_339=l9_343;
}
int l9_344=l9_339;
float2 l9_345=l9_337;
int l9_346=sc_EnvmapSpecularLayout_tmp;
int l9_347=l9_344;
float l9_348=l9_338;
float2 l9_349=l9_345;
int l9_350=l9_346;
int l9_351=l9_347;
float3 l9_352=float3(0.0);
if (l9_350==0)
{
l9_352=float3(l9_349,0.0);
}
else
{
if (l9_350==1)
{
l9_352=float3(l9_349.x,(l9_349.y*0.5)+(0.5-(float(l9_351)*0.5)),0.0);
}
else
{
l9_352=float3(l9_349,float(l9_351));
}
}
float3 l9_353=l9_352;
float3 l9_354=l9_353;
float4 l9_355=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_354.xy,level(l9_348));
float4 l9_356=l9_355;
float4 l9_357=l9_356;
float4 l9_358=l9_357;
l9_290=mix(l9_330,l9_358,float4(l9_302));
}
else
{
float2 l9_359=l9_299;
float l9_360=l9_289;
float2 l9_361=l9_359;
float l9_362=l9_360;
int l9_363;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_364=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_364=0;
}
else
{
l9_364=in.varStereoViewID;
}
int l9_365=l9_364;
l9_363=1-l9_365;
}
else
{
int l9_366=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_366=0;
}
else
{
l9_366=in.varStereoViewID;
}
int l9_367=l9_366;
l9_363=l9_367;
}
int l9_368=l9_363;
float2 l9_369=l9_361;
int l9_370=sc_EnvmapSpecularLayout_tmp;
int l9_371=l9_368;
float l9_372=l9_362;
float2 l9_373=l9_369;
int l9_374=l9_370;
int l9_375=l9_371;
float3 l9_376=float3(0.0);
if (l9_374==0)
{
l9_376=float3(l9_373,0.0);
}
else
{
if (l9_374==1)
{
l9_376=float3(l9_373.x,(l9_373.y*0.5)+(0.5-(float(l9_375)*0.5)),0.0);
}
else
{
l9_376=float3(l9_373,float(l9_375));
}
}
float3 l9_377=l9_376;
float3 l9_378=l9_377;
float4 l9_379=sc_set0.sc_EnvmapSpecular.sample(sc_set0.sc_EnvmapSpecularSmpSC,l9_378.xy,level(l9_372));
float4 l9_380=l9_379;
float4 l9_381=l9_380;
l9_290=l9_381;
}
float4 l9_382=l9_290;
float3 l9_383=l9_382.xyz*(1.0/l9_382.w);
float3 l9_384=l9_383;
float3 l9_385=l9_384*(*sc_set0.UserUniforms).sc_EnvmapExposure;
l9_385+=float3(1e-06);
float3 l9_386=l9_385;
float3 l9_387=l9_386;
if (((*sc_set0.UserUniforms).sc_RayTracingReceiverEffectsMask&1)!=0)
{
float4 l9_388=gl_FragCoord;
float2 l9_389=l9_388.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_390=l9_389;
float2 l9_391=l9_390;
float l9_392=0.0;
int l9_393;
if ((int(sc_RayTracingReflectionsHasSwappedViews_tmp)!=0))
{
int l9_394=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_394=0;
}
else
{
l9_394=in.varStereoViewID;
}
int l9_395=l9_394;
l9_393=1-l9_395;
}
else
{
int l9_396=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_396=0;
}
else
{
l9_396=in.varStereoViewID;
}
int l9_397=l9_396;
l9_393=l9_397;
}
int l9_398=l9_393;
float2 l9_399=l9_391;
int l9_400=sc_RayTracingReflectionsLayout_tmp;
int l9_401=l9_398;
float l9_402=l9_392;
float2 l9_403=l9_399;
int l9_404=l9_400;
int l9_405=l9_401;
float3 l9_406=float3(0.0);
if (l9_404==0)
{
l9_406=float3(l9_403,0.0);
}
else
{
if (l9_404==1)
{
l9_406=float3(l9_403.x,(l9_403.y*0.5)+(0.5-(float(l9_405)*0.5)),0.0);
}
else
{
l9_406=float3(l9_403,float(l9_405));
}
}
float3 l9_407=l9_406;
float3 l9_408=l9_407;
float4 l9_409=sc_set0.sc_RayTracingReflections.sample(sc_set0.sc_RayTracingReflectionsSmpSC,l9_408.xy,bias(l9_402));
float4 l9_410=l9_409;
float4 l9_411=l9_410;
float4 l9_412=l9_411;
l9_387=mix(l9_387,l9_412.xyz,float3(l9_412.w));
}
float l9_413=abs(dot(l9_275,l9_274));
SurfaceProperties l9_414=l9_273;
float l9_415=l9_413;
float3 l9_416=l9_387*envBRDFApprox(l9_414,l9_415);
l9_272+=l9_416;
}
if ((int(sc_LightEstimation_tmp)!=0))
{
SurfaceProperties l9_417=l9_270;
float3 l9_418=l9_271;
float l9_419=fast::clamp(l9_417.roughness*l9_417.roughness,0.0099999998,1.0);
float3 l9_420=(*sc_set0.UserUniforms).sc_LightEstimationData.ambientLight*l9_417.specColor;
sc_SphericalGaussianLight_t l9_421;
sc_SphericalGaussianLight_t l9_422;
sc_SphericalGaussianLight_t l9_423;
int l9_424=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_424<sc_LightEstimationSGCount_tmp)
{
l9_421.color=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_424].color;
l9_421.sharpness=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_424].sharpness;
l9_421.axis=(*sc_set0.UserUniforms).sc_LightEstimationData.sg[l9_424].axis;
float3 l9_425=l9_417.normal;
float l9_426=l9_419;
float3 l9_427=l9_418;
float3 l9_428=l9_417.specColor;
float3 l9_429=l9_425;
float l9_430=l9_426;
l9_422.axis=l9_429;
float l9_431=l9_430*l9_430;
l9_422.sharpness=2.0/l9_431;
l9_422.color=float3(1.0/(3.1415927*l9_431));
sc_SphericalGaussianLight_t l9_432=l9_422;
sc_SphericalGaussianLight_t l9_433=l9_432;
sc_SphericalGaussianLight_t l9_434=l9_433;
float3 l9_435=l9_427;
l9_423.axis=reflect(-l9_435,l9_434.axis);
l9_423.color=l9_434.color;
l9_423.sharpness=l9_434.sharpness;
l9_423.sharpness/=(4.0*fast::max(dot(l9_434.axis,l9_435),9.9999997e-05));
sc_SphericalGaussianLight_t l9_436=l9_423;
sc_SphericalGaussianLight_t l9_437=l9_436;
sc_SphericalGaussianLight_t l9_438=l9_437;
sc_SphericalGaussianLight_t l9_439=l9_421;
float l9_440=length((l9_438.axis*l9_438.sharpness)+(l9_439.axis*l9_439.sharpness));
float3 l9_441=(l9_438.color*exp((l9_440-l9_438.sharpness)-l9_439.sharpness))*l9_439.color;
float l9_442=1.0-exp((-2.0)*l9_440);
float3 l9_443=((l9_441*6.2831855)*l9_442)/float3(l9_440);
float3 l9_444=l9_443;
float3 l9_445=l9_437.axis;
float l9_446=l9_426*l9_426;
float l9_447=dot(l9_425,l9_445);
float l9_448=fast::clamp(l9_447,0.0,1.0);
float l9_449=l9_448;
float l9_450=dot(l9_425,l9_427);
float l9_451=fast::clamp(l9_450,0.0,1.0);
float l9_452=l9_451;
float3 l9_453=normalize(l9_437.axis+l9_427);
float l9_454=l9_446;
float l9_455=l9_449;
float l9_456=1.0/(l9_455+sqrt(l9_454+(((1.0-l9_454)*l9_455)*l9_455)));
float l9_457=l9_446;
float l9_458=l9_452;
float l9_459=1.0/(l9_458+sqrt(l9_457+(((1.0-l9_457)*l9_458)*l9_458)));
l9_444*=(l9_456*l9_459);
float l9_460=dot(l9_445,l9_453);
float l9_461=fast::clamp(l9_460,0.0,1.0);
float l9_462=pow(1.0-l9_461,5.0);
l9_444*=(l9_428+((float3(1.0)-l9_428)*l9_462));
l9_444*=l9_449;
float3 l9_463=l9_444;
l9_420+=l9_463;
l9_424++;
continue;
}
else
{
break;
}
}
float3 l9_464=l9_420;
l9_272+=l9_464;
}
float3 l9_465=l9_272;
l9_32.indirectSpecular=l9_465;
LightingComponents l9_466=l9_32;
LightingComponents l9_467=l9_466;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_467.directDiffuse=float3(0.0);
l9_467.indirectDiffuse=float3(0.0);
float4 l9_468=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_469=out.sc_FragData0;
l9_468=l9_469;
}
else
{
float4 l9_470=gl_FragCoord;
float2 l9_471=l9_470.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_472=l9_471;
float2 l9_473=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_474=1;
int l9_475=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_475=0;
}
else
{
l9_475=in.varStereoViewID;
}
int l9_476=l9_475;
int l9_477=l9_476;
float3 l9_478=float3(l9_472,0.0);
int l9_479=l9_474;
int l9_480=l9_477;
if (l9_479==1)
{
l9_478.y=((2.0*l9_478.y)+float(l9_480))-1.0;
}
float2 l9_481=l9_478.xy;
l9_473=l9_481;
}
else
{
l9_473=l9_472;
}
float2 l9_482=l9_473;
float2 l9_483=l9_482;
float2 l9_484=l9_483;
float2 l9_485=l9_484;
float l9_486=0.0;
int l9_487;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_488=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_488=0;
}
else
{
l9_488=in.varStereoViewID;
}
int l9_489=l9_488;
l9_487=1-l9_489;
}
else
{
int l9_490=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_490=0;
}
else
{
l9_490=in.varStereoViewID;
}
int l9_491=l9_490;
l9_487=l9_491;
}
int l9_492=l9_487;
float2 l9_493=l9_485;
int l9_494=sc_ScreenTextureLayout_tmp;
int l9_495=l9_492;
float l9_496=l9_486;
float2 l9_497=l9_493;
int l9_498=l9_494;
int l9_499=l9_495;
float3 l9_500=float3(0.0);
if (l9_498==0)
{
l9_500=float3(l9_497,0.0);
}
else
{
if (l9_498==1)
{
l9_500=float3(l9_497.x,(l9_497.y*0.5)+(0.5-(float(l9_499)*0.5)),0.0);
}
else
{
l9_500=float3(l9_497,float(l9_499));
}
}
float3 l9_501=l9_500;
float3 l9_502=l9_501;
float4 l9_503=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_502.xy,bias(l9_496));
float4 l9_504=l9_503;
float4 l9_505=l9_504;
l9_468=l9_505;
}
float4 l9_506=l9_468;
float3 l9_507=l9_506.xyz;
float3 l9_508;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_508=float3(pow(l9_507.x,2.2),pow(l9_507.y,2.2),pow(l9_507.z,2.2));
}
else
{
l9_508=l9_507*l9_507;
}
float3 l9_509=l9_508;
float3 l9_510=l9_509;
l9_467.transmitted=l9_510*mix(float3(1.0),l9_16.albedo,float3(l9_16.opacity));
l9_16.opacity=1.0;
}
bool l9_511=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_511=true;
}
SurfaceProperties l9_512=l9_16;
LightingComponents l9_513=l9_467;
bool l9_514=l9_511;
float3 l9_515=l9_512.albedo*(l9_513.directDiffuse+(l9_513.indirectDiffuse*l9_512.ao));
float3 l9_516=l9_513.directSpecular+(l9_513.indirectSpecular*l9_512.specularAo);
float3 l9_517=l9_512.emissive;
float3 l9_518=l9_513.transmitted;
if (l9_514)
{
float l9_519=l9_512.opacity;
l9_515*=srgbToLinear(l9_519);
}
float3 l9_520=((l9_515+l9_516)+l9_517)+l9_518;
float3 l9_521=l9_520;
float4 l9_522=float4(l9_521,l9_16.opacity);
if ((int(sc_IsEditor_tmp)!=0))
{
l9_522.x+=((l9_16.ao.x*l9_16.specularAo.x)*9.9999997e-06);
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 l9_523=l9_522.xyz;
float l9_524=1.8;
float l9_525=1.4;
float l9_526=0.5;
float l9_527=1.5;
float3 l9_528=(l9_523*((l9_523*l9_524)+float3(l9_525)))/((l9_523*((l9_523*l9_524)+float3(l9_526)))+float3(l9_527));
l9_522=float4(l9_528.x,l9_528.y,l9_528.z,l9_522.w);
}
float3 l9_529=l9_522.xyz;
float l9_530=l9_529.x;
float l9_531=l9_529.y;
float l9_532=l9_529.z;
float3 l9_533=float3(linearToSrgb(l9_530),linearToSrgb(l9_531),linearToSrgb(l9_532));
l9_522=float4(l9_533.x,l9_533.y,l9_533.z,l9_522.w);
float4 l9_534=l9_522;
param_7=l9_534;
}
param_7=fast::max(param_7,float4(0.0));
Output_N6=param_7;
FinalColor=Output_N6;
float4 param_9=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_535=param_9;
float4 l9_536=l9_535;
float l9_537=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_537=l9_536.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_537=fast::clamp(l9_536.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_537=fast::clamp(dot(l9_536.xyz,float3(l9_536.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_537=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_537=(1.0-dot(l9_536.xyz,float3(0.33333001)))*l9_536.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_537=(1.0-fast::clamp(dot(l9_536.xyz,float3(1.0)),0.0,1.0))*l9_536.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_537=fast::clamp(dot(l9_536.xyz,float3(1.0)),0.0,1.0)*l9_536.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_537=fast::clamp(dot(l9_536.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_537=fast::clamp(dot(l9_536.xyz,float3(1.0)),0.0,1.0)*l9_536.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_537=dot(l9_536.xyz,float3(0.33333001))*l9_536.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_537=1.0-fast::clamp(dot(l9_536.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_537=fast::clamp(dot(l9_536.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_538=l9_537;
float l9_539=l9_538;
float l9_540=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_539;
float3 l9_541=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_535.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_542=float4(l9_541.x,l9_541.y,l9_541.z,l9_540);
param_9=l9_542;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_9=float4(param_9.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_543=param_9;
float4 l9_544=float4(0.0);
float4 l9_545=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_546=out.sc_FragData0;
l9_545=l9_546;
}
else
{
float4 l9_547=gl_FragCoord;
float2 l9_548=l9_547.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_549=l9_548;
float2 l9_550=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_551=1;
int l9_552=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_552=0;
}
else
{
l9_552=in.varStereoViewID;
}
int l9_553=l9_552;
int l9_554=l9_553;
float3 l9_555=float3(l9_549,0.0);
int l9_556=l9_551;
int l9_557=l9_554;
if (l9_556==1)
{
l9_555.y=((2.0*l9_555.y)+float(l9_557))-1.0;
}
float2 l9_558=l9_555.xy;
l9_550=l9_558;
}
else
{
l9_550=l9_549;
}
float2 l9_559=l9_550;
float2 l9_560=l9_559;
float2 l9_561=l9_560;
float2 l9_562=l9_561;
float l9_563=0.0;
int l9_564;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_565=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_565=0;
}
else
{
l9_565=in.varStereoViewID;
}
int l9_566=l9_565;
l9_564=1-l9_566;
}
else
{
int l9_567=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_567=0;
}
else
{
l9_567=in.varStereoViewID;
}
int l9_568=l9_567;
l9_564=l9_568;
}
int l9_569=l9_564;
float2 l9_570=l9_562;
int l9_571=sc_ScreenTextureLayout_tmp;
int l9_572=l9_569;
float l9_573=l9_563;
float2 l9_574=l9_570;
int l9_575=l9_571;
int l9_576=l9_572;
float3 l9_577=float3(0.0);
if (l9_575==0)
{
l9_577=float3(l9_574,0.0);
}
else
{
if (l9_575==1)
{
l9_577=float3(l9_574.x,(l9_574.y*0.5)+(0.5-(float(l9_576)*0.5)),0.0);
}
else
{
l9_577=float3(l9_574,float(l9_576));
}
}
float3 l9_578=l9_577;
float3 l9_579=l9_578;
float4 l9_580=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_579.xy,bias(l9_573));
float4 l9_581=l9_580;
float4 l9_582=l9_581;
l9_545=l9_582;
}
float4 l9_583=l9_545;
float3 l9_584=l9_583.xyz;
float3 l9_585=l9_584;
float3 l9_586=l9_543.xyz;
float3 l9_587=definedBlend(l9_585,l9_586,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_544=float4(l9_587.x,l9_587.y,l9_587.z,l9_544.w);
float3 l9_588=mix(l9_584,l9_544.xyz,float3(l9_543.w));
l9_544=float4(l9_588.x,l9_588.y,l9_588.z,l9_544.w);
l9_544.w=1.0;
float4 l9_589=l9_544;
param_9=l9_589;
}
else
{
if ((int(sc_Voxelization_tmp)!=0))
{
float4 l9_590=float4(in.varScreenPos.xyz,1.0);
param_9=l9_590;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
float4 l9_591=gl_FragCoord;
float l9_592=fast::clamp(abs(l9_591.z),0.0,1.0);
float4 l9_593=float4(l9_592,1.0-l9_592,1.0,1.0);
param_9=l9_593;
}
else
{
float4 l9_594=param_9;
float4 l9_595=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_595=float4(mix(float3(1.0),l9_594.xyz,float3(l9_594.w)),l9_594.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_596=l9_594.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_596=fast::clamp(l9_596,0.0,1.0);
}
l9_595=float4(l9_594.xyz*l9_596,l9_596);
}
else
{
l9_595=l9_594;
}
}
float4 l9_597=l9_595;
param_9=l9_597;
}
}
}
}
}
float4 l9_598=param_9;
FinalColor=l9_598;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_599=float4(0.0);
l9_599=float4(0.0);
float4 l9_600=l9_599;
float4 Cost=l9_600;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_10=FinalColor;
FinalColor=sc_OutputMotionVectorIfNeeded(param_10,in.varPosAndMotion,in.varNormalAndMotion);
float4 param_11=FinalColor;
float4 l9_601=param_11;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_601.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=l9_601;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float3 VertexNormal_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float shaderComplexityValue;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int sc_RayTracingReceiverEffectsMask;
float4 sc_RayTracingReflectionsSize;
float4 sc_RayTracingReflectionsDims;
float4 sc_RayTracingReflectionsView;
float4 sc_RayTracingGlobalIlluminationSize;
float4 sc_RayTracingGlobalIlluminationDims;
float4 sc_RayTracingGlobalIlluminationView;
float4 sc_RayTracingShadowsSize;
float4 sc_RayTracingShadowsDims;
float4 sc_RayTracingShadowsView;
float3 sc_RayTracingOriginScale;
uint sc_RayTracingReceiverMask;
float3 sc_RayTracingOriginScaleInv;
float3 sc_RayTracingOriginOffset;
uint sc_RayTracingReceiverId;
float4 voxelization_params_0;
float4 voxelization_params_frustum_lrbt;
float4 voxelization_params_frustum_nf;
float3 voxelization_params_camera_pos;
float4x4 sc_ModelMatrixVoxelization;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed[32];
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float strength;
float noiseScale;
float animatedSpeed;
float offset;
float Port_Import_N031;
float Port_Import_N046;
float3 Port_Import_N034;
float3 Port_Import_N029;
float Port_Import_N037;
float Port_Input1_N038;
float Port_Input2_N038;
float3 Port_Import_N064;
float Port_Import_N054;
float2 Port_Scale_N017;
float3 Port_Albedo_N006;
float Port_Opacity_N006;
float3 Port_Normal_N006;
float3 Port_Emissive_N006;
float Port_Metallic_N006;
float Port_Roughness_N006;
float3 Port_AO_N006;
float3 Port_SpecularAO_N006;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> intensityTexture [[id(1)]];
texture2d<float> sc_EnvmapDiffuse [[id(2)]];
texture2d<float> sc_EnvmapSpecular [[id(3)]];
texture2d<float> sc_RayTracingGlobalIllumination [[id(12)]];
texture2d<float> sc_RayTracingReflections [[id(13)]];
texture2d<float> sc_RayTracingShadows [[id(14)]];
texture2d<float> sc_SSAOTexture [[id(15)]];
texture2d<float> sc_ScreenTexture [[id(16)]];
texture2d<float> sc_ShadowTexture [[id(17)]];
sampler intensityTextureSmpSC [[id(19)]];
sampler sc_EnvmapDiffuseSmpSC [[id(20)]];
sampler sc_EnvmapSpecularSmpSC [[id(21)]];
sampler sc_RayTracingGlobalIlluminationSmpSC [[id(23)]];
sampler sc_RayTracingReflectionsSmpSC [[id(24)]];
sampler sc_RayTracingShadowsSmpSC [[id(25)]];
sampler sc_SSAOTextureSmpSC [[id(26)]];
sampler sc_ScreenTextureSmpSC [[id(27)]];
sampler sc_ShadowTextureSmpSC [[id(28)]];
constant userUniformsObj* UserUniforms [[id(30)]];
};
struct main_recv_out
{
uint4 sc_RayTracingPositionAndMask [[color(0)]];
uint4 sc_RayTracingNormalAndMore [[color(1)]];
};
struct main_recv_in
{
float4 varPosAndMotion [[user(locn0)]];
float4 varNormalAndMotion [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varTex01 [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
ssGlobals Globals;
Globals.gTimeElapsed=(*sc_set0.UserUniforms).sc_Time.x;
Globals.gTimeDelta=(*sc_set0.UserUniforms).sc_Time.y;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPosAndMotion.xyz);
Globals.PositionWS=in.varPosAndMotion.xyz;
Globals.VertexNormal_WorldSpace=normalize(in.varNormalAndMotion.xyz);
float param=(*sc_set0.UserUniforms).Port_Opacity_N006;
float param_1=(*sc_set0.UserUniforms).Port_Roughness_N006;
ssGlobals param_2=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_2.BumpedNormal=param_2.VertexNormal_WorldSpace;
}
float l9_0=param;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_0<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1=gl_FragCoord;
float2 l9_2=floor(mod(l9_1.xy,float2(4.0)));
float l9_3=(mod(dot(l9_2,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_0<l9_3)
{
discard_fragment();
}
}
float3 l9_4=param_2.PositionWS;
float3 l9_5=param_2.BumpedNormal;
float l9_6=param_1;
float3 l9_7=l9_4;
float3 l9_8=l9_5;
float l9_9=l9_6;
uint l9_10=0u;
uint3 l9_11=uint3(round((l9_7-(*sc_set0.UserUniforms).sc_RayTracingOriginOffset)*(*sc_set0.UserUniforms).sc_RayTracingOriginScale));
out.sc_RayTracingPositionAndMask=uint4(l9_11.x,l9_11.y,l9_11.z,out.sc_RayTracingPositionAndMask.w);
out.sc_RayTracingPositionAndMask.w=(*sc_set0.UserUniforms).sc_RayTracingReceiverMask;
float3 l9_12=l9_8;
float l9_13=dot(abs(l9_12),float3(1.0));
l9_12/=float3(l9_13);
float2 l9_14=float2(fast::clamp(-l9_12.z,0.0,1.0));
float2 l9_15=l9_12.xy+mix(-l9_14,l9_14,step(float2(0.0),l9_12.xy));
uint l9_16=as_type<uint>(half2(l9_15));
uint2 l9_17=uint2(l9_16&65535u,l9_16>>16u);
out.sc_RayTracingNormalAndMore=uint4(l9_17.x,l9_17.y,out.sc_RayTracingNormalAndMore.z,out.sc_RayTracingNormalAndMore.w);
out.sc_RayTracingNormalAndMore.z=l9_10;
uint l9_18=uint(fast::clamp(l9_9,0.0,1.0)*1000.0);
l9_18 |= (((*sc_set0.UserUniforms).sc_RayTracingReceiverId%32u)<<10u);
out.sc_RayTracingNormalAndMore.w=l9_18;
return out;
}
} // RECEIVER MODE SHADER
