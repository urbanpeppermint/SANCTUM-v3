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
//sampler sampler depthImageSmpSC 0:18
//sampler sampler intensityTextureSmpSC 0:19
//sampler sampler sc_ScreenTextureSmpSC 0:24
//sampler sampler screenTexSmpSC 0:27
//texture texture2D depthImage 0:1:0:18
//texture texture2D intensityTexture 0:2:0:19
//texture texture2D sc_ScreenTexture 0:14:0:24
//texture texture2D screenTex 0:17:0:27
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[1]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:28:4672 {
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
//float4 voxelization_params_0 3824
//float4 voxelization_params_frustum_lrbt 3840
//float4 voxelization_params_frustum_nf 3856
//float3 voxelization_params_camera_pos 3872
//float4x4 sc_ModelMatrixVoxelization 3888
//float correctedIntensity 3952
//float3x3 intensityTextureTransform 4016
//float4 intensityTextureUvMinMax 4064
//float4 intensityTextureBorderColor 4080
//int PreviewEnabled 4244
//float alphaTestThreshold 4252
//float4 screenTexSize 4256
//float3x3 screenTexTransform 4304
//float4 screenTexUvMinMax 4352
//float4 screenTexBorderColor 4368
//float blurIntensity 4384
//float3x3 depthImageTransform 4448
//float4 depthImageUvMinMax 4496
//float4 depthImageBorderColor 4512
//float fallbacktexMult 4528
//float focusDistance 4532
//float aperture 4536
//float Port_Value_N041 4552
//float Port_Input2_N032 4556
//float Port_Input2_N033 4560
//float Port_RangeMinB_N035 4564
//float Port_RangeMaxB_N035 4568
//float Port_Input1_N043 4572
//float Port_Input1_N052 4576
//float Port_Input2_N052 4580
//float Port_Input1_N045 4588
//float2 Port_Item0_N016 4600
//float2 Port_Item1_N016 4608
//float2 Port_Item2_N016 4616
//float2 Port_Item3_N016 4624
//float2 Port_Item4_N016 4632
//float2 Port_Item5_N016 4640
//float2 Port_Item6_N016 4648
//float2 Port_Item7_N016 4656
//float Port_Input2_N105 4664
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_depthImage 31 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 32 0
//spec_const bool SC_USE_CLAMP_TO_BORDER_screenTex 33 0
//spec_const bool SC_USE_UV_MIN_MAX_depthImage 34 0
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 35 0
//spec_const bool SC_USE_UV_MIN_MAX_screenTex 36 0
//spec_const bool SC_USE_UV_TRANSFORM_depthImage 37 0
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 38 0
//spec_const bool SC_USE_UV_TRANSFORM_screenTex 39 0
//spec_const bool UseViewSpaceDepthVariant 40 1
//spec_const bool depthImageHasSwappedViews 41 0
//spec_const bool intensityTextureHasSwappedViews 42 0
//spec_const bool sc_BlendMode_AddWithAlphaFactor 43 0
//spec_const bool sc_BlendMode_Add 44 0
//spec_const bool sc_BlendMode_AlphaTest 45 0
//spec_const bool sc_BlendMode_AlphaToCoverage 46 0
//spec_const bool sc_BlendMode_ColoredGlass 47 0
//spec_const bool sc_BlendMode_Custom 48 0
//spec_const bool sc_BlendMode_Max 49 0
//spec_const bool sc_BlendMode_Min 50 0
//spec_const bool sc_BlendMode_MultiplyOriginal 51 0
//spec_const bool sc_BlendMode_Multiply 52 0
//spec_const bool sc_BlendMode_Normal 53 0
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 54 0
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 55 0
//spec_const bool sc_BlendMode_PremultipliedAlpha 56 0
//spec_const bool sc_BlendMode_Screen 57 0
//spec_const bool sc_DepthOnly 58 0
//spec_const bool sc_FramebufferFetch 59 0
//spec_const bool sc_MotionVectorsPass 60 0
//spec_const bool sc_OITCompositingPass 61 0
//spec_const bool sc_OITDepthBoundsPass 62 0
//spec_const bool sc_OITDepthGatherPass 63 0
//spec_const bool sc_OutputBounds 64 0
//spec_const bool sc_ProjectiveShadowsCaster 65 0
//spec_const bool sc_ProjectiveShadowsReceiver 66 0
//spec_const bool sc_RenderAlphaToColor 67 0
//spec_const bool sc_ScreenTextureHasSwappedViews 68 0
//spec_const bool sc_TAAEnabled 69 0
//spec_const bool sc_VertexBlendingUseNormals 70 0
//spec_const bool sc_VertexBlending 71 0
//spec_const bool sc_Voxelization 72 0
//spec_const bool screenTexHasSwappedViews 73 0
//spec_const int SC_SOFTWARE_WRAP_MODE_U_depthImage 74 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 75 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_U_screenTex 76 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_depthImage 77 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 78 -1
//spec_const int SC_SOFTWARE_WRAP_MODE_V_screenTex 79 -1
//spec_const int depthImageLayout 80 0
//spec_const int intensityTextureLayout 81 0
//spec_const int sc_DepthBufferMode 82 0
//spec_const int sc_RenderingSpace 83 -1
//spec_const int sc_ScreenTextureLayout 84 0
//spec_const int sc_ShaderCacheConstant 85 0
//spec_const int sc_SkinBonesCount 86 0
//spec_const int sc_StereoRenderingMode 87 0
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 88 0
//spec_const int screenTexLayout 89 0
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
constant bool SC_USE_CLAMP_TO_BORDER_depthImage [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_depthImage_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_depthImage) ? SC_USE_CLAMP_TO_BORDER_depthImage : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_screenTex [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_screenTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_screenTex) ? SC_USE_CLAMP_TO_BORDER_screenTex : false;
constant bool SC_USE_UV_MIN_MAX_depthImage [[function_constant(34)]];
constant bool SC_USE_UV_MIN_MAX_depthImage_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_depthImage) ? SC_USE_UV_MIN_MAX_depthImage : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(35)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_screenTex [[function_constant(36)]];
constant bool SC_USE_UV_MIN_MAX_screenTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_screenTex) ? SC_USE_UV_MIN_MAX_screenTex : false;
constant bool SC_USE_UV_TRANSFORM_depthImage [[function_constant(37)]];
constant bool SC_USE_UV_TRANSFORM_depthImage_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_depthImage) ? SC_USE_UV_TRANSFORM_depthImage : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(38)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_screenTex [[function_constant(39)]];
constant bool SC_USE_UV_TRANSFORM_screenTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_screenTex) ? SC_USE_UV_TRANSFORM_screenTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(40)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool depthImageHasSwappedViews [[function_constant(41)]];
constant bool depthImageHasSwappedViews_tmp = is_function_constant_defined(depthImageHasSwappedViews) ? depthImageHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(42)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(43)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(44)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(45)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(46)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(47)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(48)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(49)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(50)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(51)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(52)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(53)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(54)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(55)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(56)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(57)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(58)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(59)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(60)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(61)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(62)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(63)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_OutputBounds [[function_constant(64)]];
constant bool sc_OutputBounds_tmp = is_function_constant_defined(sc_OutputBounds) ? sc_OutputBounds : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(65)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(66)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(67)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(68)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_TAAEnabled [[function_constant(69)]];
constant bool sc_TAAEnabled_tmp = is_function_constant_defined(sc_TAAEnabled) ? sc_TAAEnabled : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(70)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(71)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool sc_Voxelization [[function_constant(72)]];
constant bool sc_Voxelization_tmp = is_function_constant_defined(sc_Voxelization) ? sc_Voxelization : false;
constant bool screenTexHasSwappedViews [[function_constant(73)]];
constant bool screenTexHasSwappedViews_tmp = is_function_constant_defined(screenTexHasSwappedViews) ? screenTexHasSwappedViews : false;
constant int SC_SOFTWARE_WRAP_MODE_U_depthImage [[function_constant(74)]];
constant int SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_depthImage) ? SC_SOFTWARE_WRAP_MODE_U_depthImage : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(75)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_screenTex [[function_constant(76)]];
constant int SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_screenTex) ? SC_SOFTWARE_WRAP_MODE_U_screenTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_depthImage [[function_constant(77)]];
constant int SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_depthImage) ? SC_SOFTWARE_WRAP_MODE_V_depthImage : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(78)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_screenTex [[function_constant(79)]];
constant int SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_screenTex) ? SC_SOFTWARE_WRAP_MODE_V_screenTex : -1;
constant int depthImageLayout [[function_constant(80)]];
constant int depthImageLayout_tmp = is_function_constant_defined(depthImageLayout) ? depthImageLayout : 0;
constant int intensityTextureLayout [[function_constant(81)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(82)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(83)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(84)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(85)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(86)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(87)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(88)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;
constant int screenTexLayout [[function_constant(89)]];
constant int screenTexLayout_tmp = is_function_constant_defined(screenTexLayout) ? screenTexLayout : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
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
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float blurIntensity;
float4 depthImageSize;
float4 depthImageDims;
float4 depthImageView;
float3x3 depthImageTransform;
float4 depthImageUvMinMax;
float4 depthImageBorderColor;
float fallbacktexMult;
float focusDistance;
float aperture;
float2 Port_Import_N042;
float Port_Value_N041;
float Port_Input2_N032;
float Port_Input2_N033;
float Port_RangeMinB_N035;
float Port_RangeMaxB_N035;
float Port_Input1_N043;
float Port_Input1_N052;
float Port_Input2_N052;
float Port_Import_N044;
float Port_Input1_N045;
float2 Port_Import_N009;
float2 Port_Item0_N016;
float2 Port_Item1_N016;
float2 Port_Item2_N016;
float2 Port_Item3_N016;
float2 Port_Item4_N016;
float2 Port_Item5_N016;
float2 Port_Item6_N016;
float2 Port_Item7_N016;
float Port_Input2_N105;
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
texture2d<float> depthImage [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
texture2d<float> screenTex [[id(17)]];
sampler depthImageSmpSC [[id(18)]];
sampler intensityTextureSmpSC [[id(19)]];
sampler sc_ScreenTextureSmpSC [[id(24)]];
sampler screenTexSmpSC [[id(27)]];
constant userUniformsObj* UserUniforms [[id(28)]];
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
float3 WorldPosition=out.varPosAndMotion.xyz;
float3 WorldNormal=out.varNormalAndMotion.xyz;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPosAndMotion.xyz;
WorldNormal=out.varNormalAndMotion.xyz;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_1=v;
float3 param_2=WorldPosition;
float3 param_3=WorldNormal;
float3 param_4=WorldTangent;
float4 param_5=v.position;
out.varPosAndMotion=float4(param_2.x,param_2.y,param_2.z,out.varPosAndMotion.w);
float3 l9_122=normalize(param_3);
out.varNormalAndMotion=float4(l9_122.x,l9_122.y,l9_122.z,out.varNormalAndMotion.w);
float3 l9_123=normalize(param_4);
out.varTangent=float4(l9_123.x,l9_123.y,l9_123.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_124=param_1.position;
float4 l9_125=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_126=0;
}
else
{
l9_126=gl_InstanceIndex%2;
}
int l9_127=l9_126;
l9_125=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_127]*l9_124;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_128=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_128=0;
}
else
{
l9_128=gl_InstanceIndex%2;
}
int l9_129=l9_128;
l9_125=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_129]*l9_124;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_130=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_130=0;
}
else
{
l9_130=gl_InstanceIndex%2;
}
int l9_131=l9_130;
l9_125=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_131]*l9_124;
}
else
{
l9_125=l9_124;
}
}
}
float4 l9_132=l9_125;
out.varViewSpaceDepth=-l9_132.z;
}
float4 l9_133=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_133=param_5;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_134=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_134=0;
}
else
{
l9_134=gl_InstanceIndex%2;
}
int l9_135=l9_134;
l9_133=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_135]*param_1.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_133=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_137]*float4(out.varPosAndMotion.xyz,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_138=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_133=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_139]*float4(out.varPosAndMotion.xyz,1.0);
}
}
}
}
out.varTex01=float4(param_1.texture0,param_1.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_140=param_1.position;
float4 l9_141=l9_140;
if (sc_RenderingSpace_tmp==1)
{
l9_141=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_140;
}
float4 l9_142=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_141;
float2 l9_143=((l9_142.xy/float2(l9_142.w))*0.5)+float2(0.5);
out.varShadowTex=l9_143;
}
float4 l9_144=l9_133;
if (sc_DepthBufferMode_tmp==1)
{
int l9_145=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_145=0;
}
else
{
l9_145=gl_InstanceIndex%2;
}
int l9_146=l9_145;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_146][2].w!=0.0)
{
float l9_147=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_144.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_144.w))*l9_147)-1.0)*l9_144.w;
}
}
float4 l9_148=l9_144;
l9_133=l9_148;
float4 l9_149=l9_133;
if ((int(sc_TAAEnabled_tmp)!=0))
{
float2 l9_150=l9_149.xy+((*sc_set0.UserUniforms).sc_TAAJitterOffset*l9_149.w);
l9_149=float4(l9_150.x,l9_150.y,l9_149.z,l9_149.w);
}
float4 l9_151=l9_149;
l9_133=l9_151;
float4 l9_152=l9_133;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_152.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_153=l9_152;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_154=dot(l9_153,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_155=l9_154;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_155;
}
}
float4 l9_156=float4(l9_152.x,-l9_152.y,(l9_152.z*0.5)+(l9_152.w*0.5),l9_152.w);
out.gl_Position=l9_156;
if ((int(sc_Voxelization_tmp)!=0))
{
sc_Vertex_t l9_158=param_1;
sc_Vertex_t l9_159=l9_158;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_160=l9_159;
float3 l9_161=in.blendShape0Pos;
float3 l9_162=in.blendShape0Normal;
float l9_163=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_164=l9_160;
float3 l9_165=l9_161;
float l9_166=l9_163;
float3 l9_167=l9_164.position.xyz+(l9_165*l9_166);
l9_164.position=float4(l9_167.x,l9_167.y,l9_167.z,l9_164.position.w);
l9_160=l9_164;
l9_160.normal+=(l9_162*l9_163);
l9_159=l9_160;
sc_Vertex_t l9_168=l9_159;
float3 l9_169=in.blendShape1Pos;
float3 l9_170=in.blendShape1Normal;
float l9_171=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_172=l9_168;
float3 l9_173=l9_169;
float l9_174=l9_171;
float3 l9_175=l9_172.position.xyz+(l9_173*l9_174);
l9_172.position=float4(l9_175.x,l9_175.y,l9_175.z,l9_172.position.w);
l9_168=l9_172;
l9_168.normal+=(l9_170*l9_171);
l9_159=l9_168;
sc_Vertex_t l9_176=l9_159;
float3 l9_177=in.blendShape2Pos;
float3 l9_178=in.blendShape2Normal;
float l9_179=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_180=l9_176;
float3 l9_181=l9_177;
float l9_182=l9_179;
float3 l9_183=l9_180.position.xyz+(l9_181*l9_182);
l9_180.position=float4(l9_183.x,l9_183.y,l9_183.z,l9_180.position.w);
l9_176=l9_180;
l9_176.normal+=(l9_178*l9_179);
l9_159=l9_176;
}
else
{
sc_Vertex_t l9_184=l9_159;
float3 l9_185=in.blendShape0Pos;
float l9_186=(*sc_set0.UserUniforms).weights0.x;
float3 l9_187=l9_184.position.xyz+(l9_185*l9_186);
l9_184.position=float4(l9_187.x,l9_187.y,l9_187.z,l9_184.position.w);
l9_159=l9_184;
sc_Vertex_t l9_188=l9_159;
float3 l9_189=in.blendShape1Pos;
float l9_190=(*sc_set0.UserUniforms).weights0.y;
float3 l9_191=l9_188.position.xyz+(l9_189*l9_190);
l9_188.position=float4(l9_191.x,l9_191.y,l9_191.z,l9_188.position.w);
l9_159=l9_188;
sc_Vertex_t l9_192=l9_159;
float3 l9_193=in.blendShape2Pos;
float l9_194=(*sc_set0.UserUniforms).weights0.z;
float3 l9_195=l9_192.position.xyz+(l9_193*l9_194);
l9_192.position=float4(l9_195.x,l9_195.y,l9_195.z,l9_192.position.w);
l9_159=l9_192;
sc_Vertex_t l9_196=l9_159;
float3 l9_197=in.blendShape3Pos;
float l9_198=(*sc_set0.UserUniforms).weights0.w;
float3 l9_199=l9_196.position.xyz+(l9_197*l9_198);
l9_196.position=float4(l9_199.x,l9_199.y,l9_199.z,l9_196.position.w);
l9_159=l9_196;
sc_Vertex_t l9_200=l9_159;
float3 l9_201=in.blendShape4Pos;
float l9_202=(*sc_set0.UserUniforms).weights1.x;
float3 l9_203=l9_200.position.xyz+(l9_201*l9_202);
l9_200.position=float4(l9_203.x,l9_203.y,l9_203.z,l9_200.position.w);
l9_159=l9_200;
sc_Vertex_t l9_204=l9_159;
float3 l9_205=in.blendShape5Pos;
float l9_206=(*sc_set0.UserUniforms).weights1.y;
float3 l9_207=l9_204.position.xyz+(l9_205*l9_206);
l9_204.position=float4(l9_207.x,l9_207.y,l9_207.z,l9_204.position.w);
l9_159=l9_204;
}
}
l9_158=l9_159;
sc_Vertex_t l9_208=l9_158;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_209=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_209=float4(1.0,fract(in.boneData.yzw));
l9_209.x-=dot(l9_209.yzw,float3(1.0));
}
float4 l9_210=l9_209;
float4 l9_211=l9_210;
int l9_212=int(in.boneData.x);
int l9_213=int(in.boneData.y);
int l9_214=int(in.boneData.z);
int l9_215=int(in.boneData.w);
int l9_216=l9_212;
float4 l9_217=l9_208.position;
float3 l9_218=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_219=l9_216;
float4 l9_220=(*sc_set0.sc_BonesUBO).sc_Bones[l9_219].boneMatrix[0];
float4 l9_221=(*sc_set0.sc_BonesUBO).sc_Bones[l9_219].boneMatrix[1];
float4 l9_222=(*sc_set0.sc_BonesUBO).sc_Bones[l9_219].boneMatrix[2];
float4 l9_223[3];
l9_223[0]=l9_220;
l9_223[1]=l9_221;
l9_223[2]=l9_222;
l9_218=float3(dot(l9_217,l9_223[0]),dot(l9_217,l9_223[1]),dot(l9_217,l9_223[2]));
}
else
{
l9_218=l9_217.xyz;
}
float3 l9_224=l9_218;
float3 l9_225=l9_224;
float l9_226=l9_211.x;
int l9_227=l9_213;
float4 l9_228=l9_208.position;
float3 l9_229=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_230=l9_227;
float4 l9_231=(*sc_set0.sc_BonesUBO).sc_Bones[l9_230].boneMatrix[0];
float4 l9_232=(*sc_set0.sc_BonesUBO).sc_Bones[l9_230].boneMatrix[1];
float4 l9_233=(*sc_set0.sc_BonesUBO).sc_Bones[l9_230].boneMatrix[2];
float4 l9_234[3];
l9_234[0]=l9_231;
l9_234[1]=l9_232;
l9_234[2]=l9_233;
l9_229=float3(dot(l9_228,l9_234[0]),dot(l9_228,l9_234[1]),dot(l9_228,l9_234[2]));
}
else
{
l9_229=l9_228.xyz;
}
float3 l9_235=l9_229;
float3 l9_236=l9_235;
float l9_237=l9_211.y;
int l9_238=l9_214;
float4 l9_239=l9_208.position;
float3 l9_240=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_241=l9_238;
float4 l9_242=(*sc_set0.sc_BonesUBO).sc_Bones[l9_241].boneMatrix[0];
float4 l9_243=(*sc_set0.sc_BonesUBO).sc_Bones[l9_241].boneMatrix[1];
float4 l9_244=(*sc_set0.sc_BonesUBO).sc_Bones[l9_241].boneMatrix[2];
float4 l9_245[3];
l9_245[0]=l9_242;
l9_245[1]=l9_243;
l9_245[2]=l9_244;
l9_240=float3(dot(l9_239,l9_245[0]),dot(l9_239,l9_245[1]),dot(l9_239,l9_245[2]));
}
else
{
l9_240=l9_239.xyz;
}
float3 l9_246=l9_240;
float3 l9_247=l9_246;
float l9_248=l9_211.z;
int l9_249=l9_215;
float4 l9_250=l9_208.position;
float3 l9_251=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_252=l9_249;
float4 l9_253=(*sc_set0.sc_BonesUBO).sc_Bones[l9_252].boneMatrix[0];
float4 l9_254=(*sc_set0.sc_BonesUBO).sc_Bones[l9_252].boneMatrix[1];
float4 l9_255=(*sc_set0.sc_BonesUBO).sc_Bones[l9_252].boneMatrix[2];
float4 l9_256[3];
l9_256[0]=l9_253;
l9_256[1]=l9_254;
l9_256[2]=l9_255;
l9_251=float3(dot(l9_250,l9_256[0]),dot(l9_250,l9_256[1]),dot(l9_250,l9_256[2]));
}
else
{
l9_251=l9_250.xyz;
}
float3 l9_257=l9_251;
float3 l9_258=(((l9_225*l9_226)+(l9_236*l9_237))+(l9_247*l9_248))+(l9_257*l9_211.w);
l9_208.position=float4(l9_258.x,l9_258.y,l9_258.z,l9_208.position.w);
int l9_259=l9_212;
float3x3 l9_260=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_259].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_259].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_259].normalMatrix[2].xyz));
float3x3 l9_261=l9_260;
float3x3 l9_262=l9_261;
int l9_263=l9_213;
float3x3 l9_264=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_263].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_263].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_263].normalMatrix[2].xyz));
float3x3 l9_265=l9_264;
float3x3 l9_266=l9_265;
int l9_267=l9_214;
float3x3 l9_268=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_267].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_267].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_267].normalMatrix[2].xyz));
float3x3 l9_269=l9_268;
float3x3 l9_270=l9_269;
int l9_271=l9_215;
float3x3 l9_272=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_271].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_271].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_271].normalMatrix[2].xyz));
float3x3 l9_273=l9_272;
float3x3 l9_274=l9_273;
l9_208.normal=((((l9_262*l9_208.normal)*l9_211.x)+((l9_266*l9_208.normal)*l9_211.y))+((l9_270*l9_208.normal)*l9_211.z))+((l9_274*l9_208.normal)*l9_211.w);
l9_208.tangent=((((l9_262*l9_208.tangent)*l9_211.x)+((l9_266*l9_208.tangent)*l9_211.y))+((l9_270*l9_208.tangent)*l9_211.z))+((l9_274*l9_208.tangent)*l9_211.w);
}
l9_158=l9_208;
float l9_275=(*sc_set0.UserUniforms).voxelization_params_0.y;
float l9_276=(*sc_set0.UserUniforms).voxelization_params_0.z;
float l9_277=(*sc_set0.UserUniforms).voxelization_params_0.w;
float l9_278=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_279=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_280=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_281=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_282=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_283=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float3 l9_284=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float l9_285=l9_275/l9_276;
int l9_286=gl_InstanceIndex;
int l9_287=l9_286;
l9_158.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_158.position;
float3 l9_288=l9_158.position.xyz;
float3 l9_289=float3(float(l9_287%int(l9_277))*l9_275,float(l9_287/int(l9_277))*l9_275,(float(l9_287)*l9_285)+l9_282);
float3 l9_290=l9_288+l9_289;
float4 l9_291=float4(l9_290-l9_284,1.0);
float l9_292=l9_278;
float l9_293=l9_279;
float l9_294=l9_280;
float l9_295=l9_281;
float l9_296=l9_282;
float l9_297=l9_283;
float4x4 l9_298=float4x4(float4(2.0/(l9_293-l9_292),0.0,0.0,(-(l9_293+l9_292))/(l9_293-l9_292)),float4(0.0,2.0/(l9_295-l9_294),0.0,(-(l9_295+l9_294))/(l9_295-l9_294)),float4(0.0,0.0,(-2.0)/(l9_297-l9_296),(-(l9_297+l9_296))/(l9_297-l9_296)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_299=l9_298;
float4 l9_300=l9_299*l9_291;
l9_300.w=1.0;
out.varScreenPos=l9_300;
float4 l9_301=l9_300*1.0;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_301.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_302=l9_301;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_303=dot(l9_302,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_304=l9_303;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_304;
}
}
float4 l9_305=float4(l9_301.x,-l9_301.y,(l9_301.z*0.5)+(l9_301.w*0.5),l9_301.w);
out.gl_Position=l9_305;
param_1=l9_158;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
sc_Vertex_t l9_306=param_1;
sc_Vertex_t l9_307=l9_306;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_308=l9_307;
float3 l9_309=in.blendShape0Pos;
float3 l9_310=in.blendShape0Normal;
float l9_311=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_312=l9_308;
float3 l9_313=l9_309;
float l9_314=l9_311;
float3 l9_315=l9_312.position.xyz+(l9_313*l9_314);
l9_312.position=float4(l9_315.x,l9_315.y,l9_315.z,l9_312.position.w);
l9_308=l9_312;
l9_308.normal+=(l9_310*l9_311);
l9_307=l9_308;
sc_Vertex_t l9_316=l9_307;
float3 l9_317=in.blendShape1Pos;
float3 l9_318=in.blendShape1Normal;
float l9_319=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_320=l9_316;
float3 l9_321=l9_317;
float l9_322=l9_319;
float3 l9_323=l9_320.position.xyz+(l9_321*l9_322);
l9_320.position=float4(l9_323.x,l9_323.y,l9_323.z,l9_320.position.w);
l9_316=l9_320;
l9_316.normal+=(l9_318*l9_319);
l9_307=l9_316;
sc_Vertex_t l9_324=l9_307;
float3 l9_325=in.blendShape2Pos;
float3 l9_326=in.blendShape2Normal;
float l9_327=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_328=l9_324;
float3 l9_329=l9_325;
float l9_330=l9_327;
float3 l9_331=l9_328.position.xyz+(l9_329*l9_330);
l9_328.position=float4(l9_331.x,l9_331.y,l9_331.z,l9_328.position.w);
l9_324=l9_328;
l9_324.normal+=(l9_326*l9_327);
l9_307=l9_324;
}
else
{
sc_Vertex_t l9_332=l9_307;
float3 l9_333=in.blendShape0Pos;
float l9_334=(*sc_set0.UserUniforms).weights0.x;
float3 l9_335=l9_332.position.xyz+(l9_333*l9_334);
l9_332.position=float4(l9_335.x,l9_335.y,l9_335.z,l9_332.position.w);
l9_307=l9_332;
sc_Vertex_t l9_336=l9_307;
float3 l9_337=in.blendShape1Pos;
float l9_338=(*sc_set0.UserUniforms).weights0.y;
float3 l9_339=l9_336.position.xyz+(l9_337*l9_338);
l9_336.position=float4(l9_339.x,l9_339.y,l9_339.z,l9_336.position.w);
l9_307=l9_336;
sc_Vertex_t l9_340=l9_307;
float3 l9_341=in.blendShape2Pos;
float l9_342=(*sc_set0.UserUniforms).weights0.z;
float3 l9_343=l9_340.position.xyz+(l9_341*l9_342);
l9_340.position=float4(l9_343.x,l9_343.y,l9_343.z,l9_340.position.w);
l9_307=l9_340;
sc_Vertex_t l9_344=l9_307;
float3 l9_345=in.blendShape3Pos;
float l9_346=(*sc_set0.UserUniforms).weights0.w;
float3 l9_347=l9_344.position.xyz+(l9_345*l9_346);
l9_344.position=float4(l9_347.x,l9_347.y,l9_347.z,l9_344.position.w);
l9_307=l9_344;
sc_Vertex_t l9_348=l9_307;
float3 l9_349=in.blendShape4Pos;
float l9_350=(*sc_set0.UserUniforms).weights1.x;
float3 l9_351=l9_348.position.xyz+(l9_349*l9_350);
l9_348.position=float4(l9_351.x,l9_351.y,l9_351.z,l9_348.position.w);
l9_307=l9_348;
sc_Vertex_t l9_352=l9_307;
float3 l9_353=in.blendShape5Pos;
float l9_354=(*sc_set0.UserUniforms).weights1.y;
float3 l9_355=l9_352.position.xyz+(l9_353*l9_354);
l9_352.position=float4(l9_355.x,l9_355.y,l9_355.z,l9_352.position.w);
l9_307=l9_352;
}
}
l9_306=l9_307;
sc_Vertex_t l9_356=l9_306;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_357=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_357=float4(1.0,fract(in.boneData.yzw));
l9_357.x-=dot(l9_357.yzw,float3(1.0));
}
float4 l9_358=l9_357;
float4 l9_359=l9_358;
int l9_360=int(in.boneData.x);
int l9_361=int(in.boneData.y);
int l9_362=int(in.boneData.z);
int l9_363=int(in.boneData.w);
int l9_364=l9_360;
float4 l9_365=l9_356.position;
float3 l9_366=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_367=l9_364;
float4 l9_368=(*sc_set0.sc_BonesUBO).sc_Bones[l9_367].boneMatrix[0];
float4 l9_369=(*sc_set0.sc_BonesUBO).sc_Bones[l9_367].boneMatrix[1];
float4 l9_370=(*sc_set0.sc_BonesUBO).sc_Bones[l9_367].boneMatrix[2];
float4 l9_371[3];
l9_371[0]=l9_368;
l9_371[1]=l9_369;
l9_371[2]=l9_370;
l9_366=float3(dot(l9_365,l9_371[0]),dot(l9_365,l9_371[1]),dot(l9_365,l9_371[2]));
}
else
{
l9_366=l9_365.xyz;
}
float3 l9_372=l9_366;
float3 l9_373=l9_372;
float l9_374=l9_359.x;
int l9_375=l9_361;
float4 l9_376=l9_356.position;
float3 l9_377=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_378=l9_375;
float4 l9_379=(*sc_set0.sc_BonesUBO).sc_Bones[l9_378].boneMatrix[0];
float4 l9_380=(*sc_set0.sc_BonesUBO).sc_Bones[l9_378].boneMatrix[1];
float4 l9_381=(*sc_set0.sc_BonesUBO).sc_Bones[l9_378].boneMatrix[2];
float4 l9_382[3];
l9_382[0]=l9_379;
l9_382[1]=l9_380;
l9_382[2]=l9_381;
l9_377=float3(dot(l9_376,l9_382[0]),dot(l9_376,l9_382[1]),dot(l9_376,l9_382[2]));
}
else
{
l9_377=l9_376.xyz;
}
float3 l9_383=l9_377;
float3 l9_384=l9_383;
float l9_385=l9_359.y;
int l9_386=l9_362;
float4 l9_387=l9_356.position;
float3 l9_388=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_389=l9_386;
float4 l9_390=(*sc_set0.sc_BonesUBO).sc_Bones[l9_389].boneMatrix[0];
float4 l9_391=(*sc_set0.sc_BonesUBO).sc_Bones[l9_389].boneMatrix[1];
float4 l9_392=(*sc_set0.sc_BonesUBO).sc_Bones[l9_389].boneMatrix[2];
float4 l9_393[3];
l9_393[0]=l9_390;
l9_393[1]=l9_391;
l9_393[2]=l9_392;
l9_388=float3(dot(l9_387,l9_393[0]),dot(l9_387,l9_393[1]),dot(l9_387,l9_393[2]));
}
else
{
l9_388=l9_387.xyz;
}
float3 l9_394=l9_388;
float3 l9_395=l9_394;
float l9_396=l9_359.z;
int l9_397=l9_363;
float4 l9_398=l9_356.position;
float3 l9_399=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_400=l9_397;
float4 l9_401=(*sc_set0.sc_BonesUBO).sc_Bones[l9_400].boneMatrix[0];
float4 l9_402=(*sc_set0.sc_BonesUBO).sc_Bones[l9_400].boneMatrix[1];
float4 l9_403=(*sc_set0.sc_BonesUBO).sc_Bones[l9_400].boneMatrix[2];
float4 l9_404[3];
l9_404[0]=l9_401;
l9_404[1]=l9_402;
l9_404[2]=l9_403;
l9_399=float3(dot(l9_398,l9_404[0]),dot(l9_398,l9_404[1]),dot(l9_398,l9_404[2]));
}
else
{
l9_399=l9_398.xyz;
}
float3 l9_405=l9_399;
float3 l9_406=(((l9_373*l9_374)+(l9_384*l9_385))+(l9_395*l9_396))+(l9_405*l9_359.w);
l9_356.position=float4(l9_406.x,l9_406.y,l9_406.z,l9_356.position.w);
int l9_407=l9_360;
float3x3 l9_408=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_407].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_407].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_407].normalMatrix[2].xyz));
float3x3 l9_409=l9_408;
float3x3 l9_410=l9_409;
int l9_411=l9_361;
float3x3 l9_412=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_411].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_411].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_411].normalMatrix[2].xyz));
float3x3 l9_413=l9_412;
float3x3 l9_414=l9_413;
int l9_415=l9_362;
float3x3 l9_416=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_415].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_415].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_415].normalMatrix[2].xyz));
float3x3 l9_417=l9_416;
float3x3 l9_418=l9_417;
int l9_419=l9_363;
float3x3 l9_420=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_419].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_419].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_419].normalMatrix[2].xyz));
float3x3 l9_421=l9_420;
float3x3 l9_422=l9_421;
l9_356.normal=((((l9_410*l9_356.normal)*l9_359.x)+((l9_414*l9_356.normal)*l9_359.y))+((l9_418*l9_356.normal)*l9_359.z))+((l9_422*l9_356.normal)*l9_359.w);
l9_356.tangent=((((l9_410*l9_356.tangent)*l9_359.x)+((l9_414*l9_356.tangent)*l9_359.y))+((l9_418*l9_356.tangent)*l9_359.z))+((l9_422*l9_356.tangent)*l9_359.w);
}
l9_306=l9_356;
float3 l9_423=(*sc_set0.UserUniforms).voxelization_params_camera_pos;
float2 l9_424=((l9_306.position.xy/float2(l9_306.position.w))*0.5)+float2(0.5);
out.varTex01=float4(l9_424.x,l9_424.y,out.varTex01.z,out.varTex01.w);
l9_306.position=(*sc_set0.UserUniforms).sc_ModelMatrixVoxelization*l9_306.position;
float3 l9_425=l9_306.position.xyz-l9_423;
l9_306.position=float4(l9_425.x,l9_425.y,l9_425.z,l9_306.position.w);
out.varPosAndMotion=float4(l9_306.position.xyz.x,l9_306.position.xyz.y,l9_306.position.xyz.z,out.varPosAndMotion.w);
float3 l9_426=normalize(l9_306.normal);
out.varNormalAndMotion=float4(l9_426.x,l9_426.y,l9_426.z,out.varNormalAndMotion.w);
float l9_427=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.x;
float l9_428=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.y;
float l9_429=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.z;
float l9_430=(*sc_set0.UserUniforms).voxelization_params_frustum_lrbt.w;
float l9_431=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.x;
float l9_432=(*sc_set0.UserUniforms).voxelization_params_frustum_nf.y;
float l9_433=l9_427;
float l9_434=l9_428;
float l9_435=l9_429;
float l9_436=l9_430;
float l9_437=l9_431;
float l9_438=l9_432;
float4x4 l9_439=float4x4(float4(2.0/(l9_434-l9_433),0.0,0.0,(-(l9_434+l9_433))/(l9_434-l9_433)),float4(0.0,2.0/(l9_436-l9_435),0.0,(-(l9_436+l9_435))/(l9_436-l9_435)),float4(0.0,0.0,(-2.0)/(l9_438-l9_437),(-(l9_438+l9_437))/(l9_438-l9_437)),float4(0.0,0.0,0.0,1.0));
float4x4 l9_440=l9_439;
float4 l9_441=float4(0.0);
float3 l9_442=(l9_440*l9_306.position).xyz;
l9_441=float4(l9_442.x,l9_442.y,l9_442.z,l9_441.w);
l9_441.w=1.0;
out.varScreenPos=l9_441;
float4 l9_443=l9_441*1.0;
float4 l9_444=l9_443;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_444.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_445=l9_444;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_446=dot(l9_445,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_447=l9_446;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_447;
}
}
float4 l9_448=float4(l9_444.x,-l9_444.y,(l9_444.z*0.5)+(l9_444.w*0.5),l9_444.w);
out.gl_Position=l9_448;
param_1=l9_306;
}
}
v=param_1;
float3 param_6=out.varPosAndMotion.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float4 l9_449=((*sc_set0.UserUniforms).sc_PrevFrameModelMatrix*(*sc_set0.UserUniforms).sc_ModelMatrixInverse)*float4(param_6,1.0);
float3 l9_450=param_6;
float3 l9_451=l9_449.xyz;
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
int l9_452=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_452=0;
}
else
{
l9_452=gl_InstanceIndex%2;
}
int l9_453=l9_452;
float4 l9_454=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_453]*float4(l9_450,1.0);
float2 l9_455=l9_454.xy/float2(l9_454.w);
l9_454=float4(l9_455.x,l9_455.y,l9_454.z,l9_454.w);
int l9_456=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_456=0;
}
else
{
l9_456=gl_InstanceIndex%2;
}
int l9_457=l9_456;
float4 l9_458=(*sc_set0.UserUniforms).sc_PrevFrameViewProjectionMatrixArray[l9_457]*float4(l9_451,1.0);
float2 l9_459=l9_458.xy/float2(l9_458.w);
l9_458=float4(l9_459.x,l9_459.y,l9_458.z,l9_458.w);
float2 l9_460=(l9_454.xy-l9_458.xy)*0.5;
out.varPosAndMotion.w=l9_460.x;
out.varNormalAndMotion.w=l9_460.y;
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
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 gScreenCoord;
float Loop_Index_ID0;
float Loop_Ratio_ID0;
float Loop_Count_ID0;
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
float4 screenTexSize;
float4 screenTexDims;
float4 screenTexView;
float3x3 screenTexTransform;
float4 screenTexUvMinMax;
float4 screenTexBorderColor;
float blurIntensity;
float4 depthImageSize;
float4 depthImageDims;
float4 depthImageView;
float3x3 depthImageTransform;
float4 depthImageUvMinMax;
float4 depthImageBorderColor;
float fallbacktexMult;
float focusDistance;
float aperture;
float2 Port_Import_N042;
float Port_Value_N041;
float Port_Input2_N032;
float Port_Input2_N033;
float Port_RangeMinB_N035;
float Port_RangeMaxB_N035;
float Port_Input1_N043;
float Port_Input1_N052;
float Port_Input2_N052;
float Port_Import_N044;
float Port_Input1_N045;
float2 Port_Import_N009;
float2 Port_Item0_N016;
float2 Port_Item1_N016;
float2 Port_Item2_N016;
float2 Port_Item3_N016;
float2 Port_Item4_N016;
float2 Port_Item5_N016;
float2 Port_Item6_N016;
float2 Port_Item7_N016;
float Port_Input2_N105;
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
texture2d<float> depthImage [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
texture2d<float> screenTex [[id(17)]];
sampler depthImageSmpSC [[id(18)]];
sampler intensityTextureSmpSC [[id(19)]];
sampler sc_ScreenTextureSmpSC [[id(24)]];
sampler screenTexSmpSC [[id(27)]];
constant userUniformsObj* UserUniforms [[id(28)]];
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
float4 l9_0=gl_FragCoord;
float2 l9_1=l9_0.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_2=l9_1;
float2 l9_3=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_4=1;
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
int l9_7=l9_6;
float3 l9_8=float3(l9_2,0.0);
int l9_9=l9_4;
int l9_10=l9_7;
if (l9_9==1)
{
l9_8.y=((2.0*l9_8.y)+float(l9_10))-1.0;
}
float2 l9_11=l9_8.xy;
l9_3=l9_11;
}
else
{
l9_3=l9_2;
}
float2 l9_12=l9_3;
float2 l9_13=l9_12;
Globals.gScreenCoord=l9_13;
Globals.Loop_Index_ID0=0.0;
Globals.Loop_Ratio_ID0=0.0;
Globals.Loop_Count_ID0=0.0;
float2 ScreenCoord_N23=float2(0.0);
ScreenCoord_N23=Globals.gScreenCoord;
float2 Value_N42=float2(0.0);
Value_N42=ScreenCoord_N23;
float Output_N53=0.0;
float param=(*sc_set0.UserUniforms).blurIntensity;
Output_N53=param;
float4 Color_N2=float4(0.0);
int l9_14;
if ((int(depthImageHasSwappedViews_tmp)!=0))
{
int l9_15=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_15=0;
}
else
{
l9_15=in.varStereoViewID;
}
int l9_16=l9_15;
l9_14=1-l9_16;
}
else
{
int l9_17=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_17=0;
}
else
{
l9_17=in.varStereoViewID;
}
int l9_18=l9_17;
l9_14=l9_18;
}
int l9_19=l9_14;
int param_1=depthImageLayout_tmp;
int param_2=l9_19;
float2 param_3=ScreenCoord_N23;
bool param_4=(int(SC_USE_UV_TRANSFORM_depthImage_tmp)!=0);
float3x3 param_5=(*sc_set0.UserUniforms).depthImageTransform;
int2 param_6=int2(SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp,SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp);
bool param_7=(int(SC_USE_UV_MIN_MAX_depthImage_tmp)!=0);
float4 param_8=(*sc_set0.UserUniforms).depthImageUvMinMax;
bool param_9=(int(SC_USE_CLAMP_TO_BORDER_depthImage_tmp)!=0);
float4 param_10=(*sc_set0.UserUniforms).depthImageBorderColor;
float param_11=0.0;
bool l9_20=param_9&&(!param_7);
float l9_21=1.0;
float l9_22=param_3.x;
int l9_23=param_6.x;
if (l9_23==1)
{
l9_22=fract(l9_22);
}
else
{
if (l9_23==2)
{
float l9_24=fract(l9_22);
float l9_25=l9_22-l9_24;
float l9_26=step(0.25,fract(l9_25*0.5));
l9_22=mix(l9_24,1.0-l9_24,fast::clamp(l9_26,0.0,1.0));
}
}
param_3.x=l9_22;
float l9_27=param_3.y;
int l9_28=param_6.y;
if (l9_28==1)
{
l9_27=fract(l9_27);
}
else
{
if (l9_28==2)
{
float l9_29=fract(l9_27);
float l9_30=l9_27-l9_29;
float l9_31=step(0.25,fract(l9_30*0.5));
l9_27=mix(l9_29,1.0-l9_29,fast::clamp(l9_31,0.0,1.0));
}
}
param_3.y=l9_27;
if (param_7)
{
bool l9_32=param_9;
bool l9_33;
if (l9_32)
{
l9_33=param_6.x==3;
}
else
{
l9_33=l9_32;
}
float l9_34=param_3.x;
float l9_35=param_8.x;
float l9_36=param_8.z;
bool l9_37=l9_33;
float l9_38=l9_21;
float l9_39=fast::clamp(l9_34,l9_35,l9_36);
float l9_40=step(abs(l9_34-l9_39),9.9999997e-06);
l9_38*=(l9_40+((1.0-float(l9_37))*(1.0-l9_40)));
l9_34=l9_39;
param_3.x=l9_34;
l9_21=l9_38;
bool l9_41=param_9;
bool l9_42;
if (l9_41)
{
l9_42=param_6.y==3;
}
else
{
l9_42=l9_41;
}
float l9_43=param_3.y;
float l9_44=param_8.y;
float l9_45=param_8.w;
bool l9_46=l9_42;
float l9_47=l9_21;
float l9_48=fast::clamp(l9_43,l9_44,l9_45);
float l9_49=step(abs(l9_43-l9_48),9.9999997e-06);
l9_47*=(l9_49+((1.0-float(l9_46))*(1.0-l9_49)));
l9_43=l9_48;
param_3.y=l9_43;
l9_21=l9_47;
}
float2 l9_50=param_3;
bool l9_51=param_4;
float3x3 l9_52=param_5;
if (l9_51)
{
l9_50=float2((l9_52*float3(l9_50,1.0)).xy);
}
float2 l9_53=l9_50;
param_3=l9_53;
float l9_54=param_3.x;
int l9_55=param_6.x;
bool l9_56=l9_20;
float l9_57=l9_21;
if ((l9_55==0)||(l9_55==3))
{
float l9_58=l9_54;
float l9_59=0.0;
float l9_60=1.0;
bool l9_61=l9_56;
float l9_62=l9_57;
float l9_63=fast::clamp(l9_58,l9_59,l9_60);
float l9_64=step(abs(l9_58-l9_63),9.9999997e-06);
l9_62*=(l9_64+((1.0-float(l9_61))*(1.0-l9_64)));
l9_58=l9_63;
l9_54=l9_58;
l9_57=l9_62;
}
param_3.x=l9_54;
l9_21=l9_57;
float l9_65=param_3.y;
int l9_66=param_6.y;
bool l9_67=l9_20;
float l9_68=l9_21;
if ((l9_66==0)||(l9_66==3))
{
float l9_69=l9_65;
float l9_70=0.0;
float l9_71=1.0;
bool l9_72=l9_67;
float l9_73=l9_68;
float l9_74=fast::clamp(l9_69,l9_70,l9_71);
float l9_75=step(abs(l9_69-l9_74),9.9999997e-06);
l9_73*=(l9_75+((1.0-float(l9_72))*(1.0-l9_75)));
l9_69=l9_74;
l9_65=l9_69;
l9_68=l9_73;
}
param_3.y=l9_65;
l9_21=l9_68;
float2 l9_76=param_3;
int l9_77=param_1;
int l9_78=param_2;
float l9_79=param_11;
float2 l9_80=l9_76;
int l9_81=l9_77;
int l9_82=l9_78;
float3 l9_83=float3(0.0);
if (l9_81==0)
{
l9_83=float3(l9_80,0.0);
}
else
{
if (l9_81==1)
{
l9_83=float3(l9_80.x,(l9_80.y*0.5)+(0.5-(float(l9_82)*0.5)),0.0);
}
else
{
l9_83=float3(l9_80,float(l9_82));
}
}
float3 l9_84=l9_83;
float3 l9_85=l9_84;
float4 l9_86=sc_set0.depthImage.sample(sc_set0.depthImageSmpSC,l9_85.xy,bias(l9_79));
float4 l9_87=l9_86;
if (param_9)
{
l9_87=mix(param_10,l9_87,float4(l9_21));
}
float4 l9_88=l9_87;
Color_N2=l9_88;
float Output_N6=0.0;
Output_N6=Color_N2.x;
float Output_N5=0.0;
float param_12=(*sc_set0.UserUniforms).fallbacktexMult;
Output_N5=param_12;
float Output_N3=0.0;
Output_N3=Output_N6*Output_N5;
float Output_N31=0.0;
float param_13=(*sc_set0.UserUniforms).focusDistance;
Output_N31=param_13;
float Output_N30=0.0;
float param_14=(*sc_set0.UserUniforms).aperture;
Output_N30=param_14;
float Output_N41=0.0;
float param_15=(*sc_set0.UserUniforms).Port_Value_N041;
float param_16=param_15+0.001;
param_16-=0.001;
Output_N41=param_16;
float Output_N32=0.0;
Output_N32=(Output_N30*Output_N41)*(*sc_set0.UserUniforms).Port_Input2_N032;
float Output_N34=0.0;
Output_N34=Output_N31+Output_N32;
float Output_N33=0.0;
Output_N33=(Output_N30*Output_N41)*(*sc_set0.UserUniforms).Port_Input2_N033;
float Output_N38=0.0;
Output_N38=Output_N31+Output_N33;
float ValueOut_N35=0.0;
ValueOut_N35=(((Output_N3-Output_N34)/((Output_N38-Output_N34)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N035-(*sc_set0.UserUniforms).Port_RangeMinB_N035))+(*sc_set0.UserUniforms).Port_RangeMinB_N035;
float Output_N36=0.0;
Output_N36=abs(ValueOut_N35);
float Output_N43=0.0;
Output_N43=Output_N36+(*sc_set0.UserUniforms).Port_Input1_N043;
float Output_N37=0.0;
Output_N37=Output_N53*Output_N43;
float Output_N52=0.0;
Output_N52=fast::clamp(Output_N37,(*sc_set0.UserUniforms).Port_Input1_N052,(*sc_set0.UserUniforms).Port_Input2_N052);
float Value_N44=0.0;
Value_N44=Output_N52;
float Output_N45=0.0;
Output_N45=Value_N44+(*sc_set0.UserUniforms).Port_Input1_N045;
float4 Color_N46=float4(0.0);
int l9_89;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_90=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_90=0;
}
else
{
l9_90=in.varStereoViewID;
}
int l9_91=l9_90;
l9_89=1-l9_91;
}
else
{
int l9_92=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_92=0;
}
else
{
l9_92=in.varStereoViewID;
}
int l9_93=l9_92;
l9_89=l9_93;
}
int l9_94=l9_89;
int param_17=screenTexLayout_tmp;
int param_18=l9_94;
float2 param_19=Value_N42;
bool param_20=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 param_21=(*sc_set0.UserUniforms).screenTexTransform;
int2 param_22=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool param_23=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 param_24=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool param_25=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 param_26=(*sc_set0.UserUniforms).screenTexBorderColor;
float param_27=Output_N45;
bool l9_95=param_25&&(!param_23);
float l9_96=1.0;
float l9_97=param_19.x;
int l9_98=param_22.x;
if (l9_98==1)
{
l9_97=fract(l9_97);
}
else
{
if (l9_98==2)
{
float l9_99=fract(l9_97);
float l9_100=l9_97-l9_99;
float l9_101=step(0.25,fract(l9_100*0.5));
l9_97=mix(l9_99,1.0-l9_99,fast::clamp(l9_101,0.0,1.0));
}
}
param_19.x=l9_97;
float l9_102=param_19.y;
int l9_103=param_22.y;
if (l9_103==1)
{
l9_102=fract(l9_102);
}
else
{
if (l9_103==2)
{
float l9_104=fract(l9_102);
float l9_105=l9_102-l9_104;
float l9_106=step(0.25,fract(l9_105*0.5));
l9_102=mix(l9_104,1.0-l9_104,fast::clamp(l9_106,0.0,1.0));
}
}
param_19.y=l9_102;
if (param_23)
{
bool l9_107=param_25;
bool l9_108;
if (l9_107)
{
l9_108=param_22.x==3;
}
else
{
l9_108=l9_107;
}
float l9_109=param_19.x;
float l9_110=param_24.x;
float l9_111=param_24.z;
bool l9_112=l9_108;
float l9_113=l9_96;
float l9_114=fast::clamp(l9_109,l9_110,l9_111);
float l9_115=step(abs(l9_109-l9_114),9.9999997e-06);
l9_113*=(l9_115+((1.0-float(l9_112))*(1.0-l9_115)));
l9_109=l9_114;
param_19.x=l9_109;
l9_96=l9_113;
bool l9_116=param_25;
bool l9_117;
if (l9_116)
{
l9_117=param_22.y==3;
}
else
{
l9_117=l9_116;
}
float l9_118=param_19.y;
float l9_119=param_24.y;
float l9_120=param_24.w;
bool l9_121=l9_117;
float l9_122=l9_96;
float l9_123=fast::clamp(l9_118,l9_119,l9_120);
float l9_124=step(abs(l9_118-l9_123),9.9999997e-06);
l9_122*=(l9_124+((1.0-float(l9_121))*(1.0-l9_124)));
l9_118=l9_123;
param_19.y=l9_118;
l9_96=l9_122;
}
float2 l9_125=param_19;
bool l9_126=param_20;
float3x3 l9_127=param_21;
if (l9_126)
{
l9_125=float2((l9_127*float3(l9_125,1.0)).xy);
}
float2 l9_128=l9_125;
param_19=l9_128;
float l9_129=param_19.x;
int l9_130=param_22.x;
bool l9_131=l9_95;
float l9_132=l9_96;
if ((l9_130==0)||(l9_130==3))
{
float l9_133=l9_129;
float l9_134=0.0;
float l9_135=1.0;
bool l9_136=l9_131;
float l9_137=l9_132;
float l9_138=fast::clamp(l9_133,l9_134,l9_135);
float l9_139=step(abs(l9_133-l9_138),9.9999997e-06);
l9_137*=(l9_139+((1.0-float(l9_136))*(1.0-l9_139)));
l9_133=l9_138;
l9_129=l9_133;
l9_132=l9_137;
}
param_19.x=l9_129;
l9_96=l9_132;
float l9_140=param_19.y;
int l9_141=param_22.y;
bool l9_142=l9_95;
float l9_143=l9_96;
if ((l9_141==0)||(l9_141==3))
{
float l9_144=l9_140;
float l9_145=0.0;
float l9_146=1.0;
bool l9_147=l9_142;
float l9_148=l9_143;
float l9_149=fast::clamp(l9_144,l9_145,l9_146);
float l9_150=step(abs(l9_144-l9_149),9.9999997e-06);
l9_148*=(l9_150+((1.0-float(l9_147))*(1.0-l9_150)));
l9_144=l9_149;
l9_140=l9_144;
l9_143=l9_148;
}
param_19.y=l9_140;
l9_96=l9_143;
float2 l9_151=param_19;
int l9_152=param_17;
int l9_153=param_18;
float l9_154=param_27;
float2 l9_155=l9_151;
int l9_156=l9_152;
int l9_157=l9_153;
float3 l9_158=float3(0.0);
if (l9_156==0)
{
l9_158=float3(l9_155,0.0);
}
else
{
if (l9_156==1)
{
l9_158=float3(l9_155.x,(l9_155.y*0.5)+(0.5-(float(l9_157)*0.5)),0.0);
}
else
{
l9_158=float3(l9_155,float(l9_157));
}
}
float3 l9_159=l9_158;
float3 l9_160=l9_159;
float4 l9_161=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_160.xy,level(l9_154));
float4 l9_162=l9_161;
if (param_25)
{
l9_162=mix(param_26,l9_162,float4(l9_96));
}
float4 l9_163=l9_162;
Color_N46=l9_163;
float4 Output_N104=float4(0.0);
ssGlobals param_29=Globals;
float4 param_28=float4(0.0);
param_29.Loop_Count_ID0=8.0;
float4 l9_164=param_28;
ssGlobals l9_165=param_29;
float4 l9_166=float4(0.0);
l9_165.Loop_Index_ID0=0.0;
l9_165.Loop_Ratio_ID0=0.0;
float2 l9_167=float2(0.0);
float2 l9_168=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_167=l9_168;
float2 l9_169=float2(0.0);
l9_169=l9_165.gScreenCoord;
float2 l9_170=float2(0.0);
l9_170=l9_169;
float2 l9_171=float2(0.0);
l9_171=l9_167;
float l9_172=0.0;
float l9_173=(*sc_set0.UserUniforms).blurIntensity;
l9_172=l9_173;
float4 l9_174=float4(0.0);
int l9_175;
if ((int(depthImageHasSwappedViews_tmp)!=0))
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
int l9_181=depthImageLayout_tmp;
int l9_182=l9_180;
float2 l9_183=l9_169;
bool l9_184=(int(SC_USE_UV_TRANSFORM_depthImage_tmp)!=0);
float3x3 l9_185=(*sc_set0.UserUniforms).depthImageTransform;
int2 l9_186=int2(SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp,SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp);
bool l9_187=(int(SC_USE_UV_MIN_MAX_depthImage_tmp)!=0);
float4 l9_188=(*sc_set0.UserUniforms).depthImageUvMinMax;
bool l9_189=(int(SC_USE_CLAMP_TO_BORDER_depthImage_tmp)!=0);
float4 l9_190=(*sc_set0.UserUniforms).depthImageBorderColor;
float l9_191=0.0;
bool l9_192=l9_189&&(!l9_187);
float l9_193=1.0;
float l9_194=l9_183.x;
int l9_195=l9_186.x;
if (l9_195==1)
{
l9_194=fract(l9_194);
}
else
{
if (l9_195==2)
{
float l9_196=fract(l9_194);
float l9_197=l9_194-l9_196;
float l9_198=step(0.25,fract(l9_197*0.5));
l9_194=mix(l9_196,1.0-l9_196,fast::clamp(l9_198,0.0,1.0));
}
}
l9_183.x=l9_194;
float l9_199=l9_183.y;
int l9_200=l9_186.y;
if (l9_200==1)
{
l9_199=fract(l9_199);
}
else
{
if (l9_200==2)
{
float l9_201=fract(l9_199);
float l9_202=l9_199-l9_201;
float l9_203=step(0.25,fract(l9_202*0.5));
l9_199=mix(l9_201,1.0-l9_201,fast::clamp(l9_203,0.0,1.0));
}
}
l9_183.y=l9_199;
if (l9_187)
{
bool l9_204=l9_189;
bool l9_205;
if (l9_204)
{
l9_205=l9_186.x==3;
}
else
{
l9_205=l9_204;
}
float l9_206=l9_183.x;
float l9_207=l9_188.x;
float l9_208=l9_188.z;
bool l9_209=l9_205;
float l9_210=l9_193;
float l9_211=fast::clamp(l9_206,l9_207,l9_208);
float l9_212=step(abs(l9_206-l9_211),9.9999997e-06);
l9_210*=(l9_212+((1.0-float(l9_209))*(1.0-l9_212)));
l9_206=l9_211;
l9_183.x=l9_206;
l9_193=l9_210;
bool l9_213=l9_189;
bool l9_214;
if (l9_213)
{
l9_214=l9_186.y==3;
}
else
{
l9_214=l9_213;
}
float l9_215=l9_183.y;
float l9_216=l9_188.y;
float l9_217=l9_188.w;
bool l9_218=l9_214;
float l9_219=l9_193;
float l9_220=fast::clamp(l9_215,l9_216,l9_217);
float l9_221=step(abs(l9_215-l9_220),9.9999997e-06);
l9_219*=(l9_221+((1.0-float(l9_218))*(1.0-l9_221)));
l9_215=l9_220;
l9_183.y=l9_215;
l9_193=l9_219;
}
float2 l9_222=l9_183;
bool l9_223=l9_184;
float3x3 l9_224=l9_185;
if (l9_223)
{
l9_222=float2((l9_224*float3(l9_222,1.0)).xy);
}
float2 l9_225=l9_222;
l9_183=l9_225;
float l9_226=l9_183.x;
int l9_227=l9_186.x;
bool l9_228=l9_192;
float l9_229=l9_193;
if ((l9_227==0)||(l9_227==3))
{
float l9_230=l9_226;
float l9_231=0.0;
float l9_232=1.0;
bool l9_233=l9_228;
float l9_234=l9_229;
float l9_235=fast::clamp(l9_230,l9_231,l9_232);
float l9_236=step(abs(l9_230-l9_235),9.9999997e-06);
l9_234*=(l9_236+((1.0-float(l9_233))*(1.0-l9_236)));
l9_230=l9_235;
l9_226=l9_230;
l9_229=l9_234;
}
l9_183.x=l9_226;
l9_193=l9_229;
float l9_237=l9_183.y;
int l9_238=l9_186.y;
bool l9_239=l9_192;
float l9_240=l9_193;
if ((l9_238==0)||(l9_238==3))
{
float l9_241=l9_237;
float l9_242=0.0;
float l9_243=1.0;
bool l9_244=l9_239;
float l9_245=l9_240;
float l9_246=fast::clamp(l9_241,l9_242,l9_243);
float l9_247=step(abs(l9_241-l9_246),9.9999997e-06);
l9_245*=(l9_247+((1.0-float(l9_244))*(1.0-l9_247)));
l9_241=l9_246;
l9_237=l9_241;
l9_240=l9_245;
}
l9_183.y=l9_237;
l9_193=l9_240;
float2 l9_248=l9_183;
int l9_249=l9_181;
int l9_250=l9_182;
float l9_251=l9_191;
float2 l9_252=l9_248;
int l9_253=l9_249;
int l9_254=l9_250;
float3 l9_255=float3(0.0);
if (l9_253==0)
{
l9_255=float3(l9_252,0.0);
}
else
{
if (l9_253==1)
{
l9_255=float3(l9_252.x,(l9_252.y*0.5)+(0.5-(float(l9_254)*0.5)),0.0);
}
else
{
l9_255=float3(l9_252,float(l9_254));
}
}
float3 l9_256=l9_255;
float3 l9_257=l9_256;
float4 l9_258=sc_set0.depthImage.sample(sc_set0.depthImageSmpSC,l9_257.xy,bias(l9_251));
float4 l9_259=l9_258;
if (l9_189)
{
l9_259=mix(l9_190,l9_259,float4(l9_193));
}
float4 l9_260=l9_259;
l9_174=l9_260;
float l9_261=0.0;
l9_261=l9_174.x;
float l9_262=0.0;
float l9_263=(*sc_set0.UserUniforms).fallbacktexMult;
l9_262=l9_263;
float l9_264=0.0;
l9_264=l9_261*l9_262;
float l9_265=0.0;
float l9_266=(*sc_set0.UserUniforms).focusDistance;
l9_265=l9_266;
float l9_267=0.0;
float l9_268=(*sc_set0.UserUniforms).aperture;
l9_267=l9_268;
float l9_269=0.0;
float l9_270=(*sc_set0.UserUniforms).Port_Value_N041;
float l9_271=l9_270+0.001;
l9_271-=0.001;
l9_269=l9_271;
float l9_272=0.0;
l9_272=(l9_267*l9_269)*(*sc_set0.UserUniforms).Port_Input2_N032;
float l9_273=0.0;
l9_273=l9_265+l9_272;
float l9_274=0.0;
l9_274=(l9_267*l9_269)*(*sc_set0.UserUniforms).Port_Input2_N033;
float l9_275=0.0;
l9_275=l9_265+l9_274;
float l9_276=0.0;
l9_276=(((l9_264-l9_273)/((l9_275-l9_273)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N035-(*sc_set0.UserUniforms).Port_RangeMinB_N035))+(*sc_set0.UserUniforms).Port_RangeMinB_N035;
float l9_277=0.0;
l9_277=abs(l9_276);
float l9_278=0.0;
l9_278=l9_277+(*sc_set0.UserUniforms).Port_Input1_N043;
float l9_279=0.0;
l9_279=l9_172*l9_278;
float l9_280=0.0;
l9_280=fast::clamp(l9_279,(*sc_set0.UserUniforms).Port_Input1_N052,(*sc_set0.UserUniforms).Port_Input2_N052);
float l9_281=0.0;
l9_281=l9_280;
float l9_282=0.0;
l9_282=exp2(l9_281);
float l9_283=0.0;
l9_283=l9_165.Loop_Index_ID0;
float2 l9_284=float2(0.0);
float l9_285=l9_283;
float2 l9_286=(*sc_set0.UserUniforms).Port_Item0_N016;
float2 l9_287=(*sc_set0.UserUniforms).Port_Item1_N016;
float2 l9_288=(*sc_set0.UserUniforms).Port_Item2_N016;
float2 l9_289=(*sc_set0.UserUniforms).Port_Item3_N016;
float2 l9_290=(*sc_set0.UserUniforms).Port_Item4_N016;
float2 l9_291=(*sc_set0.UserUniforms).Port_Item5_N016;
float2 l9_292=(*sc_set0.UserUniforms).Port_Item6_N016;
float2 l9_293=(*sc_set0.UserUniforms).Port_Item7_N016;
float2 l9_294[8];
l9_294[0]=l9_286;
l9_294[1]=l9_287;
l9_294[2]=l9_288;
l9_294[3]=l9_289;
l9_294[4]=l9_290;
l9_294[5]=l9_291;
l9_294[6]=l9_292;
l9_294[7]=l9_293;
int l9_295=int(fast::clamp(l9_285+9.9999997e-05,0.0,7.0));
float2 l9_296=l9_294[l9_295];
l9_284=l9_296;
float2 l9_297=float2(0.0);
l9_297=(l9_171*float2(l9_282))*l9_284;
float2 l9_298=float2(0.0);
l9_298=l9_170+l9_297;
float l9_299=0.0;
l9_299=l9_281+(*sc_set0.UserUniforms).Port_Input1_N045;
float4 l9_300=float4(0.0);
int l9_301;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_302=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_302=0;
}
else
{
l9_302=in.varStereoViewID;
}
int l9_303=l9_302;
l9_301=1-l9_303;
}
else
{
int l9_304=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_304=0;
}
else
{
l9_304=in.varStereoViewID;
}
int l9_305=l9_304;
l9_301=l9_305;
}
int l9_306=l9_301;
int l9_307=screenTexLayout_tmp;
int l9_308=l9_306;
float2 l9_309=l9_298;
bool l9_310=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_311=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_312=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_313=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_314=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_315=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_316=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_317=l9_299;
bool l9_318=l9_315&&(!l9_313);
float l9_319=1.0;
float l9_320=l9_309.x;
int l9_321=l9_312.x;
if (l9_321==1)
{
l9_320=fract(l9_320);
}
else
{
if (l9_321==2)
{
float l9_322=fract(l9_320);
float l9_323=l9_320-l9_322;
float l9_324=step(0.25,fract(l9_323*0.5));
l9_320=mix(l9_322,1.0-l9_322,fast::clamp(l9_324,0.0,1.0));
}
}
l9_309.x=l9_320;
float l9_325=l9_309.y;
int l9_326=l9_312.y;
if (l9_326==1)
{
l9_325=fract(l9_325);
}
else
{
if (l9_326==2)
{
float l9_327=fract(l9_325);
float l9_328=l9_325-l9_327;
float l9_329=step(0.25,fract(l9_328*0.5));
l9_325=mix(l9_327,1.0-l9_327,fast::clamp(l9_329,0.0,1.0));
}
}
l9_309.y=l9_325;
if (l9_313)
{
bool l9_330=l9_315;
bool l9_331;
if (l9_330)
{
l9_331=l9_312.x==3;
}
else
{
l9_331=l9_330;
}
float l9_332=l9_309.x;
float l9_333=l9_314.x;
float l9_334=l9_314.z;
bool l9_335=l9_331;
float l9_336=l9_319;
float l9_337=fast::clamp(l9_332,l9_333,l9_334);
float l9_338=step(abs(l9_332-l9_337),9.9999997e-06);
l9_336*=(l9_338+((1.0-float(l9_335))*(1.0-l9_338)));
l9_332=l9_337;
l9_309.x=l9_332;
l9_319=l9_336;
bool l9_339=l9_315;
bool l9_340;
if (l9_339)
{
l9_340=l9_312.y==3;
}
else
{
l9_340=l9_339;
}
float l9_341=l9_309.y;
float l9_342=l9_314.y;
float l9_343=l9_314.w;
bool l9_344=l9_340;
float l9_345=l9_319;
float l9_346=fast::clamp(l9_341,l9_342,l9_343);
float l9_347=step(abs(l9_341-l9_346),9.9999997e-06);
l9_345*=(l9_347+((1.0-float(l9_344))*(1.0-l9_347)));
l9_341=l9_346;
l9_309.y=l9_341;
l9_319=l9_345;
}
float2 l9_348=l9_309;
bool l9_349=l9_310;
float3x3 l9_350=l9_311;
if (l9_349)
{
l9_348=float2((l9_350*float3(l9_348,1.0)).xy);
}
float2 l9_351=l9_348;
l9_309=l9_351;
float l9_352=l9_309.x;
int l9_353=l9_312.x;
bool l9_354=l9_318;
float l9_355=l9_319;
if ((l9_353==0)||(l9_353==3))
{
float l9_356=l9_352;
float l9_357=0.0;
float l9_358=1.0;
bool l9_359=l9_354;
float l9_360=l9_355;
float l9_361=fast::clamp(l9_356,l9_357,l9_358);
float l9_362=step(abs(l9_356-l9_361),9.9999997e-06);
l9_360*=(l9_362+((1.0-float(l9_359))*(1.0-l9_362)));
l9_356=l9_361;
l9_352=l9_356;
l9_355=l9_360;
}
l9_309.x=l9_352;
l9_319=l9_355;
float l9_363=l9_309.y;
int l9_364=l9_312.y;
bool l9_365=l9_318;
float l9_366=l9_319;
if ((l9_364==0)||(l9_364==3))
{
float l9_367=l9_363;
float l9_368=0.0;
float l9_369=1.0;
bool l9_370=l9_365;
float l9_371=l9_366;
float l9_372=fast::clamp(l9_367,l9_368,l9_369);
float l9_373=step(abs(l9_367-l9_372),9.9999997e-06);
l9_371*=(l9_373+((1.0-float(l9_370))*(1.0-l9_373)));
l9_367=l9_372;
l9_363=l9_367;
l9_366=l9_371;
}
l9_309.y=l9_363;
l9_319=l9_366;
float2 l9_374=l9_309;
int l9_375=l9_307;
int l9_376=l9_308;
float l9_377=l9_317;
float2 l9_378=l9_374;
int l9_379=l9_375;
int l9_380=l9_376;
float3 l9_381=float3(0.0);
if (l9_379==0)
{
l9_381=float3(l9_378,0.0);
}
else
{
if (l9_379==1)
{
l9_381=float3(l9_378.x,(l9_378.y*0.5)+(0.5-(float(l9_380)*0.5)),0.0);
}
else
{
l9_381=float3(l9_378,float(l9_380));
}
}
float3 l9_382=l9_381;
float3 l9_383=l9_382;
float4 l9_384=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_383.xy,level(l9_377));
float4 l9_385=l9_384;
if (l9_315)
{
l9_385=mix(l9_316,l9_385,float4(l9_319));
}
float4 l9_386=l9_385;
l9_300=l9_386;
l9_166=l9_300;
l9_164+=l9_166;
param_28=l9_164;
float4 l9_387=param_28;
ssGlobals l9_388=param_29;
float4 l9_389=float4(0.0);
l9_388.Loop_Index_ID0=1.0;
l9_388.Loop_Ratio_ID0=0.142857;
float2 l9_390=float2(0.0);
float2 l9_391=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_390=l9_391;
float2 l9_392=float2(0.0);
l9_392=l9_388.gScreenCoord;
float2 l9_393=float2(0.0);
l9_393=l9_392;
float2 l9_394=float2(0.0);
l9_394=l9_390;
float l9_395=0.0;
float l9_396=(*sc_set0.UserUniforms).blurIntensity;
l9_395=l9_396;
float4 l9_397=float4(0.0);
int l9_398;
if ((int(depthImageHasSwappedViews_tmp)!=0))
{
int l9_399=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_399=0;
}
else
{
l9_399=in.varStereoViewID;
}
int l9_400=l9_399;
l9_398=1-l9_400;
}
else
{
int l9_401=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_401=0;
}
else
{
l9_401=in.varStereoViewID;
}
int l9_402=l9_401;
l9_398=l9_402;
}
int l9_403=l9_398;
int l9_404=depthImageLayout_tmp;
int l9_405=l9_403;
float2 l9_406=l9_392;
bool l9_407=(int(SC_USE_UV_TRANSFORM_depthImage_tmp)!=0);
float3x3 l9_408=(*sc_set0.UserUniforms).depthImageTransform;
int2 l9_409=int2(SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp,SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp);
bool l9_410=(int(SC_USE_UV_MIN_MAX_depthImage_tmp)!=0);
float4 l9_411=(*sc_set0.UserUniforms).depthImageUvMinMax;
bool l9_412=(int(SC_USE_CLAMP_TO_BORDER_depthImage_tmp)!=0);
float4 l9_413=(*sc_set0.UserUniforms).depthImageBorderColor;
float l9_414=0.0;
bool l9_415=l9_412&&(!l9_410);
float l9_416=1.0;
float l9_417=l9_406.x;
int l9_418=l9_409.x;
if (l9_418==1)
{
l9_417=fract(l9_417);
}
else
{
if (l9_418==2)
{
float l9_419=fract(l9_417);
float l9_420=l9_417-l9_419;
float l9_421=step(0.25,fract(l9_420*0.5));
l9_417=mix(l9_419,1.0-l9_419,fast::clamp(l9_421,0.0,1.0));
}
}
l9_406.x=l9_417;
float l9_422=l9_406.y;
int l9_423=l9_409.y;
if (l9_423==1)
{
l9_422=fract(l9_422);
}
else
{
if (l9_423==2)
{
float l9_424=fract(l9_422);
float l9_425=l9_422-l9_424;
float l9_426=step(0.25,fract(l9_425*0.5));
l9_422=mix(l9_424,1.0-l9_424,fast::clamp(l9_426,0.0,1.0));
}
}
l9_406.y=l9_422;
if (l9_410)
{
bool l9_427=l9_412;
bool l9_428;
if (l9_427)
{
l9_428=l9_409.x==3;
}
else
{
l9_428=l9_427;
}
float l9_429=l9_406.x;
float l9_430=l9_411.x;
float l9_431=l9_411.z;
bool l9_432=l9_428;
float l9_433=l9_416;
float l9_434=fast::clamp(l9_429,l9_430,l9_431);
float l9_435=step(abs(l9_429-l9_434),9.9999997e-06);
l9_433*=(l9_435+((1.0-float(l9_432))*(1.0-l9_435)));
l9_429=l9_434;
l9_406.x=l9_429;
l9_416=l9_433;
bool l9_436=l9_412;
bool l9_437;
if (l9_436)
{
l9_437=l9_409.y==3;
}
else
{
l9_437=l9_436;
}
float l9_438=l9_406.y;
float l9_439=l9_411.y;
float l9_440=l9_411.w;
bool l9_441=l9_437;
float l9_442=l9_416;
float l9_443=fast::clamp(l9_438,l9_439,l9_440);
float l9_444=step(abs(l9_438-l9_443),9.9999997e-06);
l9_442*=(l9_444+((1.0-float(l9_441))*(1.0-l9_444)));
l9_438=l9_443;
l9_406.y=l9_438;
l9_416=l9_442;
}
float2 l9_445=l9_406;
bool l9_446=l9_407;
float3x3 l9_447=l9_408;
if (l9_446)
{
l9_445=float2((l9_447*float3(l9_445,1.0)).xy);
}
float2 l9_448=l9_445;
l9_406=l9_448;
float l9_449=l9_406.x;
int l9_450=l9_409.x;
bool l9_451=l9_415;
float l9_452=l9_416;
if ((l9_450==0)||(l9_450==3))
{
float l9_453=l9_449;
float l9_454=0.0;
float l9_455=1.0;
bool l9_456=l9_451;
float l9_457=l9_452;
float l9_458=fast::clamp(l9_453,l9_454,l9_455);
float l9_459=step(abs(l9_453-l9_458),9.9999997e-06);
l9_457*=(l9_459+((1.0-float(l9_456))*(1.0-l9_459)));
l9_453=l9_458;
l9_449=l9_453;
l9_452=l9_457;
}
l9_406.x=l9_449;
l9_416=l9_452;
float l9_460=l9_406.y;
int l9_461=l9_409.y;
bool l9_462=l9_415;
float l9_463=l9_416;
if ((l9_461==0)||(l9_461==3))
{
float l9_464=l9_460;
float l9_465=0.0;
float l9_466=1.0;
bool l9_467=l9_462;
float l9_468=l9_463;
float l9_469=fast::clamp(l9_464,l9_465,l9_466);
float l9_470=step(abs(l9_464-l9_469),9.9999997e-06);
l9_468*=(l9_470+((1.0-float(l9_467))*(1.0-l9_470)));
l9_464=l9_469;
l9_460=l9_464;
l9_463=l9_468;
}
l9_406.y=l9_460;
l9_416=l9_463;
float2 l9_471=l9_406;
int l9_472=l9_404;
int l9_473=l9_405;
float l9_474=l9_414;
float2 l9_475=l9_471;
int l9_476=l9_472;
int l9_477=l9_473;
float3 l9_478=float3(0.0);
if (l9_476==0)
{
l9_478=float3(l9_475,0.0);
}
else
{
if (l9_476==1)
{
l9_478=float3(l9_475.x,(l9_475.y*0.5)+(0.5-(float(l9_477)*0.5)),0.0);
}
else
{
l9_478=float3(l9_475,float(l9_477));
}
}
float3 l9_479=l9_478;
float3 l9_480=l9_479;
float4 l9_481=sc_set0.depthImage.sample(sc_set0.depthImageSmpSC,l9_480.xy,bias(l9_474));
float4 l9_482=l9_481;
if (l9_412)
{
l9_482=mix(l9_413,l9_482,float4(l9_416));
}
float4 l9_483=l9_482;
l9_397=l9_483;
float l9_484=0.0;
l9_484=l9_397.x;
float l9_485=0.0;
float l9_486=(*sc_set0.UserUniforms).fallbacktexMult;
l9_485=l9_486;
float l9_487=0.0;
l9_487=l9_484*l9_485;
float l9_488=0.0;
float l9_489=(*sc_set0.UserUniforms).focusDistance;
l9_488=l9_489;
float l9_490=0.0;
float l9_491=(*sc_set0.UserUniforms).aperture;
l9_490=l9_491;
float l9_492=0.0;
float l9_493=(*sc_set0.UserUniforms).Port_Value_N041;
float l9_494=l9_493+0.001;
l9_494-=0.001;
l9_492=l9_494;
float l9_495=0.0;
l9_495=(l9_490*l9_492)*(*sc_set0.UserUniforms).Port_Input2_N032;
float l9_496=0.0;
l9_496=l9_488+l9_495;
float l9_497=0.0;
l9_497=(l9_490*l9_492)*(*sc_set0.UserUniforms).Port_Input2_N033;
float l9_498=0.0;
l9_498=l9_488+l9_497;
float l9_499=0.0;
l9_499=(((l9_487-l9_496)/((l9_498-l9_496)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N035-(*sc_set0.UserUniforms).Port_RangeMinB_N035))+(*sc_set0.UserUniforms).Port_RangeMinB_N035;
float l9_500=0.0;
l9_500=abs(l9_499);
float l9_501=0.0;
l9_501=l9_500+(*sc_set0.UserUniforms).Port_Input1_N043;
float l9_502=0.0;
l9_502=l9_395*l9_501;
float l9_503=0.0;
l9_503=fast::clamp(l9_502,(*sc_set0.UserUniforms).Port_Input1_N052,(*sc_set0.UserUniforms).Port_Input2_N052);
float l9_504=0.0;
l9_504=l9_503;
float l9_505=0.0;
l9_505=exp2(l9_504);
float l9_506=0.0;
l9_506=l9_388.Loop_Index_ID0;
float2 l9_507=float2(0.0);
float l9_508=l9_506;
float2 l9_509=(*sc_set0.UserUniforms).Port_Item0_N016;
float2 l9_510=(*sc_set0.UserUniforms).Port_Item1_N016;
float2 l9_511=(*sc_set0.UserUniforms).Port_Item2_N016;
float2 l9_512=(*sc_set0.UserUniforms).Port_Item3_N016;
float2 l9_513=(*sc_set0.UserUniforms).Port_Item4_N016;
float2 l9_514=(*sc_set0.UserUniforms).Port_Item5_N016;
float2 l9_515=(*sc_set0.UserUniforms).Port_Item6_N016;
float2 l9_516=(*sc_set0.UserUniforms).Port_Item7_N016;
float2 l9_517[8];
l9_517[0]=l9_509;
l9_517[1]=l9_510;
l9_517[2]=l9_511;
l9_517[3]=l9_512;
l9_517[4]=l9_513;
l9_517[5]=l9_514;
l9_517[6]=l9_515;
l9_517[7]=l9_516;
int l9_518=int(fast::clamp(l9_508+9.9999997e-05,0.0,7.0));
float2 l9_519=l9_517[l9_518];
l9_507=l9_519;
float2 l9_520=float2(0.0);
l9_520=(l9_394*float2(l9_505))*l9_507;
float2 l9_521=float2(0.0);
l9_521=l9_393+l9_520;
float l9_522=0.0;
l9_522=l9_504+(*sc_set0.UserUniforms).Port_Input1_N045;
float4 l9_523=float4(0.0);
int l9_524;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_525=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_525=0;
}
else
{
l9_525=in.varStereoViewID;
}
int l9_526=l9_525;
l9_524=1-l9_526;
}
else
{
int l9_527=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_527=0;
}
else
{
l9_527=in.varStereoViewID;
}
int l9_528=l9_527;
l9_524=l9_528;
}
int l9_529=l9_524;
int l9_530=screenTexLayout_tmp;
int l9_531=l9_529;
float2 l9_532=l9_521;
bool l9_533=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_534=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_535=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_536=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_537=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_538=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_539=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_540=l9_522;
bool l9_541=l9_538&&(!l9_536);
float l9_542=1.0;
float l9_543=l9_532.x;
int l9_544=l9_535.x;
if (l9_544==1)
{
l9_543=fract(l9_543);
}
else
{
if (l9_544==2)
{
float l9_545=fract(l9_543);
float l9_546=l9_543-l9_545;
float l9_547=step(0.25,fract(l9_546*0.5));
l9_543=mix(l9_545,1.0-l9_545,fast::clamp(l9_547,0.0,1.0));
}
}
l9_532.x=l9_543;
float l9_548=l9_532.y;
int l9_549=l9_535.y;
if (l9_549==1)
{
l9_548=fract(l9_548);
}
else
{
if (l9_549==2)
{
float l9_550=fract(l9_548);
float l9_551=l9_548-l9_550;
float l9_552=step(0.25,fract(l9_551*0.5));
l9_548=mix(l9_550,1.0-l9_550,fast::clamp(l9_552,0.0,1.0));
}
}
l9_532.y=l9_548;
if (l9_536)
{
bool l9_553=l9_538;
bool l9_554;
if (l9_553)
{
l9_554=l9_535.x==3;
}
else
{
l9_554=l9_553;
}
float l9_555=l9_532.x;
float l9_556=l9_537.x;
float l9_557=l9_537.z;
bool l9_558=l9_554;
float l9_559=l9_542;
float l9_560=fast::clamp(l9_555,l9_556,l9_557);
float l9_561=step(abs(l9_555-l9_560),9.9999997e-06);
l9_559*=(l9_561+((1.0-float(l9_558))*(1.0-l9_561)));
l9_555=l9_560;
l9_532.x=l9_555;
l9_542=l9_559;
bool l9_562=l9_538;
bool l9_563;
if (l9_562)
{
l9_563=l9_535.y==3;
}
else
{
l9_563=l9_562;
}
float l9_564=l9_532.y;
float l9_565=l9_537.y;
float l9_566=l9_537.w;
bool l9_567=l9_563;
float l9_568=l9_542;
float l9_569=fast::clamp(l9_564,l9_565,l9_566);
float l9_570=step(abs(l9_564-l9_569),9.9999997e-06);
l9_568*=(l9_570+((1.0-float(l9_567))*(1.0-l9_570)));
l9_564=l9_569;
l9_532.y=l9_564;
l9_542=l9_568;
}
float2 l9_571=l9_532;
bool l9_572=l9_533;
float3x3 l9_573=l9_534;
if (l9_572)
{
l9_571=float2((l9_573*float3(l9_571,1.0)).xy);
}
float2 l9_574=l9_571;
l9_532=l9_574;
float l9_575=l9_532.x;
int l9_576=l9_535.x;
bool l9_577=l9_541;
float l9_578=l9_542;
if ((l9_576==0)||(l9_576==3))
{
float l9_579=l9_575;
float l9_580=0.0;
float l9_581=1.0;
bool l9_582=l9_577;
float l9_583=l9_578;
float l9_584=fast::clamp(l9_579,l9_580,l9_581);
float l9_585=step(abs(l9_579-l9_584),9.9999997e-06);
l9_583*=(l9_585+((1.0-float(l9_582))*(1.0-l9_585)));
l9_579=l9_584;
l9_575=l9_579;
l9_578=l9_583;
}
l9_532.x=l9_575;
l9_542=l9_578;
float l9_586=l9_532.y;
int l9_587=l9_535.y;
bool l9_588=l9_541;
float l9_589=l9_542;
if ((l9_587==0)||(l9_587==3))
{
float l9_590=l9_586;
float l9_591=0.0;
float l9_592=1.0;
bool l9_593=l9_588;
float l9_594=l9_589;
float l9_595=fast::clamp(l9_590,l9_591,l9_592);
float l9_596=step(abs(l9_590-l9_595),9.9999997e-06);
l9_594*=(l9_596+((1.0-float(l9_593))*(1.0-l9_596)));
l9_590=l9_595;
l9_586=l9_590;
l9_589=l9_594;
}
l9_532.y=l9_586;
l9_542=l9_589;
float2 l9_597=l9_532;
int l9_598=l9_530;
int l9_599=l9_531;
float l9_600=l9_540;
float2 l9_601=l9_597;
int l9_602=l9_598;
int l9_603=l9_599;
float3 l9_604=float3(0.0);
if (l9_602==0)
{
l9_604=float3(l9_601,0.0);
}
else
{
if (l9_602==1)
{
l9_604=float3(l9_601.x,(l9_601.y*0.5)+(0.5-(float(l9_603)*0.5)),0.0);
}
else
{
l9_604=float3(l9_601,float(l9_603));
}
}
float3 l9_605=l9_604;
float3 l9_606=l9_605;
float4 l9_607=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_606.xy,level(l9_600));
float4 l9_608=l9_607;
if (l9_538)
{
l9_608=mix(l9_539,l9_608,float4(l9_542));
}
float4 l9_609=l9_608;
l9_523=l9_609;
l9_389=l9_523;
l9_387+=l9_389;
param_28=l9_387;
float4 l9_610=param_28;
ssGlobals l9_611=param_29;
float4 l9_612=float4(0.0);
l9_611.Loop_Index_ID0=2.0;
l9_611.Loop_Ratio_ID0=0.285714;
float2 l9_613=float2(0.0);
float2 l9_614=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_613=l9_614;
float2 l9_615=float2(0.0);
l9_615=l9_611.gScreenCoord;
float2 l9_616=float2(0.0);
l9_616=l9_615;
float2 l9_617=float2(0.0);
l9_617=l9_613;
float l9_618=0.0;
float l9_619=(*sc_set0.UserUniforms).blurIntensity;
l9_618=l9_619;
float4 l9_620=float4(0.0);
int l9_621;
if ((int(depthImageHasSwappedViews_tmp)!=0))
{
int l9_622=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_622=0;
}
else
{
l9_622=in.varStereoViewID;
}
int l9_623=l9_622;
l9_621=1-l9_623;
}
else
{
int l9_624=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_624=0;
}
else
{
l9_624=in.varStereoViewID;
}
int l9_625=l9_624;
l9_621=l9_625;
}
int l9_626=l9_621;
int l9_627=depthImageLayout_tmp;
int l9_628=l9_626;
float2 l9_629=l9_615;
bool l9_630=(int(SC_USE_UV_TRANSFORM_depthImage_tmp)!=0);
float3x3 l9_631=(*sc_set0.UserUniforms).depthImageTransform;
int2 l9_632=int2(SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp,SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp);
bool l9_633=(int(SC_USE_UV_MIN_MAX_depthImage_tmp)!=0);
float4 l9_634=(*sc_set0.UserUniforms).depthImageUvMinMax;
bool l9_635=(int(SC_USE_CLAMP_TO_BORDER_depthImage_tmp)!=0);
float4 l9_636=(*sc_set0.UserUniforms).depthImageBorderColor;
float l9_637=0.0;
bool l9_638=l9_635&&(!l9_633);
float l9_639=1.0;
float l9_640=l9_629.x;
int l9_641=l9_632.x;
if (l9_641==1)
{
l9_640=fract(l9_640);
}
else
{
if (l9_641==2)
{
float l9_642=fract(l9_640);
float l9_643=l9_640-l9_642;
float l9_644=step(0.25,fract(l9_643*0.5));
l9_640=mix(l9_642,1.0-l9_642,fast::clamp(l9_644,0.0,1.0));
}
}
l9_629.x=l9_640;
float l9_645=l9_629.y;
int l9_646=l9_632.y;
if (l9_646==1)
{
l9_645=fract(l9_645);
}
else
{
if (l9_646==2)
{
float l9_647=fract(l9_645);
float l9_648=l9_645-l9_647;
float l9_649=step(0.25,fract(l9_648*0.5));
l9_645=mix(l9_647,1.0-l9_647,fast::clamp(l9_649,0.0,1.0));
}
}
l9_629.y=l9_645;
if (l9_633)
{
bool l9_650=l9_635;
bool l9_651;
if (l9_650)
{
l9_651=l9_632.x==3;
}
else
{
l9_651=l9_650;
}
float l9_652=l9_629.x;
float l9_653=l9_634.x;
float l9_654=l9_634.z;
bool l9_655=l9_651;
float l9_656=l9_639;
float l9_657=fast::clamp(l9_652,l9_653,l9_654);
float l9_658=step(abs(l9_652-l9_657),9.9999997e-06);
l9_656*=(l9_658+((1.0-float(l9_655))*(1.0-l9_658)));
l9_652=l9_657;
l9_629.x=l9_652;
l9_639=l9_656;
bool l9_659=l9_635;
bool l9_660;
if (l9_659)
{
l9_660=l9_632.y==3;
}
else
{
l9_660=l9_659;
}
float l9_661=l9_629.y;
float l9_662=l9_634.y;
float l9_663=l9_634.w;
bool l9_664=l9_660;
float l9_665=l9_639;
float l9_666=fast::clamp(l9_661,l9_662,l9_663);
float l9_667=step(abs(l9_661-l9_666),9.9999997e-06);
l9_665*=(l9_667+((1.0-float(l9_664))*(1.0-l9_667)));
l9_661=l9_666;
l9_629.y=l9_661;
l9_639=l9_665;
}
float2 l9_668=l9_629;
bool l9_669=l9_630;
float3x3 l9_670=l9_631;
if (l9_669)
{
l9_668=float2((l9_670*float3(l9_668,1.0)).xy);
}
float2 l9_671=l9_668;
l9_629=l9_671;
float l9_672=l9_629.x;
int l9_673=l9_632.x;
bool l9_674=l9_638;
float l9_675=l9_639;
if ((l9_673==0)||(l9_673==3))
{
float l9_676=l9_672;
float l9_677=0.0;
float l9_678=1.0;
bool l9_679=l9_674;
float l9_680=l9_675;
float l9_681=fast::clamp(l9_676,l9_677,l9_678);
float l9_682=step(abs(l9_676-l9_681),9.9999997e-06);
l9_680*=(l9_682+((1.0-float(l9_679))*(1.0-l9_682)));
l9_676=l9_681;
l9_672=l9_676;
l9_675=l9_680;
}
l9_629.x=l9_672;
l9_639=l9_675;
float l9_683=l9_629.y;
int l9_684=l9_632.y;
bool l9_685=l9_638;
float l9_686=l9_639;
if ((l9_684==0)||(l9_684==3))
{
float l9_687=l9_683;
float l9_688=0.0;
float l9_689=1.0;
bool l9_690=l9_685;
float l9_691=l9_686;
float l9_692=fast::clamp(l9_687,l9_688,l9_689);
float l9_693=step(abs(l9_687-l9_692),9.9999997e-06);
l9_691*=(l9_693+((1.0-float(l9_690))*(1.0-l9_693)));
l9_687=l9_692;
l9_683=l9_687;
l9_686=l9_691;
}
l9_629.y=l9_683;
l9_639=l9_686;
float2 l9_694=l9_629;
int l9_695=l9_627;
int l9_696=l9_628;
float l9_697=l9_637;
float2 l9_698=l9_694;
int l9_699=l9_695;
int l9_700=l9_696;
float3 l9_701=float3(0.0);
if (l9_699==0)
{
l9_701=float3(l9_698,0.0);
}
else
{
if (l9_699==1)
{
l9_701=float3(l9_698.x,(l9_698.y*0.5)+(0.5-(float(l9_700)*0.5)),0.0);
}
else
{
l9_701=float3(l9_698,float(l9_700));
}
}
float3 l9_702=l9_701;
float3 l9_703=l9_702;
float4 l9_704=sc_set0.depthImage.sample(sc_set0.depthImageSmpSC,l9_703.xy,bias(l9_697));
float4 l9_705=l9_704;
if (l9_635)
{
l9_705=mix(l9_636,l9_705,float4(l9_639));
}
float4 l9_706=l9_705;
l9_620=l9_706;
float l9_707=0.0;
l9_707=l9_620.x;
float l9_708=0.0;
float l9_709=(*sc_set0.UserUniforms).fallbacktexMult;
l9_708=l9_709;
float l9_710=0.0;
l9_710=l9_707*l9_708;
float l9_711=0.0;
float l9_712=(*sc_set0.UserUniforms).focusDistance;
l9_711=l9_712;
float l9_713=0.0;
float l9_714=(*sc_set0.UserUniforms).aperture;
l9_713=l9_714;
float l9_715=0.0;
float l9_716=(*sc_set0.UserUniforms).Port_Value_N041;
float l9_717=l9_716+0.001;
l9_717-=0.001;
l9_715=l9_717;
float l9_718=0.0;
l9_718=(l9_713*l9_715)*(*sc_set0.UserUniforms).Port_Input2_N032;
float l9_719=0.0;
l9_719=l9_711+l9_718;
float l9_720=0.0;
l9_720=(l9_713*l9_715)*(*sc_set0.UserUniforms).Port_Input2_N033;
float l9_721=0.0;
l9_721=l9_711+l9_720;
float l9_722=0.0;
l9_722=(((l9_710-l9_719)/((l9_721-l9_719)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N035-(*sc_set0.UserUniforms).Port_RangeMinB_N035))+(*sc_set0.UserUniforms).Port_RangeMinB_N035;
float l9_723=0.0;
l9_723=abs(l9_722);
float l9_724=0.0;
l9_724=l9_723+(*sc_set0.UserUniforms).Port_Input1_N043;
float l9_725=0.0;
l9_725=l9_618*l9_724;
float l9_726=0.0;
l9_726=fast::clamp(l9_725,(*sc_set0.UserUniforms).Port_Input1_N052,(*sc_set0.UserUniforms).Port_Input2_N052);
float l9_727=0.0;
l9_727=l9_726;
float l9_728=0.0;
l9_728=exp2(l9_727);
float l9_729=0.0;
l9_729=l9_611.Loop_Index_ID0;
float2 l9_730=float2(0.0);
float l9_731=l9_729;
float2 l9_732=(*sc_set0.UserUniforms).Port_Item0_N016;
float2 l9_733=(*sc_set0.UserUniforms).Port_Item1_N016;
float2 l9_734=(*sc_set0.UserUniforms).Port_Item2_N016;
float2 l9_735=(*sc_set0.UserUniforms).Port_Item3_N016;
float2 l9_736=(*sc_set0.UserUniforms).Port_Item4_N016;
float2 l9_737=(*sc_set0.UserUniforms).Port_Item5_N016;
float2 l9_738=(*sc_set0.UserUniforms).Port_Item6_N016;
float2 l9_739=(*sc_set0.UserUniforms).Port_Item7_N016;
float2 l9_740[8];
l9_740[0]=l9_732;
l9_740[1]=l9_733;
l9_740[2]=l9_734;
l9_740[3]=l9_735;
l9_740[4]=l9_736;
l9_740[5]=l9_737;
l9_740[6]=l9_738;
l9_740[7]=l9_739;
int l9_741=int(fast::clamp(l9_731+9.9999997e-05,0.0,7.0));
float2 l9_742=l9_740[l9_741];
l9_730=l9_742;
float2 l9_743=float2(0.0);
l9_743=(l9_617*float2(l9_728))*l9_730;
float2 l9_744=float2(0.0);
l9_744=l9_616+l9_743;
float l9_745=0.0;
l9_745=l9_727+(*sc_set0.UserUniforms).Port_Input1_N045;
float4 l9_746=float4(0.0);
int l9_747;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_748=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_748=0;
}
else
{
l9_748=in.varStereoViewID;
}
int l9_749=l9_748;
l9_747=1-l9_749;
}
else
{
int l9_750=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_750=0;
}
else
{
l9_750=in.varStereoViewID;
}
int l9_751=l9_750;
l9_747=l9_751;
}
int l9_752=l9_747;
int l9_753=screenTexLayout_tmp;
int l9_754=l9_752;
float2 l9_755=l9_744;
bool l9_756=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_757=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_758=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_759=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_760=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_761=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_762=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_763=l9_745;
bool l9_764=l9_761&&(!l9_759);
float l9_765=1.0;
float l9_766=l9_755.x;
int l9_767=l9_758.x;
if (l9_767==1)
{
l9_766=fract(l9_766);
}
else
{
if (l9_767==2)
{
float l9_768=fract(l9_766);
float l9_769=l9_766-l9_768;
float l9_770=step(0.25,fract(l9_769*0.5));
l9_766=mix(l9_768,1.0-l9_768,fast::clamp(l9_770,0.0,1.0));
}
}
l9_755.x=l9_766;
float l9_771=l9_755.y;
int l9_772=l9_758.y;
if (l9_772==1)
{
l9_771=fract(l9_771);
}
else
{
if (l9_772==2)
{
float l9_773=fract(l9_771);
float l9_774=l9_771-l9_773;
float l9_775=step(0.25,fract(l9_774*0.5));
l9_771=mix(l9_773,1.0-l9_773,fast::clamp(l9_775,0.0,1.0));
}
}
l9_755.y=l9_771;
if (l9_759)
{
bool l9_776=l9_761;
bool l9_777;
if (l9_776)
{
l9_777=l9_758.x==3;
}
else
{
l9_777=l9_776;
}
float l9_778=l9_755.x;
float l9_779=l9_760.x;
float l9_780=l9_760.z;
bool l9_781=l9_777;
float l9_782=l9_765;
float l9_783=fast::clamp(l9_778,l9_779,l9_780);
float l9_784=step(abs(l9_778-l9_783),9.9999997e-06);
l9_782*=(l9_784+((1.0-float(l9_781))*(1.0-l9_784)));
l9_778=l9_783;
l9_755.x=l9_778;
l9_765=l9_782;
bool l9_785=l9_761;
bool l9_786;
if (l9_785)
{
l9_786=l9_758.y==3;
}
else
{
l9_786=l9_785;
}
float l9_787=l9_755.y;
float l9_788=l9_760.y;
float l9_789=l9_760.w;
bool l9_790=l9_786;
float l9_791=l9_765;
float l9_792=fast::clamp(l9_787,l9_788,l9_789);
float l9_793=step(abs(l9_787-l9_792),9.9999997e-06);
l9_791*=(l9_793+((1.0-float(l9_790))*(1.0-l9_793)));
l9_787=l9_792;
l9_755.y=l9_787;
l9_765=l9_791;
}
float2 l9_794=l9_755;
bool l9_795=l9_756;
float3x3 l9_796=l9_757;
if (l9_795)
{
l9_794=float2((l9_796*float3(l9_794,1.0)).xy);
}
float2 l9_797=l9_794;
l9_755=l9_797;
float l9_798=l9_755.x;
int l9_799=l9_758.x;
bool l9_800=l9_764;
float l9_801=l9_765;
if ((l9_799==0)||(l9_799==3))
{
float l9_802=l9_798;
float l9_803=0.0;
float l9_804=1.0;
bool l9_805=l9_800;
float l9_806=l9_801;
float l9_807=fast::clamp(l9_802,l9_803,l9_804);
float l9_808=step(abs(l9_802-l9_807),9.9999997e-06);
l9_806*=(l9_808+((1.0-float(l9_805))*(1.0-l9_808)));
l9_802=l9_807;
l9_798=l9_802;
l9_801=l9_806;
}
l9_755.x=l9_798;
l9_765=l9_801;
float l9_809=l9_755.y;
int l9_810=l9_758.y;
bool l9_811=l9_764;
float l9_812=l9_765;
if ((l9_810==0)||(l9_810==3))
{
float l9_813=l9_809;
float l9_814=0.0;
float l9_815=1.0;
bool l9_816=l9_811;
float l9_817=l9_812;
float l9_818=fast::clamp(l9_813,l9_814,l9_815);
float l9_819=step(abs(l9_813-l9_818),9.9999997e-06);
l9_817*=(l9_819+((1.0-float(l9_816))*(1.0-l9_819)));
l9_813=l9_818;
l9_809=l9_813;
l9_812=l9_817;
}
l9_755.y=l9_809;
l9_765=l9_812;
float2 l9_820=l9_755;
int l9_821=l9_753;
int l9_822=l9_754;
float l9_823=l9_763;
float2 l9_824=l9_820;
int l9_825=l9_821;
int l9_826=l9_822;
float3 l9_827=float3(0.0);
if (l9_825==0)
{
l9_827=float3(l9_824,0.0);
}
else
{
if (l9_825==1)
{
l9_827=float3(l9_824.x,(l9_824.y*0.5)+(0.5-(float(l9_826)*0.5)),0.0);
}
else
{
l9_827=float3(l9_824,float(l9_826));
}
}
float3 l9_828=l9_827;
float3 l9_829=l9_828;
float4 l9_830=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_829.xy,level(l9_823));
float4 l9_831=l9_830;
if (l9_761)
{
l9_831=mix(l9_762,l9_831,float4(l9_765));
}
float4 l9_832=l9_831;
l9_746=l9_832;
l9_612=l9_746;
l9_610+=l9_612;
param_28=l9_610;
float4 l9_833=param_28;
ssGlobals l9_834=param_29;
float4 l9_835=float4(0.0);
l9_834.Loop_Index_ID0=3.0;
l9_834.Loop_Ratio_ID0=0.42857099;
float2 l9_836=float2(0.0);
float2 l9_837=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_836=l9_837;
float2 l9_838=float2(0.0);
l9_838=l9_834.gScreenCoord;
float2 l9_839=float2(0.0);
l9_839=l9_838;
float2 l9_840=float2(0.0);
l9_840=l9_836;
float l9_841=0.0;
float l9_842=(*sc_set0.UserUniforms).blurIntensity;
l9_841=l9_842;
float4 l9_843=float4(0.0);
int l9_844;
if ((int(depthImageHasSwappedViews_tmp)!=0))
{
int l9_845=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_845=0;
}
else
{
l9_845=in.varStereoViewID;
}
int l9_846=l9_845;
l9_844=1-l9_846;
}
else
{
int l9_847=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_847=0;
}
else
{
l9_847=in.varStereoViewID;
}
int l9_848=l9_847;
l9_844=l9_848;
}
int l9_849=l9_844;
int l9_850=depthImageLayout_tmp;
int l9_851=l9_849;
float2 l9_852=l9_838;
bool l9_853=(int(SC_USE_UV_TRANSFORM_depthImage_tmp)!=0);
float3x3 l9_854=(*sc_set0.UserUniforms).depthImageTransform;
int2 l9_855=int2(SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp,SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp);
bool l9_856=(int(SC_USE_UV_MIN_MAX_depthImage_tmp)!=0);
float4 l9_857=(*sc_set0.UserUniforms).depthImageUvMinMax;
bool l9_858=(int(SC_USE_CLAMP_TO_BORDER_depthImage_tmp)!=0);
float4 l9_859=(*sc_set0.UserUniforms).depthImageBorderColor;
float l9_860=0.0;
bool l9_861=l9_858&&(!l9_856);
float l9_862=1.0;
float l9_863=l9_852.x;
int l9_864=l9_855.x;
if (l9_864==1)
{
l9_863=fract(l9_863);
}
else
{
if (l9_864==2)
{
float l9_865=fract(l9_863);
float l9_866=l9_863-l9_865;
float l9_867=step(0.25,fract(l9_866*0.5));
l9_863=mix(l9_865,1.0-l9_865,fast::clamp(l9_867,0.0,1.0));
}
}
l9_852.x=l9_863;
float l9_868=l9_852.y;
int l9_869=l9_855.y;
if (l9_869==1)
{
l9_868=fract(l9_868);
}
else
{
if (l9_869==2)
{
float l9_870=fract(l9_868);
float l9_871=l9_868-l9_870;
float l9_872=step(0.25,fract(l9_871*0.5));
l9_868=mix(l9_870,1.0-l9_870,fast::clamp(l9_872,0.0,1.0));
}
}
l9_852.y=l9_868;
if (l9_856)
{
bool l9_873=l9_858;
bool l9_874;
if (l9_873)
{
l9_874=l9_855.x==3;
}
else
{
l9_874=l9_873;
}
float l9_875=l9_852.x;
float l9_876=l9_857.x;
float l9_877=l9_857.z;
bool l9_878=l9_874;
float l9_879=l9_862;
float l9_880=fast::clamp(l9_875,l9_876,l9_877);
float l9_881=step(abs(l9_875-l9_880),9.9999997e-06);
l9_879*=(l9_881+((1.0-float(l9_878))*(1.0-l9_881)));
l9_875=l9_880;
l9_852.x=l9_875;
l9_862=l9_879;
bool l9_882=l9_858;
bool l9_883;
if (l9_882)
{
l9_883=l9_855.y==3;
}
else
{
l9_883=l9_882;
}
float l9_884=l9_852.y;
float l9_885=l9_857.y;
float l9_886=l9_857.w;
bool l9_887=l9_883;
float l9_888=l9_862;
float l9_889=fast::clamp(l9_884,l9_885,l9_886);
float l9_890=step(abs(l9_884-l9_889),9.9999997e-06);
l9_888*=(l9_890+((1.0-float(l9_887))*(1.0-l9_890)));
l9_884=l9_889;
l9_852.y=l9_884;
l9_862=l9_888;
}
float2 l9_891=l9_852;
bool l9_892=l9_853;
float3x3 l9_893=l9_854;
if (l9_892)
{
l9_891=float2((l9_893*float3(l9_891,1.0)).xy);
}
float2 l9_894=l9_891;
l9_852=l9_894;
float l9_895=l9_852.x;
int l9_896=l9_855.x;
bool l9_897=l9_861;
float l9_898=l9_862;
if ((l9_896==0)||(l9_896==3))
{
float l9_899=l9_895;
float l9_900=0.0;
float l9_901=1.0;
bool l9_902=l9_897;
float l9_903=l9_898;
float l9_904=fast::clamp(l9_899,l9_900,l9_901);
float l9_905=step(abs(l9_899-l9_904),9.9999997e-06);
l9_903*=(l9_905+((1.0-float(l9_902))*(1.0-l9_905)));
l9_899=l9_904;
l9_895=l9_899;
l9_898=l9_903;
}
l9_852.x=l9_895;
l9_862=l9_898;
float l9_906=l9_852.y;
int l9_907=l9_855.y;
bool l9_908=l9_861;
float l9_909=l9_862;
if ((l9_907==0)||(l9_907==3))
{
float l9_910=l9_906;
float l9_911=0.0;
float l9_912=1.0;
bool l9_913=l9_908;
float l9_914=l9_909;
float l9_915=fast::clamp(l9_910,l9_911,l9_912);
float l9_916=step(abs(l9_910-l9_915),9.9999997e-06);
l9_914*=(l9_916+((1.0-float(l9_913))*(1.0-l9_916)));
l9_910=l9_915;
l9_906=l9_910;
l9_909=l9_914;
}
l9_852.y=l9_906;
l9_862=l9_909;
float2 l9_917=l9_852;
int l9_918=l9_850;
int l9_919=l9_851;
float l9_920=l9_860;
float2 l9_921=l9_917;
int l9_922=l9_918;
int l9_923=l9_919;
float3 l9_924=float3(0.0);
if (l9_922==0)
{
l9_924=float3(l9_921,0.0);
}
else
{
if (l9_922==1)
{
l9_924=float3(l9_921.x,(l9_921.y*0.5)+(0.5-(float(l9_923)*0.5)),0.0);
}
else
{
l9_924=float3(l9_921,float(l9_923));
}
}
float3 l9_925=l9_924;
float3 l9_926=l9_925;
float4 l9_927=sc_set0.depthImage.sample(sc_set0.depthImageSmpSC,l9_926.xy,bias(l9_920));
float4 l9_928=l9_927;
if (l9_858)
{
l9_928=mix(l9_859,l9_928,float4(l9_862));
}
float4 l9_929=l9_928;
l9_843=l9_929;
float l9_930=0.0;
l9_930=l9_843.x;
float l9_931=0.0;
float l9_932=(*sc_set0.UserUniforms).fallbacktexMult;
l9_931=l9_932;
float l9_933=0.0;
l9_933=l9_930*l9_931;
float l9_934=0.0;
float l9_935=(*sc_set0.UserUniforms).focusDistance;
l9_934=l9_935;
float l9_936=0.0;
float l9_937=(*sc_set0.UserUniforms).aperture;
l9_936=l9_937;
float l9_938=0.0;
float l9_939=(*sc_set0.UserUniforms).Port_Value_N041;
float l9_940=l9_939+0.001;
l9_940-=0.001;
l9_938=l9_940;
float l9_941=0.0;
l9_941=(l9_936*l9_938)*(*sc_set0.UserUniforms).Port_Input2_N032;
float l9_942=0.0;
l9_942=l9_934+l9_941;
float l9_943=0.0;
l9_943=(l9_936*l9_938)*(*sc_set0.UserUniforms).Port_Input2_N033;
float l9_944=0.0;
l9_944=l9_934+l9_943;
float l9_945=0.0;
l9_945=(((l9_933-l9_942)/((l9_944-l9_942)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N035-(*sc_set0.UserUniforms).Port_RangeMinB_N035))+(*sc_set0.UserUniforms).Port_RangeMinB_N035;
float l9_946=0.0;
l9_946=abs(l9_945);
float l9_947=0.0;
l9_947=l9_946+(*sc_set0.UserUniforms).Port_Input1_N043;
float l9_948=0.0;
l9_948=l9_841*l9_947;
float l9_949=0.0;
l9_949=fast::clamp(l9_948,(*sc_set0.UserUniforms).Port_Input1_N052,(*sc_set0.UserUniforms).Port_Input2_N052);
float l9_950=0.0;
l9_950=l9_949;
float l9_951=0.0;
l9_951=exp2(l9_950);
float l9_952=0.0;
l9_952=l9_834.Loop_Index_ID0;
float2 l9_953=float2(0.0);
float l9_954=l9_952;
float2 l9_955=(*sc_set0.UserUniforms).Port_Item0_N016;
float2 l9_956=(*sc_set0.UserUniforms).Port_Item1_N016;
float2 l9_957=(*sc_set0.UserUniforms).Port_Item2_N016;
float2 l9_958=(*sc_set0.UserUniforms).Port_Item3_N016;
float2 l9_959=(*sc_set0.UserUniforms).Port_Item4_N016;
float2 l9_960=(*sc_set0.UserUniforms).Port_Item5_N016;
float2 l9_961=(*sc_set0.UserUniforms).Port_Item6_N016;
float2 l9_962=(*sc_set0.UserUniforms).Port_Item7_N016;
float2 l9_963[8];
l9_963[0]=l9_955;
l9_963[1]=l9_956;
l9_963[2]=l9_957;
l9_963[3]=l9_958;
l9_963[4]=l9_959;
l9_963[5]=l9_960;
l9_963[6]=l9_961;
l9_963[7]=l9_962;
int l9_964=int(fast::clamp(l9_954+9.9999997e-05,0.0,7.0));
float2 l9_965=l9_963[l9_964];
l9_953=l9_965;
float2 l9_966=float2(0.0);
l9_966=(l9_840*float2(l9_951))*l9_953;
float2 l9_967=float2(0.0);
l9_967=l9_839+l9_966;
float l9_968=0.0;
l9_968=l9_950+(*sc_set0.UserUniforms).Port_Input1_N045;
float4 l9_969=float4(0.0);
int l9_970;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_971=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_971=0;
}
else
{
l9_971=in.varStereoViewID;
}
int l9_972=l9_971;
l9_970=1-l9_972;
}
else
{
int l9_973=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_973=0;
}
else
{
l9_973=in.varStereoViewID;
}
int l9_974=l9_973;
l9_970=l9_974;
}
int l9_975=l9_970;
int l9_976=screenTexLayout_tmp;
int l9_977=l9_975;
float2 l9_978=l9_967;
bool l9_979=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_980=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_981=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_982=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_983=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_984=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_985=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_986=l9_968;
bool l9_987=l9_984&&(!l9_982);
float l9_988=1.0;
float l9_989=l9_978.x;
int l9_990=l9_981.x;
if (l9_990==1)
{
l9_989=fract(l9_989);
}
else
{
if (l9_990==2)
{
float l9_991=fract(l9_989);
float l9_992=l9_989-l9_991;
float l9_993=step(0.25,fract(l9_992*0.5));
l9_989=mix(l9_991,1.0-l9_991,fast::clamp(l9_993,0.0,1.0));
}
}
l9_978.x=l9_989;
float l9_994=l9_978.y;
int l9_995=l9_981.y;
if (l9_995==1)
{
l9_994=fract(l9_994);
}
else
{
if (l9_995==2)
{
float l9_996=fract(l9_994);
float l9_997=l9_994-l9_996;
float l9_998=step(0.25,fract(l9_997*0.5));
l9_994=mix(l9_996,1.0-l9_996,fast::clamp(l9_998,0.0,1.0));
}
}
l9_978.y=l9_994;
if (l9_982)
{
bool l9_999=l9_984;
bool l9_1000;
if (l9_999)
{
l9_1000=l9_981.x==3;
}
else
{
l9_1000=l9_999;
}
float l9_1001=l9_978.x;
float l9_1002=l9_983.x;
float l9_1003=l9_983.z;
bool l9_1004=l9_1000;
float l9_1005=l9_988;
float l9_1006=fast::clamp(l9_1001,l9_1002,l9_1003);
float l9_1007=step(abs(l9_1001-l9_1006),9.9999997e-06);
l9_1005*=(l9_1007+((1.0-float(l9_1004))*(1.0-l9_1007)));
l9_1001=l9_1006;
l9_978.x=l9_1001;
l9_988=l9_1005;
bool l9_1008=l9_984;
bool l9_1009;
if (l9_1008)
{
l9_1009=l9_981.y==3;
}
else
{
l9_1009=l9_1008;
}
float l9_1010=l9_978.y;
float l9_1011=l9_983.y;
float l9_1012=l9_983.w;
bool l9_1013=l9_1009;
float l9_1014=l9_988;
float l9_1015=fast::clamp(l9_1010,l9_1011,l9_1012);
float l9_1016=step(abs(l9_1010-l9_1015),9.9999997e-06);
l9_1014*=(l9_1016+((1.0-float(l9_1013))*(1.0-l9_1016)));
l9_1010=l9_1015;
l9_978.y=l9_1010;
l9_988=l9_1014;
}
float2 l9_1017=l9_978;
bool l9_1018=l9_979;
float3x3 l9_1019=l9_980;
if (l9_1018)
{
l9_1017=float2((l9_1019*float3(l9_1017,1.0)).xy);
}
float2 l9_1020=l9_1017;
l9_978=l9_1020;
float l9_1021=l9_978.x;
int l9_1022=l9_981.x;
bool l9_1023=l9_987;
float l9_1024=l9_988;
if ((l9_1022==0)||(l9_1022==3))
{
float l9_1025=l9_1021;
float l9_1026=0.0;
float l9_1027=1.0;
bool l9_1028=l9_1023;
float l9_1029=l9_1024;
float l9_1030=fast::clamp(l9_1025,l9_1026,l9_1027);
float l9_1031=step(abs(l9_1025-l9_1030),9.9999997e-06);
l9_1029*=(l9_1031+((1.0-float(l9_1028))*(1.0-l9_1031)));
l9_1025=l9_1030;
l9_1021=l9_1025;
l9_1024=l9_1029;
}
l9_978.x=l9_1021;
l9_988=l9_1024;
float l9_1032=l9_978.y;
int l9_1033=l9_981.y;
bool l9_1034=l9_987;
float l9_1035=l9_988;
if ((l9_1033==0)||(l9_1033==3))
{
float l9_1036=l9_1032;
float l9_1037=0.0;
float l9_1038=1.0;
bool l9_1039=l9_1034;
float l9_1040=l9_1035;
float l9_1041=fast::clamp(l9_1036,l9_1037,l9_1038);
float l9_1042=step(abs(l9_1036-l9_1041),9.9999997e-06);
l9_1040*=(l9_1042+((1.0-float(l9_1039))*(1.0-l9_1042)));
l9_1036=l9_1041;
l9_1032=l9_1036;
l9_1035=l9_1040;
}
l9_978.y=l9_1032;
l9_988=l9_1035;
float2 l9_1043=l9_978;
int l9_1044=l9_976;
int l9_1045=l9_977;
float l9_1046=l9_986;
float2 l9_1047=l9_1043;
int l9_1048=l9_1044;
int l9_1049=l9_1045;
float3 l9_1050=float3(0.0);
if (l9_1048==0)
{
l9_1050=float3(l9_1047,0.0);
}
else
{
if (l9_1048==1)
{
l9_1050=float3(l9_1047.x,(l9_1047.y*0.5)+(0.5-(float(l9_1049)*0.5)),0.0);
}
else
{
l9_1050=float3(l9_1047,float(l9_1049));
}
}
float3 l9_1051=l9_1050;
float3 l9_1052=l9_1051;
float4 l9_1053=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1052.xy,level(l9_1046));
float4 l9_1054=l9_1053;
if (l9_984)
{
l9_1054=mix(l9_985,l9_1054,float4(l9_988));
}
float4 l9_1055=l9_1054;
l9_969=l9_1055;
l9_835=l9_969;
l9_833+=l9_835;
param_28=l9_833;
float4 l9_1056=param_28;
ssGlobals l9_1057=param_29;
float4 l9_1058=float4(0.0);
l9_1057.Loop_Index_ID0=4.0;
l9_1057.Loop_Ratio_ID0=0.57142901;
float2 l9_1059=float2(0.0);
float2 l9_1060=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_1059=l9_1060;
float2 l9_1061=float2(0.0);
l9_1061=l9_1057.gScreenCoord;
float2 l9_1062=float2(0.0);
l9_1062=l9_1061;
float2 l9_1063=float2(0.0);
l9_1063=l9_1059;
float l9_1064=0.0;
float l9_1065=(*sc_set0.UserUniforms).blurIntensity;
l9_1064=l9_1065;
float4 l9_1066=float4(0.0);
int l9_1067;
if ((int(depthImageHasSwappedViews_tmp)!=0))
{
int l9_1068=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1068=0;
}
else
{
l9_1068=in.varStereoViewID;
}
int l9_1069=l9_1068;
l9_1067=1-l9_1069;
}
else
{
int l9_1070=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1070=0;
}
else
{
l9_1070=in.varStereoViewID;
}
int l9_1071=l9_1070;
l9_1067=l9_1071;
}
int l9_1072=l9_1067;
int l9_1073=depthImageLayout_tmp;
int l9_1074=l9_1072;
float2 l9_1075=l9_1061;
bool l9_1076=(int(SC_USE_UV_TRANSFORM_depthImage_tmp)!=0);
float3x3 l9_1077=(*sc_set0.UserUniforms).depthImageTransform;
int2 l9_1078=int2(SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp,SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp);
bool l9_1079=(int(SC_USE_UV_MIN_MAX_depthImage_tmp)!=0);
float4 l9_1080=(*sc_set0.UserUniforms).depthImageUvMinMax;
bool l9_1081=(int(SC_USE_CLAMP_TO_BORDER_depthImage_tmp)!=0);
float4 l9_1082=(*sc_set0.UserUniforms).depthImageBorderColor;
float l9_1083=0.0;
bool l9_1084=l9_1081&&(!l9_1079);
float l9_1085=1.0;
float l9_1086=l9_1075.x;
int l9_1087=l9_1078.x;
if (l9_1087==1)
{
l9_1086=fract(l9_1086);
}
else
{
if (l9_1087==2)
{
float l9_1088=fract(l9_1086);
float l9_1089=l9_1086-l9_1088;
float l9_1090=step(0.25,fract(l9_1089*0.5));
l9_1086=mix(l9_1088,1.0-l9_1088,fast::clamp(l9_1090,0.0,1.0));
}
}
l9_1075.x=l9_1086;
float l9_1091=l9_1075.y;
int l9_1092=l9_1078.y;
if (l9_1092==1)
{
l9_1091=fract(l9_1091);
}
else
{
if (l9_1092==2)
{
float l9_1093=fract(l9_1091);
float l9_1094=l9_1091-l9_1093;
float l9_1095=step(0.25,fract(l9_1094*0.5));
l9_1091=mix(l9_1093,1.0-l9_1093,fast::clamp(l9_1095,0.0,1.0));
}
}
l9_1075.y=l9_1091;
if (l9_1079)
{
bool l9_1096=l9_1081;
bool l9_1097;
if (l9_1096)
{
l9_1097=l9_1078.x==3;
}
else
{
l9_1097=l9_1096;
}
float l9_1098=l9_1075.x;
float l9_1099=l9_1080.x;
float l9_1100=l9_1080.z;
bool l9_1101=l9_1097;
float l9_1102=l9_1085;
float l9_1103=fast::clamp(l9_1098,l9_1099,l9_1100);
float l9_1104=step(abs(l9_1098-l9_1103),9.9999997e-06);
l9_1102*=(l9_1104+((1.0-float(l9_1101))*(1.0-l9_1104)));
l9_1098=l9_1103;
l9_1075.x=l9_1098;
l9_1085=l9_1102;
bool l9_1105=l9_1081;
bool l9_1106;
if (l9_1105)
{
l9_1106=l9_1078.y==3;
}
else
{
l9_1106=l9_1105;
}
float l9_1107=l9_1075.y;
float l9_1108=l9_1080.y;
float l9_1109=l9_1080.w;
bool l9_1110=l9_1106;
float l9_1111=l9_1085;
float l9_1112=fast::clamp(l9_1107,l9_1108,l9_1109);
float l9_1113=step(abs(l9_1107-l9_1112),9.9999997e-06);
l9_1111*=(l9_1113+((1.0-float(l9_1110))*(1.0-l9_1113)));
l9_1107=l9_1112;
l9_1075.y=l9_1107;
l9_1085=l9_1111;
}
float2 l9_1114=l9_1075;
bool l9_1115=l9_1076;
float3x3 l9_1116=l9_1077;
if (l9_1115)
{
l9_1114=float2((l9_1116*float3(l9_1114,1.0)).xy);
}
float2 l9_1117=l9_1114;
l9_1075=l9_1117;
float l9_1118=l9_1075.x;
int l9_1119=l9_1078.x;
bool l9_1120=l9_1084;
float l9_1121=l9_1085;
if ((l9_1119==0)||(l9_1119==3))
{
float l9_1122=l9_1118;
float l9_1123=0.0;
float l9_1124=1.0;
bool l9_1125=l9_1120;
float l9_1126=l9_1121;
float l9_1127=fast::clamp(l9_1122,l9_1123,l9_1124);
float l9_1128=step(abs(l9_1122-l9_1127),9.9999997e-06);
l9_1126*=(l9_1128+((1.0-float(l9_1125))*(1.0-l9_1128)));
l9_1122=l9_1127;
l9_1118=l9_1122;
l9_1121=l9_1126;
}
l9_1075.x=l9_1118;
l9_1085=l9_1121;
float l9_1129=l9_1075.y;
int l9_1130=l9_1078.y;
bool l9_1131=l9_1084;
float l9_1132=l9_1085;
if ((l9_1130==0)||(l9_1130==3))
{
float l9_1133=l9_1129;
float l9_1134=0.0;
float l9_1135=1.0;
bool l9_1136=l9_1131;
float l9_1137=l9_1132;
float l9_1138=fast::clamp(l9_1133,l9_1134,l9_1135);
float l9_1139=step(abs(l9_1133-l9_1138),9.9999997e-06);
l9_1137*=(l9_1139+((1.0-float(l9_1136))*(1.0-l9_1139)));
l9_1133=l9_1138;
l9_1129=l9_1133;
l9_1132=l9_1137;
}
l9_1075.y=l9_1129;
l9_1085=l9_1132;
float2 l9_1140=l9_1075;
int l9_1141=l9_1073;
int l9_1142=l9_1074;
float l9_1143=l9_1083;
float2 l9_1144=l9_1140;
int l9_1145=l9_1141;
int l9_1146=l9_1142;
float3 l9_1147=float3(0.0);
if (l9_1145==0)
{
l9_1147=float3(l9_1144,0.0);
}
else
{
if (l9_1145==1)
{
l9_1147=float3(l9_1144.x,(l9_1144.y*0.5)+(0.5-(float(l9_1146)*0.5)),0.0);
}
else
{
l9_1147=float3(l9_1144,float(l9_1146));
}
}
float3 l9_1148=l9_1147;
float3 l9_1149=l9_1148;
float4 l9_1150=sc_set0.depthImage.sample(sc_set0.depthImageSmpSC,l9_1149.xy,bias(l9_1143));
float4 l9_1151=l9_1150;
if (l9_1081)
{
l9_1151=mix(l9_1082,l9_1151,float4(l9_1085));
}
float4 l9_1152=l9_1151;
l9_1066=l9_1152;
float l9_1153=0.0;
l9_1153=l9_1066.x;
float l9_1154=0.0;
float l9_1155=(*sc_set0.UserUniforms).fallbacktexMult;
l9_1154=l9_1155;
float l9_1156=0.0;
l9_1156=l9_1153*l9_1154;
float l9_1157=0.0;
float l9_1158=(*sc_set0.UserUniforms).focusDistance;
l9_1157=l9_1158;
float l9_1159=0.0;
float l9_1160=(*sc_set0.UserUniforms).aperture;
l9_1159=l9_1160;
float l9_1161=0.0;
float l9_1162=(*sc_set0.UserUniforms).Port_Value_N041;
float l9_1163=l9_1162+0.001;
l9_1163-=0.001;
l9_1161=l9_1163;
float l9_1164=0.0;
l9_1164=(l9_1159*l9_1161)*(*sc_set0.UserUniforms).Port_Input2_N032;
float l9_1165=0.0;
l9_1165=l9_1157+l9_1164;
float l9_1166=0.0;
l9_1166=(l9_1159*l9_1161)*(*sc_set0.UserUniforms).Port_Input2_N033;
float l9_1167=0.0;
l9_1167=l9_1157+l9_1166;
float l9_1168=0.0;
l9_1168=(((l9_1156-l9_1165)/((l9_1167-l9_1165)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N035-(*sc_set0.UserUniforms).Port_RangeMinB_N035))+(*sc_set0.UserUniforms).Port_RangeMinB_N035;
float l9_1169=0.0;
l9_1169=abs(l9_1168);
float l9_1170=0.0;
l9_1170=l9_1169+(*sc_set0.UserUniforms).Port_Input1_N043;
float l9_1171=0.0;
l9_1171=l9_1064*l9_1170;
float l9_1172=0.0;
l9_1172=fast::clamp(l9_1171,(*sc_set0.UserUniforms).Port_Input1_N052,(*sc_set0.UserUniforms).Port_Input2_N052);
float l9_1173=0.0;
l9_1173=l9_1172;
float l9_1174=0.0;
l9_1174=exp2(l9_1173);
float l9_1175=0.0;
l9_1175=l9_1057.Loop_Index_ID0;
float2 l9_1176=float2(0.0);
float l9_1177=l9_1175;
float2 l9_1178=(*sc_set0.UserUniforms).Port_Item0_N016;
float2 l9_1179=(*sc_set0.UserUniforms).Port_Item1_N016;
float2 l9_1180=(*sc_set0.UserUniforms).Port_Item2_N016;
float2 l9_1181=(*sc_set0.UserUniforms).Port_Item3_N016;
float2 l9_1182=(*sc_set0.UserUniforms).Port_Item4_N016;
float2 l9_1183=(*sc_set0.UserUniforms).Port_Item5_N016;
float2 l9_1184=(*sc_set0.UserUniforms).Port_Item6_N016;
float2 l9_1185=(*sc_set0.UserUniforms).Port_Item7_N016;
float2 l9_1186[8];
l9_1186[0]=l9_1178;
l9_1186[1]=l9_1179;
l9_1186[2]=l9_1180;
l9_1186[3]=l9_1181;
l9_1186[4]=l9_1182;
l9_1186[5]=l9_1183;
l9_1186[6]=l9_1184;
l9_1186[7]=l9_1185;
int l9_1187=int(fast::clamp(l9_1177+9.9999997e-05,0.0,7.0));
float2 l9_1188=l9_1186[l9_1187];
l9_1176=l9_1188;
float2 l9_1189=float2(0.0);
l9_1189=(l9_1063*float2(l9_1174))*l9_1176;
float2 l9_1190=float2(0.0);
l9_1190=l9_1062+l9_1189;
float l9_1191=0.0;
l9_1191=l9_1173+(*sc_set0.UserUniforms).Port_Input1_N045;
float4 l9_1192=float4(0.0);
int l9_1193;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1194=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1194=0;
}
else
{
l9_1194=in.varStereoViewID;
}
int l9_1195=l9_1194;
l9_1193=1-l9_1195;
}
else
{
int l9_1196=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1196=0;
}
else
{
l9_1196=in.varStereoViewID;
}
int l9_1197=l9_1196;
l9_1193=l9_1197;
}
int l9_1198=l9_1193;
int l9_1199=screenTexLayout_tmp;
int l9_1200=l9_1198;
float2 l9_1201=l9_1190;
bool l9_1202=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1203=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1204=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1205=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1206=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1207=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1208=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1209=l9_1191;
bool l9_1210=l9_1207&&(!l9_1205);
float l9_1211=1.0;
float l9_1212=l9_1201.x;
int l9_1213=l9_1204.x;
if (l9_1213==1)
{
l9_1212=fract(l9_1212);
}
else
{
if (l9_1213==2)
{
float l9_1214=fract(l9_1212);
float l9_1215=l9_1212-l9_1214;
float l9_1216=step(0.25,fract(l9_1215*0.5));
l9_1212=mix(l9_1214,1.0-l9_1214,fast::clamp(l9_1216,0.0,1.0));
}
}
l9_1201.x=l9_1212;
float l9_1217=l9_1201.y;
int l9_1218=l9_1204.y;
if (l9_1218==1)
{
l9_1217=fract(l9_1217);
}
else
{
if (l9_1218==2)
{
float l9_1219=fract(l9_1217);
float l9_1220=l9_1217-l9_1219;
float l9_1221=step(0.25,fract(l9_1220*0.5));
l9_1217=mix(l9_1219,1.0-l9_1219,fast::clamp(l9_1221,0.0,1.0));
}
}
l9_1201.y=l9_1217;
if (l9_1205)
{
bool l9_1222=l9_1207;
bool l9_1223;
if (l9_1222)
{
l9_1223=l9_1204.x==3;
}
else
{
l9_1223=l9_1222;
}
float l9_1224=l9_1201.x;
float l9_1225=l9_1206.x;
float l9_1226=l9_1206.z;
bool l9_1227=l9_1223;
float l9_1228=l9_1211;
float l9_1229=fast::clamp(l9_1224,l9_1225,l9_1226);
float l9_1230=step(abs(l9_1224-l9_1229),9.9999997e-06);
l9_1228*=(l9_1230+((1.0-float(l9_1227))*(1.0-l9_1230)));
l9_1224=l9_1229;
l9_1201.x=l9_1224;
l9_1211=l9_1228;
bool l9_1231=l9_1207;
bool l9_1232;
if (l9_1231)
{
l9_1232=l9_1204.y==3;
}
else
{
l9_1232=l9_1231;
}
float l9_1233=l9_1201.y;
float l9_1234=l9_1206.y;
float l9_1235=l9_1206.w;
bool l9_1236=l9_1232;
float l9_1237=l9_1211;
float l9_1238=fast::clamp(l9_1233,l9_1234,l9_1235);
float l9_1239=step(abs(l9_1233-l9_1238),9.9999997e-06);
l9_1237*=(l9_1239+((1.0-float(l9_1236))*(1.0-l9_1239)));
l9_1233=l9_1238;
l9_1201.y=l9_1233;
l9_1211=l9_1237;
}
float2 l9_1240=l9_1201;
bool l9_1241=l9_1202;
float3x3 l9_1242=l9_1203;
if (l9_1241)
{
l9_1240=float2((l9_1242*float3(l9_1240,1.0)).xy);
}
float2 l9_1243=l9_1240;
l9_1201=l9_1243;
float l9_1244=l9_1201.x;
int l9_1245=l9_1204.x;
bool l9_1246=l9_1210;
float l9_1247=l9_1211;
if ((l9_1245==0)||(l9_1245==3))
{
float l9_1248=l9_1244;
float l9_1249=0.0;
float l9_1250=1.0;
bool l9_1251=l9_1246;
float l9_1252=l9_1247;
float l9_1253=fast::clamp(l9_1248,l9_1249,l9_1250);
float l9_1254=step(abs(l9_1248-l9_1253),9.9999997e-06);
l9_1252*=(l9_1254+((1.0-float(l9_1251))*(1.0-l9_1254)));
l9_1248=l9_1253;
l9_1244=l9_1248;
l9_1247=l9_1252;
}
l9_1201.x=l9_1244;
l9_1211=l9_1247;
float l9_1255=l9_1201.y;
int l9_1256=l9_1204.y;
bool l9_1257=l9_1210;
float l9_1258=l9_1211;
if ((l9_1256==0)||(l9_1256==3))
{
float l9_1259=l9_1255;
float l9_1260=0.0;
float l9_1261=1.0;
bool l9_1262=l9_1257;
float l9_1263=l9_1258;
float l9_1264=fast::clamp(l9_1259,l9_1260,l9_1261);
float l9_1265=step(abs(l9_1259-l9_1264),9.9999997e-06);
l9_1263*=(l9_1265+((1.0-float(l9_1262))*(1.0-l9_1265)));
l9_1259=l9_1264;
l9_1255=l9_1259;
l9_1258=l9_1263;
}
l9_1201.y=l9_1255;
l9_1211=l9_1258;
float2 l9_1266=l9_1201;
int l9_1267=l9_1199;
int l9_1268=l9_1200;
float l9_1269=l9_1209;
float2 l9_1270=l9_1266;
int l9_1271=l9_1267;
int l9_1272=l9_1268;
float3 l9_1273=float3(0.0);
if (l9_1271==0)
{
l9_1273=float3(l9_1270,0.0);
}
else
{
if (l9_1271==1)
{
l9_1273=float3(l9_1270.x,(l9_1270.y*0.5)+(0.5-(float(l9_1272)*0.5)),0.0);
}
else
{
l9_1273=float3(l9_1270,float(l9_1272));
}
}
float3 l9_1274=l9_1273;
float3 l9_1275=l9_1274;
float4 l9_1276=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1275.xy,level(l9_1269));
float4 l9_1277=l9_1276;
if (l9_1207)
{
l9_1277=mix(l9_1208,l9_1277,float4(l9_1211));
}
float4 l9_1278=l9_1277;
l9_1192=l9_1278;
l9_1058=l9_1192;
l9_1056+=l9_1058;
param_28=l9_1056;
float4 l9_1279=param_28;
ssGlobals l9_1280=param_29;
float4 l9_1281=float4(0.0);
l9_1280.Loop_Index_ID0=5.0;
l9_1280.Loop_Ratio_ID0=0.71428603;
float2 l9_1282=float2(0.0);
float2 l9_1283=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_1282=l9_1283;
float2 l9_1284=float2(0.0);
l9_1284=l9_1280.gScreenCoord;
float2 l9_1285=float2(0.0);
l9_1285=l9_1284;
float2 l9_1286=float2(0.0);
l9_1286=l9_1282;
float l9_1287=0.0;
float l9_1288=(*sc_set0.UserUniforms).blurIntensity;
l9_1287=l9_1288;
float4 l9_1289=float4(0.0);
int l9_1290;
if ((int(depthImageHasSwappedViews_tmp)!=0))
{
int l9_1291=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1291=0;
}
else
{
l9_1291=in.varStereoViewID;
}
int l9_1292=l9_1291;
l9_1290=1-l9_1292;
}
else
{
int l9_1293=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1293=0;
}
else
{
l9_1293=in.varStereoViewID;
}
int l9_1294=l9_1293;
l9_1290=l9_1294;
}
int l9_1295=l9_1290;
int l9_1296=depthImageLayout_tmp;
int l9_1297=l9_1295;
float2 l9_1298=l9_1284;
bool l9_1299=(int(SC_USE_UV_TRANSFORM_depthImage_tmp)!=0);
float3x3 l9_1300=(*sc_set0.UserUniforms).depthImageTransform;
int2 l9_1301=int2(SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp,SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp);
bool l9_1302=(int(SC_USE_UV_MIN_MAX_depthImage_tmp)!=0);
float4 l9_1303=(*sc_set0.UserUniforms).depthImageUvMinMax;
bool l9_1304=(int(SC_USE_CLAMP_TO_BORDER_depthImage_tmp)!=0);
float4 l9_1305=(*sc_set0.UserUniforms).depthImageBorderColor;
float l9_1306=0.0;
bool l9_1307=l9_1304&&(!l9_1302);
float l9_1308=1.0;
float l9_1309=l9_1298.x;
int l9_1310=l9_1301.x;
if (l9_1310==1)
{
l9_1309=fract(l9_1309);
}
else
{
if (l9_1310==2)
{
float l9_1311=fract(l9_1309);
float l9_1312=l9_1309-l9_1311;
float l9_1313=step(0.25,fract(l9_1312*0.5));
l9_1309=mix(l9_1311,1.0-l9_1311,fast::clamp(l9_1313,0.0,1.0));
}
}
l9_1298.x=l9_1309;
float l9_1314=l9_1298.y;
int l9_1315=l9_1301.y;
if (l9_1315==1)
{
l9_1314=fract(l9_1314);
}
else
{
if (l9_1315==2)
{
float l9_1316=fract(l9_1314);
float l9_1317=l9_1314-l9_1316;
float l9_1318=step(0.25,fract(l9_1317*0.5));
l9_1314=mix(l9_1316,1.0-l9_1316,fast::clamp(l9_1318,0.0,1.0));
}
}
l9_1298.y=l9_1314;
if (l9_1302)
{
bool l9_1319=l9_1304;
bool l9_1320;
if (l9_1319)
{
l9_1320=l9_1301.x==3;
}
else
{
l9_1320=l9_1319;
}
float l9_1321=l9_1298.x;
float l9_1322=l9_1303.x;
float l9_1323=l9_1303.z;
bool l9_1324=l9_1320;
float l9_1325=l9_1308;
float l9_1326=fast::clamp(l9_1321,l9_1322,l9_1323);
float l9_1327=step(abs(l9_1321-l9_1326),9.9999997e-06);
l9_1325*=(l9_1327+((1.0-float(l9_1324))*(1.0-l9_1327)));
l9_1321=l9_1326;
l9_1298.x=l9_1321;
l9_1308=l9_1325;
bool l9_1328=l9_1304;
bool l9_1329;
if (l9_1328)
{
l9_1329=l9_1301.y==3;
}
else
{
l9_1329=l9_1328;
}
float l9_1330=l9_1298.y;
float l9_1331=l9_1303.y;
float l9_1332=l9_1303.w;
bool l9_1333=l9_1329;
float l9_1334=l9_1308;
float l9_1335=fast::clamp(l9_1330,l9_1331,l9_1332);
float l9_1336=step(abs(l9_1330-l9_1335),9.9999997e-06);
l9_1334*=(l9_1336+((1.0-float(l9_1333))*(1.0-l9_1336)));
l9_1330=l9_1335;
l9_1298.y=l9_1330;
l9_1308=l9_1334;
}
float2 l9_1337=l9_1298;
bool l9_1338=l9_1299;
float3x3 l9_1339=l9_1300;
if (l9_1338)
{
l9_1337=float2((l9_1339*float3(l9_1337,1.0)).xy);
}
float2 l9_1340=l9_1337;
l9_1298=l9_1340;
float l9_1341=l9_1298.x;
int l9_1342=l9_1301.x;
bool l9_1343=l9_1307;
float l9_1344=l9_1308;
if ((l9_1342==0)||(l9_1342==3))
{
float l9_1345=l9_1341;
float l9_1346=0.0;
float l9_1347=1.0;
bool l9_1348=l9_1343;
float l9_1349=l9_1344;
float l9_1350=fast::clamp(l9_1345,l9_1346,l9_1347);
float l9_1351=step(abs(l9_1345-l9_1350),9.9999997e-06);
l9_1349*=(l9_1351+((1.0-float(l9_1348))*(1.0-l9_1351)));
l9_1345=l9_1350;
l9_1341=l9_1345;
l9_1344=l9_1349;
}
l9_1298.x=l9_1341;
l9_1308=l9_1344;
float l9_1352=l9_1298.y;
int l9_1353=l9_1301.y;
bool l9_1354=l9_1307;
float l9_1355=l9_1308;
if ((l9_1353==0)||(l9_1353==3))
{
float l9_1356=l9_1352;
float l9_1357=0.0;
float l9_1358=1.0;
bool l9_1359=l9_1354;
float l9_1360=l9_1355;
float l9_1361=fast::clamp(l9_1356,l9_1357,l9_1358);
float l9_1362=step(abs(l9_1356-l9_1361),9.9999997e-06);
l9_1360*=(l9_1362+((1.0-float(l9_1359))*(1.0-l9_1362)));
l9_1356=l9_1361;
l9_1352=l9_1356;
l9_1355=l9_1360;
}
l9_1298.y=l9_1352;
l9_1308=l9_1355;
float2 l9_1363=l9_1298;
int l9_1364=l9_1296;
int l9_1365=l9_1297;
float l9_1366=l9_1306;
float2 l9_1367=l9_1363;
int l9_1368=l9_1364;
int l9_1369=l9_1365;
float3 l9_1370=float3(0.0);
if (l9_1368==0)
{
l9_1370=float3(l9_1367,0.0);
}
else
{
if (l9_1368==1)
{
l9_1370=float3(l9_1367.x,(l9_1367.y*0.5)+(0.5-(float(l9_1369)*0.5)),0.0);
}
else
{
l9_1370=float3(l9_1367,float(l9_1369));
}
}
float3 l9_1371=l9_1370;
float3 l9_1372=l9_1371;
float4 l9_1373=sc_set0.depthImage.sample(sc_set0.depthImageSmpSC,l9_1372.xy,bias(l9_1366));
float4 l9_1374=l9_1373;
if (l9_1304)
{
l9_1374=mix(l9_1305,l9_1374,float4(l9_1308));
}
float4 l9_1375=l9_1374;
l9_1289=l9_1375;
float l9_1376=0.0;
l9_1376=l9_1289.x;
float l9_1377=0.0;
float l9_1378=(*sc_set0.UserUniforms).fallbacktexMult;
l9_1377=l9_1378;
float l9_1379=0.0;
l9_1379=l9_1376*l9_1377;
float l9_1380=0.0;
float l9_1381=(*sc_set0.UserUniforms).focusDistance;
l9_1380=l9_1381;
float l9_1382=0.0;
float l9_1383=(*sc_set0.UserUniforms).aperture;
l9_1382=l9_1383;
float l9_1384=0.0;
float l9_1385=(*sc_set0.UserUniforms).Port_Value_N041;
float l9_1386=l9_1385+0.001;
l9_1386-=0.001;
l9_1384=l9_1386;
float l9_1387=0.0;
l9_1387=(l9_1382*l9_1384)*(*sc_set0.UserUniforms).Port_Input2_N032;
float l9_1388=0.0;
l9_1388=l9_1380+l9_1387;
float l9_1389=0.0;
l9_1389=(l9_1382*l9_1384)*(*sc_set0.UserUniforms).Port_Input2_N033;
float l9_1390=0.0;
l9_1390=l9_1380+l9_1389;
float l9_1391=0.0;
l9_1391=(((l9_1379-l9_1388)/((l9_1390-l9_1388)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N035-(*sc_set0.UserUniforms).Port_RangeMinB_N035))+(*sc_set0.UserUniforms).Port_RangeMinB_N035;
float l9_1392=0.0;
l9_1392=abs(l9_1391);
float l9_1393=0.0;
l9_1393=l9_1392+(*sc_set0.UserUniforms).Port_Input1_N043;
float l9_1394=0.0;
l9_1394=l9_1287*l9_1393;
float l9_1395=0.0;
l9_1395=fast::clamp(l9_1394,(*sc_set0.UserUniforms).Port_Input1_N052,(*sc_set0.UserUniforms).Port_Input2_N052);
float l9_1396=0.0;
l9_1396=l9_1395;
float l9_1397=0.0;
l9_1397=exp2(l9_1396);
float l9_1398=0.0;
l9_1398=l9_1280.Loop_Index_ID0;
float2 l9_1399=float2(0.0);
float l9_1400=l9_1398;
float2 l9_1401=(*sc_set0.UserUniforms).Port_Item0_N016;
float2 l9_1402=(*sc_set0.UserUniforms).Port_Item1_N016;
float2 l9_1403=(*sc_set0.UserUniforms).Port_Item2_N016;
float2 l9_1404=(*sc_set0.UserUniforms).Port_Item3_N016;
float2 l9_1405=(*sc_set0.UserUniforms).Port_Item4_N016;
float2 l9_1406=(*sc_set0.UserUniforms).Port_Item5_N016;
float2 l9_1407=(*sc_set0.UserUniforms).Port_Item6_N016;
float2 l9_1408=(*sc_set0.UserUniforms).Port_Item7_N016;
float2 l9_1409[8];
l9_1409[0]=l9_1401;
l9_1409[1]=l9_1402;
l9_1409[2]=l9_1403;
l9_1409[3]=l9_1404;
l9_1409[4]=l9_1405;
l9_1409[5]=l9_1406;
l9_1409[6]=l9_1407;
l9_1409[7]=l9_1408;
int l9_1410=int(fast::clamp(l9_1400+9.9999997e-05,0.0,7.0));
float2 l9_1411=l9_1409[l9_1410];
l9_1399=l9_1411;
float2 l9_1412=float2(0.0);
l9_1412=(l9_1286*float2(l9_1397))*l9_1399;
float2 l9_1413=float2(0.0);
l9_1413=l9_1285+l9_1412;
float l9_1414=0.0;
l9_1414=l9_1396+(*sc_set0.UserUniforms).Port_Input1_N045;
float4 l9_1415=float4(0.0);
int l9_1416;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1417=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1417=0;
}
else
{
l9_1417=in.varStereoViewID;
}
int l9_1418=l9_1417;
l9_1416=1-l9_1418;
}
else
{
int l9_1419=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1419=0;
}
else
{
l9_1419=in.varStereoViewID;
}
int l9_1420=l9_1419;
l9_1416=l9_1420;
}
int l9_1421=l9_1416;
int l9_1422=screenTexLayout_tmp;
int l9_1423=l9_1421;
float2 l9_1424=l9_1413;
bool l9_1425=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1426=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1427=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1428=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1429=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1430=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1431=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1432=l9_1414;
bool l9_1433=l9_1430&&(!l9_1428);
float l9_1434=1.0;
float l9_1435=l9_1424.x;
int l9_1436=l9_1427.x;
if (l9_1436==1)
{
l9_1435=fract(l9_1435);
}
else
{
if (l9_1436==2)
{
float l9_1437=fract(l9_1435);
float l9_1438=l9_1435-l9_1437;
float l9_1439=step(0.25,fract(l9_1438*0.5));
l9_1435=mix(l9_1437,1.0-l9_1437,fast::clamp(l9_1439,0.0,1.0));
}
}
l9_1424.x=l9_1435;
float l9_1440=l9_1424.y;
int l9_1441=l9_1427.y;
if (l9_1441==1)
{
l9_1440=fract(l9_1440);
}
else
{
if (l9_1441==2)
{
float l9_1442=fract(l9_1440);
float l9_1443=l9_1440-l9_1442;
float l9_1444=step(0.25,fract(l9_1443*0.5));
l9_1440=mix(l9_1442,1.0-l9_1442,fast::clamp(l9_1444,0.0,1.0));
}
}
l9_1424.y=l9_1440;
if (l9_1428)
{
bool l9_1445=l9_1430;
bool l9_1446;
if (l9_1445)
{
l9_1446=l9_1427.x==3;
}
else
{
l9_1446=l9_1445;
}
float l9_1447=l9_1424.x;
float l9_1448=l9_1429.x;
float l9_1449=l9_1429.z;
bool l9_1450=l9_1446;
float l9_1451=l9_1434;
float l9_1452=fast::clamp(l9_1447,l9_1448,l9_1449);
float l9_1453=step(abs(l9_1447-l9_1452),9.9999997e-06);
l9_1451*=(l9_1453+((1.0-float(l9_1450))*(1.0-l9_1453)));
l9_1447=l9_1452;
l9_1424.x=l9_1447;
l9_1434=l9_1451;
bool l9_1454=l9_1430;
bool l9_1455;
if (l9_1454)
{
l9_1455=l9_1427.y==3;
}
else
{
l9_1455=l9_1454;
}
float l9_1456=l9_1424.y;
float l9_1457=l9_1429.y;
float l9_1458=l9_1429.w;
bool l9_1459=l9_1455;
float l9_1460=l9_1434;
float l9_1461=fast::clamp(l9_1456,l9_1457,l9_1458);
float l9_1462=step(abs(l9_1456-l9_1461),9.9999997e-06);
l9_1460*=(l9_1462+((1.0-float(l9_1459))*(1.0-l9_1462)));
l9_1456=l9_1461;
l9_1424.y=l9_1456;
l9_1434=l9_1460;
}
float2 l9_1463=l9_1424;
bool l9_1464=l9_1425;
float3x3 l9_1465=l9_1426;
if (l9_1464)
{
l9_1463=float2((l9_1465*float3(l9_1463,1.0)).xy);
}
float2 l9_1466=l9_1463;
l9_1424=l9_1466;
float l9_1467=l9_1424.x;
int l9_1468=l9_1427.x;
bool l9_1469=l9_1433;
float l9_1470=l9_1434;
if ((l9_1468==0)||(l9_1468==3))
{
float l9_1471=l9_1467;
float l9_1472=0.0;
float l9_1473=1.0;
bool l9_1474=l9_1469;
float l9_1475=l9_1470;
float l9_1476=fast::clamp(l9_1471,l9_1472,l9_1473);
float l9_1477=step(abs(l9_1471-l9_1476),9.9999997e-06);
l9_1475*=(l9_1477+((1.0-float(l9_1474))*(1.0-l9_1477)));
l9_1471=l9_1476;
l9_1467=l9_1471;
l9_1470=l9_1475;
}
l9_1424.x=l9_1467;
l9_1434=l9_1470;
float l9_1478=l9_1424.y;
int l9_1479=l9_1427.y;
bool l9_1480=l9_1433;
float l9_1481=l9_1434;
if ((l9_1479==0)||(l9_1479==3))
{
float l9_1482=l9_1478;
float l9_1483=0.0;
float l9_1484=1.0;
bool l9_1485=l9_1480;
float l9_1486=l9_1481;
float l9_1487=fast::clamp(l9_1482,l9_1483,l9_1484);
float l9_1488=step(abs(l9_1482-l9_1487),9.9999997e-06);
l9_1486*=(l9_1488+((1.0-float(l9_1485))*(1.0-l9_1488)));
l9_1482=l9_1487;
l9_1478=l9_1482;
l9_1481=l9_1486;
}
l9_1424.y=l9_1478;
l9_1434=l9_1481;
float2 l9_1489=l9_1424;
int l9_1490=l9_1422;
int l9_1491=l9_1423;
float l9_1492=l9_1432;
float2 l9_1493=l9_1489;
int l9_1494=l9_1490;
int l9_1495=l9_1491;
float3 l9_1496=float3(0.0);
if (l9_1494==0)
{
l9_1496=float3(l9_1493,0.0);
}
else
{
if (l9_1494==1)
{
l9_1496=float3(l9_1493.x,(l9_1493.y*0.5)+(0.5-(float(l9_1495)*0.5)),0.0);
}
else
{
l9_1496=float3(l9_1493,float(l9_1495));
}
}
float3 l9_1497=l9_1496;
float3 l9_1498=l9_1497;
float4 l9_1499=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1498.xy,level(l9_1492));
float4 l9_1500=l9_1499;
if (l9_1430)
{
l9_1500=mix(l9_1431,l9_1500,float4(l9_1434));
}
float4 l9_1501=l9_1500;
l9_1415=l9_1501;
l9_1281=l9_1415;
l9_1279+=l9_1281;
param_28=l9_1279;
float4 l9_1502=param_28;
ssGlobals l9_1503=param_29;
float4 l9_1504=float4(0.0);
l9_1503.Loop_Index_ID0=6.0;
l9_1503.Loop_Ratio_ID0=0.85714298;
float2 l9_1505=float2(0.0);
float2 l9_1506=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_1505=l9_1506;
float2 l9_1507=float2(0.0);
l9_1507=l9_1503.gScreenCoord;
float2 l9_1508=float2(0.0);
l9_1508=l9_1507;
float2 l9_1509=float2(0.0);
l9_1509=l9_1505;
float l9_1510=0.0;
float l9_1511=(*sc_set0.UserUniforms).blurIntensity;
l9_1510=l9_1511;
float4 l9_1512=float4(0.0);
int l9_1513;
if ((int(depthImageHasSwappedViews_tmp)!=0))
{
int l9_1514=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1514=0;
}
else
{
l9_1514=in.varStereoViewID;
}
int l9_1515=l9_1514;
l9_1513=1-l9_1515;
}
else
{
int l9_1516=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1516=0;
}
else
{
l9_1516=in.varStereoViewID;
}
int l9_1517=l9_1516;
l9_1513=l9_1517;
}
int l9_1518=l9_1513;
int l9_1519=depthImageLayout_tmp;
int l9_1520=l9_1518;
float2 l9_1521=l9_1507;
bool l9_1522=(int(SC_USE_UV_TRANSFORM_depthImage_tmp)!=0);
float3x3 l9_1523=(*sc_set0.UserUniforms).depthImageTransform;
int2 l9_1524=int2(SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp,SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp);
bool l9_1525=(int(SC_USE_UV_MIN_MAX_depthImage_tmp)!=0);
float4 l9_1526=(*sc_set0.UserUniforms).depthImageUvMinMax;
bool l9_1527=(int(SC_USE_CLAMP_TO_BORDER_depthImage_tmp)!=0);
float4 l9_1528=(*sc_set0.UserUniforms).depthImageBorderColor;
float l9_1529=0.0;
bool l9_1530=l9_1527&&(!l9_1525);
float l9_1531=1.0;
float l9_1532=l9_1521.x;
int l9_1533=l9_1524.x;
if (l9_1533==1)
{
l9_1532=fract(l9_1532);
}
else
{
if (l9_1533==2)
{
float l9_1534=fract(l9_1532);
float l9_1535=l9_1532-l9_1534;
float l9_1536=step(0.25,fract(l9_1535*0.5));
l9_1532=mix(l9_1534,1.0-l9_1534,fast::clamp(l9_1536,0.0,1.0));
}
}
l9_1521.x=l9_1532;
float l9_1537=l9_1521.y;
int l9_1538=l9_1524.y;
if (l9_1538==1)
{
l9_1537=fract(l9_1537);
}
else
{
if (l9_1538==2)
{
float l9_1539=fract(l9_1537);
float l9_1540=l9_1537-l9_1539;
float l9_1541=step(0.25,fract(l9_1540*0.5));
l9_1537=mix(l9_1539,1.0-l9_1539,fast::clamp(l9_1541,0.0,1.0));
}
}
l9_1521.y=l9_1537;
if (l9_1525)
{
bool l9_1542=l9_1527;
bool l9_1543;
if (l9_1542)
{
l9_1543=l9_1524.x==3;
}
else
{
l9_1543=l9_1542;
}
float l9_1544=l9_1521.x;
float l9_1545=l9_1526.x;
float l9_1546=l9_1526.z;
bool l9_1547=l9_1543;
float l9_1548=l9_1531;
float l9_1549=fast::clamp(l9_1544,l9_1545,l9_1546);
float l9_1550=step(abs(l9_1544-l9_1549),9.9999997e-06);
l9_1548*=(l9_1550+((1.0-float(l9_1547))*(1.0-l9_1550)));
l9_1544=l9_1549;
l9_1521.x=l9_1544;
l9_1531=l9_1548;
bool l9_1551=l9_1527;
bool l9_1552;
if (l9_1551)
{
l9_1552=l9_1524.y==3;
}
else
{
l9_1552=l9_1551;
}
float l9_1553=l9_1521.y;
float l9_1554=l9_1526.y;
float l9_1555=l9_1526.w;
bool l9_1556=l9_1552;
float l9_1557=l9_1531;
float l9_1558=fast::clamp(l9_1553,l9_1554,l9_1555);
float l9_1559=step(abs(l9_1553-l9_1558),9.9999997e-06);
l9_1557*=(l9_1559+((1.0-float(l9_1556))*(1.0-l9_1559)));
l9_1553=l9_1558;
l9_1521.y=l9_1553;
l9_1531=l9_1557;
}
float2 l9_1560=l9_1521;
bool l9_1561=l9_1522;
float3x3 l9_1562=l9_1523;
if (l9_1561)
{
l9_1560=float2((l9_1562*float3(l9_1560,1.0)).xy);
}
float2 l9_1563=l9_1560;
l9_1521=l9_1563;
float l9_1564=l9_1521.x;
int l9_1565=l9_1524.x;
bool l9_1566=l9_1530;
float l9_1567=l9_1531;
if ((l9_1565==0)||(l9_1565==3))
{
float l9_1568=l9_1564;
float l9_1569=0.0;
float l9_1570=1.0;
bool l9_1571=l9_1566;
float l9_1572=l9_1567;
float l9_1573=fast::clamp(l9_1568,l9_1569,l9_1570);
float l9_1574=step(abs(l9_1568-l9_1573),9.9999997e-06);
l9_1572*=(l9_1574+((1.0-float(l9_1571))*(1.0-l9_1574)));
l9_1568=l9_1573;
l9_1564=l9_1568;
l9_1567=l9_1572;
}
l9_1521.x=l9_1564;
l9_1531=l9_1567;
float l9_1575=l9_1521.y;
int l9_1576=l9_1524.y;
bool l9_1577=l9_1530;
float l9_1578=l9_1531;
if ((l9_1576==0)||(l9_1576==3))
{
float l9_1579=l9_1575;
float l9_1580=0.0;
float l9_1581=1.0;
bool l9_1582=l9_1577;
float l9_1583=l9_1578;
float l9_1584=fast::clamp(l9_1579,l9_1580,l9_1581);
float l9_1585=step(abs(l9_1579-l9_1584),9.9999997e-06);
l9_1583*=(l9_1585+((1.0-float(l9_1582))*(1.0-l9_1585)));
l9_1579=l9_1584;
l9_1575=l9_1579;
l9_1578=l9_1583;
}
l9_1521.y=l9_1575;
l9_1531=l9_1578;
float2 l9_1586=l9_1521;
int l9_1587=l9_1519;
int l9_1588=l9_1520;
float l9_1589=l9_1529;
float2 l9_1590=l9_1586;
int l9_1591=l9_1587;
int l9_1592=l9_1588;
float3 l9_1593=float3(0.0);
if (l9_1591==0)
{
l9_1593=float3(l9_1590,0.0);
}
else
{
if (l9_1591==1)
{
l9_1593=float3(l9_1590.x,(l9_1590.y*0.5)+(0.5-(float(l9_1592)*0.5)),0.0);
}
else
{
l9_1593=float3(l9_1590,float(l9_1592));
}
}
float3 l9_1594=l9_1593;
float3 l9_1595=l9_1594;
float4 l9_1596=sc_set0.depthImage.sample(sc_set0.depthImageSmpSC,l9_1595.xy,bias(l9_1589));
float4 l9_1597=l9_1596;
if (l9_1527)
{
l9_1597=mix(l9_1528,l9_1597,float4(l9_1531));
}
float4 l9_1598=l9_1597;
l9_1512=l9_1598;
float l9_1599=0.0;
l9_1599=l9_1512.x;
float l9_1600=0.0;
float l9_1601=(*sc_set0.UserUniforms).fallbacktexMult;
l9_1600=l9_1601;
float l9_1602=0.0;
l9_1602=l9_1599*l9_1600;
float l9_1603=0.0;
float l9_1604=(*sc_set0.UserUniforms).focusDistance;
l9_1603=l9_1604;
float l9_1605=0.0;
float l9_1606=(*sc_set0.UserUniforms).aperture;
l9_1605=l9_1606;
float l9_1607=0.0;
float l9_1608=(*sc_set0.UserUniforms).Port_Value_N041;
float l9_1609=l9_1608+0.001;
l9_1609-=0.001;
l9_1607=l9_1609;
float l9_1610=0.0;
l9_1610=(l9_1605*l9_1607)*(*sc_set0.UserUniforms).Port_Input2_N032;
float l9_1611=0.0;
l9_1611=l9_1603+l9_1610;
float l9_1612=0.0;
l9_1612=(l9_1605*l9_1607)*(*sc_set0.UserUniforms).Port_Input2_N033;
float l9_1613=0.0;
l9_1613=l9_1603+l9_1612;
float l9_1614=0.0;
l9_1614=(((l9_1602-l9_1611)/((l9_1613-l9_1611)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N035-(*sc_set0.UserUniforms).Port_RangeMinB_N035))+(*sc_set0.UserUniforms).Port_RangeMinB_N035;
float l9_1615=0.0;
l9_1615=abs(l9_1614);
float l9_1616=0.0;
l9_1616=l9_1615+(*sc_set0.UserUniforms).Port_Input1_N043;
float l9_1617=0.0;
l9_1617=l9_1510*l9_1616;
float l9_1618=0.0;
l9_1618=fast::clamp(l9_1617,(*sc_set0.UserUniforms).Port_Input1_N052,(*sc_set0.UserUniforms).Port_Input2_N052);
float l9_1619=0.0;
l9_1619=l9_1618;
float l9_1620=0.0;
l9_1620=exp2(l9_1619);
float l9_1621=0.0;
l9_1621=l9_1503.Loop_Index_ID0;
float2 l9_1622=float2(0.0);
float l9_1623=l9_1621;
float2 l9_1624=(*sc_set0.UserUniforms).Port_Item0_N016;
float2 l9_1625=(*sc_set0.UserUniforms).Port_Item1_N016;
float2 l9_1626=(*sc_set0.UserUniforms).Port_Item2_N016;
float2 l9_1627=(*sc_set0.UserUniforms).Port_Item3_N016;
float2 l9_1628=(*sc_set0.UserUniforms).Port_Item4_N016;
float2 l9_1629=(*sc_set0.UserUniforms).Port_Item5_N016;
float2 l9_1630=(*sc_set0.UserUniforms).Port_Item6_N016;
float2 l9_1631=(*sc_set0.UserUniforms).Port_Item7_N016;
float2 l9_1632[8];
l9_1632[0]=l9_1624;
l9_1632[1]=l9_1625;
l9_1632[2]=l9_1626;
l9_1632[3]=l9_1627;
l9_1632[4]=l9_1628;
l9_1632[5]=l9_1629;
l9_1632[6]=l9_1630;
l9_1632[7]=l9_1631;
int l9_1633=int(fast::clamp(l9_1623+9.9999997e-05,0.0,7.0));
float2 l9_1634=l9_1632[l9_1633];
l9_1622=l9_1634;
float2 l9_1635=float2(0.0);
l9_1635=(l9_1509*float2(l9_1620))*l9_1622;
float2 l9_1636=float2(0.0);
l9_1636=l9_1508+l9_1635;
float l9_1637=0.0;
l9_1637=l9_1619+(*sc_set0.UserUniforms).Port_Input1_N045;
float4 l9_1638=float4(0.0);
int l9_1639;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1640=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1640=0;
}
else
{
l9_1640=in.varStereoViewID;
}
int l9_1641=l9_1640;
l9_1639=1-l9_1641;
}
else
{
int l9_1642=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1642=0;
}
else
{
l9_1642=in.varStereoViewID;
}
int l9_1643=l9_1642;
l9_1639=l9_1643;
}
int l9_1644=l9_1639;
int l9_1645=screenTexLayout_tmp;
int l9_1646=l9_1644;
float2 l9_1647=l9_1636;
bool l9_1648=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1649=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1650=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1651=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1652=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1653=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1654=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1655=l9_1637;
bool l9_1656=l9_1653&&(!l9_1651);
float l9_1657=1.0;
float l9_1658=l9_1647.x;
int l9_1659=l9_1650.x;
if (l9_1659==1)
{
l9_1658=fract(l9_1658);
}
else
{
if (l9_1659==2)
{
float l9_1660=fract(l9_1658);
float l9_1661=l9_1658-l9_1660;
float l9_1662=step(0.25,fract(l9_1661*0.5));
l9_1658=mix(l9_1660,1.0-l9_1660,fast::clamp(l9_1662,0.0,1.0));
}
}
l9_1647.x=l9_1658;
float l9_1663=l9_1647.y;
int l9_1664=l9_1650.y;
if (l9_1664==1)
{
l9_1663=fract(l9_1663);
}
else
{
if (l9_1664==2)
{
float l9_1665=fract(l9_1663);
float l9_1666=l9_1663-l9_1665;
float l9_1667=step(0.25,fract(l9_1666*0.5));
l9_1663=mix(l9_1665,1.0-l9_1665,fast::clamp(l9_1667,0.0,1.0));
}
}
l9_1647.y=l9_1663;
if (l9_1651)
{
bool l9_1668=l9_1653;
bool l9_1669;
if (l9_1668)
{
l9_1669=l9_1650.x==3;
}
else
{
l9_1669=l9_1668;
}
float l9_1670=l9_1647.x;
float l9_1671=l9_1652.x;
float l9_1672=l9_1652.z;
bool l9_1673=l9_1669;
float l9_1674=l9_1657;
float l9_1675=fast::clamp(l9_1670,l9_1671,l9_1672);
float l9_1676=step(abs(l9_1670-l9_1675),9.9999997e-06);
l9_1674*=(l9_1676+((1.0-float(l9_1673))*(1.0-l9_1676)));
l9_1670=l9_1675;
l9_1647.x=l9_1670;
l9_1657=l9_1674;
bool l9_1677=l9_1653;
bool l9_1678;
if (l9_1677)
{
l9_1678=l9_1650.y==3;
}
else
{
l9_1678=l9_1677;
}
float l9_1679=l9_1647.y;
float l9_1680=l9_1652.y;
float l9_1681=l9_1652.w;
bool l9_1682=l9_1678;
float l9_1683=l9_1657;
float l9_1684=fast::clamp(l9_1679,l9_1680,l9_1681);
float l9_1685=step(abs(l9_1679-l9_1684),9.9999997e-06);
l9_1683*=(l9_1685+((1.0-float(l9_1682))*(1.0-l9_1685)));
l9_1679=l9_1684;
l9_1647.y=l9_1679;
l9_1657=l9_1683;
}
float2 l9_1686=l9_1647;
bool l9_1687=l9_1648;
float3x3 l9_1688=l9_1649;
if (l9_1687)
{
l9_1686=float2((l9_1688*float3(l9_1686,1.0)).xy);
}
float2 l9_1689=l9_1686;
l9_1647=l9_1689;
float l9_1690=l9_1647.x;
int l9_1691=l9_1650.x;
bool l9_1692=l9_1656;
float l9_1693=l9_1657;
if ((l9_1691==0)||(l9_1691==3))
{
float l9_1694=l9_1690;
float l9_1695=0.0;
float l9_1696=1.0;
bool l9_1697=l9_1692;
float l9_1698=l9_1693;
float l9_1699=fast::clamp(l9_1694,l9_1695,l9_1696);
float l9_1700=step(abs(l9_1694-l9_1699),9.9999997e-06);
l9_1698*=(l9_1700+((1.0-float(l9_1697))*(1.0-l9_1700)));
l9_1694=l9_1699;
l9_1690=l9_1694;
l9_1693=l9_1698;
}
l9_1647.x=l9_1690;
l9_1657=l9_1693;
float l9_1701=l9_1647.y;
int l9_1702=l9_1650.y;
bool l9_1703=l9_1656;
float l9_1704=l9_1657;
if ((l9_1702==0)||(l9_1702==3))
{
float l9_1705=l9_1701;
float l9_1706=0.0;
float l9_1707=1.0;
bool l9_1708=l9_1703;
float l9_1709=l9_1704;
float l9_1710=fast::clamp(l9_1705,l9_1706,l9_1707);
float l9_1711=step(abs(l9_1705-l9_1710),9.9999997e-06);
l9_1709*=(l9_1711+((1.0-float(l9_1708))*(1.0-l9_1711)));
l9_1705=l9_1710;
l9_1701=l9_1705;
l9_1704=l9_1709;
}
l9_1647.y=l9_1701;
l9_1657=l9_1704;
float2 l9_1712=l9_1647;
int l9_1713=l9_1645;
int l9_1714=l9_1646;
float l9_1715=l9_1655;
float2 l9_1716=l9_1712;
int l9_1717=l9_1713;
int l9_1718=l9_1714;
float3 l9_1719=float3(0.0);
if (l9_1717==0)
{
l9_1719=float3(l9_1716,0.0);
}
else
{
if (l9_1717==1)
{
l9_1719=float3(l9_1716.x,(l9_1716.y*0.5)+(0.5-(float(l9_1718)*0.5)),0.0);
}
else
{
l9_1719=float3(l9_1716,float(l9_1718));
}
}
float3 l9_1720=l9_1719;
float3 l9_1721=l9_1720;
float4 l9_1722=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1721.xy,level(l9_1715));
float4 l9_1723=l9_1722;
if (l9_1653)
{
l9_1723=mix(l9_1654,l9_1723,float4(l9_1657));
}
float4 l9_1724=l9_1723;
l9_1638=l9_1724;
l9_1504=l9_1638;
l9_1502+=l9_1504;
param_28=l9_1502;
float4 l9_1725=param_28;
ssGlobals l9_1726=param_29;
float4 l9_1727=float4(0.0);
l9_1726.Loop_Index_ID0=7.0;
l9_1726.Loop_Ratio_ID0=1.0;
float2 l9_1728=float2(0.0);
float2 l9_1729=(*sc_set0.UserUniforms).screenTexSize.zw;
l9_1728=l9_1729;
float2 l9_1730=float2(0.0);
l9_1730=l9_1726.gScreenCoord;
float2 l9_1731=float2(0.0);
l9_1731=l9_1730;
float2 l9_1732=float2(0.0);
l9_1732=l9_1728;
float l9_1733=0.0;
float l9_1734=(*sc_set0.UserUniforms).blurIntensity;
l9_1733=l9_1734;
float4 l9_1735=float4(0.0);
int l9_1736;
if ((int(depthImageHasSwappedViews_tmp)!=0))
{
int l9_1737=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1737=0;
}
else
{
l9_1737=in.varStereoViewID;
}
int l9_1738=l9_1737;
l9_1736=1-l9_1738;
}
else
{
int l9_1739=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1739=0;
}
else
{
l9_1739=in.varStereoViewID;
}
int l9_1740=l9_1739;
l9_1736=l9_1740;
}
int l9_1741=l9_1736;
int l9_1742=depthImageLayout_tmp;
int l9_1743=l9_1741;
float2 l9_1744=l9_1730;
bool l9_1745=(int(SC_USE_UV_TRANSFORM_depthImage_tmp)!=0);
float3x3 l9_1746=(*sc_set0.UserUniforms).depthImageTransform;
int2 l9_1747=int2(SC_SOFTWARE_WRAP_MODE_U_depthImage_tmp,SC_SOFTWARE_WRAP_MODE_V_depthImage_tmp);
bool l9_1748=(int(SC_USE_UV_MIN_MAX_depthImage_tmp)!=0);
float4 l9_1749=(*sc_set0.UserUniforms).depthImageUvMinMax;
bool l9_1750=(int(SC_USE_CLAMP_TO_BORDER_depthImage_tmp)!=0);
float4 l9_1751=(*sc_set0.UserUniforms).depthImageBorderColor;
float l9_1752=0.0;
bool l9_1753=l9_1750&&(!l9_1748);
float l9_1754=1.0;
float l9_1755=l9_1744.x;
int l9_1756=l9_1747.x;
if (l9_1756==1)
{
l9_1755=fract(l9_1755);
}
else
{
if (l9_1756==2)
{
float l9_1757=fract(l9_1755);
float l9_1758=l9_1755-l9_1757;
float l9_1759=step(0.25,fract(l9_1758*0.5));
l9_1755=mix(l9_1757,1.0-l9_1757,fast::clamp(l9_1759,0.0,1.0));
}
}
l9_1744.x=l9_1755;
float l9_1760=l9_1744.y;
int l9_1761=l9_1747.y;
if (l9_1761==1)
{
l9_1760=fract(l9_1760);
}
else
{
if (l9_1761==2)
{
float l9_1762=fract(l9_1760);
float l9_1763=l9_1760-l9_1762;
float l9_1764=step(0.25,fract(l9_1763*0.5));
l9_1760=mix(l9_1762,1.0-l9_1762,fast::clamp(l9_1764,0.0,1.0));
}
}
l9_1744.y=l9_1760;
if (l9_1748)
{
bool l9_1765=l9_1750;
bool l9_1766;
if (l9_1765)
{
l9_1766=l9_1747.x==3;
}
else
{
l9_1766=l9_1765;
}
float l9_1767=l9_1744.x;
float l9_1768=l9_1749.x;
float l9_1769=l9_1749.z;
bool l9_1770=l9_1766;
float l9_1771=l9_1754;
float l9_1772=fast::clamp(l9_1767,l9_1768,l9_1769);
float l9_1773=step(abs(l9_1767-l9_1772),9.9999997e-06);
l9_1771*=(l9_1773+((1.0-float(l9_1770))*(1.0-l9_1773)));
l9_1767=l9_1772;
l9_1744.x=l9_1767;
l9_1754=l9_1771;
bool l9_1774=l9_1750;
bool l9_1775;
if (l9_1774)
{
l9_1775=l9_1747.y==3;
}
else
{
l9_1775=l9_1774;
}
float l9_1776=l9_1744.y;
float l9_1777=l9_1749.y;
float l9_1778=l9_1749.w;
bool l9_1779=l9_1775;
float l9_1780=l9_1754;
float l9_1781=fast::clamp(l9_1776,l9_1777,l9_1778);
float l9_1782=step(abs(l9_1776-l9_1781),9.9999997e-06);
l9_1780*=(l9_1782+((1.0-float(l9_1779))*(1.0-l9_1782)));
l9_1776=l9_1781;
l9_1744.y=l9_1776;
l9_1754=l9_1780;
}
float2 l9_1783=l9_1744;
bool l9_1784=l9_1745;
float3x3 l9_1785=l9_1746;
if (l9_1784)
{
l9_1783=float2((l9_1785*float3(l9_1783,1.0)).xy);
}
float2 l9_1786=l9_1783;
l9_1744=l9_1786;
float l9_1787=l9_1744.x;
int l9_1788=l9_1747.x;
bool l9_1789=l9_1753;
float l9_1790=l9_1754;
if ((l9_1788==0)||(l9_1788==3))
{
float l9_1791=l9_1787;
float l9_1792=0.0;
float l9_1793=1.0;
bool l9_1794=l9_1789;
float l9_1795=l9_1790;
float l9_1796=fast::clamp(l9_1791,l9_1792,l9_1793);
float l9_1797=step(abs(l9_1791-l9_1796),9.9999997e-06);
l9_1795*=(l9_1797+((1.0-float(l9_1794))*(1.0-l9_1797)));
l9_1791=l9_1796;
l9_1787=l9_1791;
l9_1790=l9_1795;
}
l9_1744.x=l9_1787;
l9_1754=l9_1790;
float l9_1798=l9_1744.y;
int l9_1799=l9_1747.y;
bool l9_1800=l9_1753;
float l9_1801=l9_1754;
if ((l9_1799==0)||(l9_1799==3))
{
float l9_1802=l9_1798;
float l9_1803=0.0;
float l9_1804=1.0;
bool l9_1805=l9_1800;
float l9_1806=l9_1801;
float l9_1807=fast::clamp(l9_1802,l9_1803,l9_1804);
float l9_1808=step(abs(l9_1802-l9_1807),9.9999997e-06);
l9_1806*=(l9_1808+((1.0-float(l9_1805))*(1.0-l9_1808)));
l9_1802=l9_1807;
l9_1798=l9_1802;
l9_1801=l9_1806;
}
l9_1744.y=l9_1798;
l9_1754=l9_1801;
float2 l9_1809=l9_1744;
int l9_1810=l9_1742;
int l9_1811=l9_1743;
float l9_1812=l9_1752;
float2 l9_1813=l9_1809;
int l9_1814=l9_1810;
int l9_1815=l9_1811;
float3 l9_1816=float3(0.0);
if (l9_1814==0)
{
l9_1816=float3(l9_1813,0.0);
}
else
{
if (l9_1814==1)
{
l9_1816=float3(l9_1813.x,(l9_1813.y*0.5)+(0.5-(float(l9_1815)*0.5)),0.0);
}
else
{
l9_1816=float3(l9_1813,float(l9_1815));
}
}
float3 l9_1817=l9_1816;
float3 l9_1818=l9_1817;
float4 l9_1819=sc_set0.depthImage.sample(sc_set0.depthImageSmpSC,l9_1818.xy,bias(l9_1812));
float4 l9_1820=l9_1819;
if (l9_1750)
{
l9_1820=mix(l9_1751,l9_1820,float4(l9_1754));
}
float4 l9_1821=l9_1820;
l9_1735=l9_1821;
float l9_1822=0.0;
l9_1822=l9_1735.x;
float l9_1823=0.0;
float l9_1824=(*sc_set0.UserUniforms).fallbacktexMult;
l9_1823=l9_1824;
float l9_1825=0.0;
l9_1825=l9_1822*l9_1823;
float l9_1826=0.0;
float l9_1827=(*sc_set0.UserUniforms).focusDistance;
l9_1826=l9_1827;
float l9_1828=0.0;
float l9_1829=(*sc_set0.UserUniforms).aperture;
l9_1828=l9_1829;
float l9_1830=0.0;
float l9_1831=(*sc_set0.UserUniforms).Port_Value_N041;
float l9_1832=l9_1831+0.001;
l9_1832-=0.001;
l9_1830=l9_1832;
float l9_1833=0.0;
l9_1833=(l9_1828*l9_1830)*(*sc_set0.UserUniforms).Port_Input2_N032;
float l9_1834=0.0;
l9_1834=l9_1826+l9_1833;
float l9_1835=0.0;
l9_1835=(l9_1828*l9_1830)*(*sc_set0.UserUniforms).Port_Input2_N033;
float l9_1836=0.0;
l9_1836=l9_1826+l9_1835;
float l9_1837=0.0;
l9_1837=(((l9_1825-l9_1834)/((l9_1836-l9_1834)+1e-06))*((*sc_set0.UserUniforms).Port_RangeMaxB_N035-(*sc_set0.UserUniforms).Port_RangeMinB_N035))+(*sc_set0.UserUniforms).Port_RangeMinB_N035;
float l9_1838=0.0;
l9_1838=abs(l9_1837);
float l9_1839=0.0;
l9_1839=l9_1838+(*sc_set0.UserUniforms).Port_Input1_N043;
float l9_1840=0.0;
l9_1840=l9_1733*l9_1839;
float l9_1841=0.0;
l9_1841=fast::clamp(l9_1840,(*sc_set0.UserUniforms).Port_Input1_N052,(*sc_set0.UserUniforms).Port_Input2_N052);
float l9_1842=0.0;
l9_1842=l9_1841;
float l9_1843=0.0;
l9_1843=exp2(l9_1842);
float l9_1844=0.0;
l9_1844=l9_1726.Loop_Index_ID0;
float2 l9_1845=float2(0.0);
float l9_1846=l9_1844;
float2 l9_1847=(*sc_set0.UserUniforms).Port_Item0_N016;
float2 l9_1848=(*sc_set0.UserUniforms).Port_Item1_N016;
float2 l9_1849=(*sc_set0.UserUniforms).Port_Item2_N016;
float2 l9_1850=(*sc_set0.UserUniforms).Port_Item3_N016;
float2 l9_1851=(*sc_set0.UserUniforms).Port_Item4_N016;
float2 l9_1852=(*sc_set0.UserUniforms).Port_Item5_N016;
float2 l9_1853=(*sc_set0.UserUniforms).Port_Item6_N016;
float2 l9_1854=(*sc_set0.UserUniforms).Port_Item7_N016;
float2 l9_1855[8];
l9_1855[0]=l9_1847;
l9_1855[1]=l9_1848;
l9_1855[2]=l9_1849;
l9_1855[3]=l9_1850;
l9_1855[4]=l9_1851;
l9_1855[5]=l9_1852;
l9_1855[6]=l9_1853;
l9_1855[7]=l9_1854;
int l9_1856=int(fast::clamp(l9_1846+9.9999997e-05,0.0,7.0));
float2 l9_1857=l9_1855[l9_1856];
l9_1845=l9_1857;
float2 l9_1858=float2(0.0);
l9_1858=(l9_1732*float2(l9_1843))*l9_1845;
float2 l9_1859=float2(0.0);
l9_1859=l9_1731+l9_1858;
float l9_1860=0.0;
l9_1860=l9_1842+(*sc_set0.UserUniforms).Port_Input1_N045;
float4 l9_1861=float4(0.0);
int l9_1862;
if ((int(screenTexHasSwappedViews_tmp)!=0))
{
int l9_1863=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1863=0;
}
else
{
l9_1863=in.varStereoViewID;
}
int l9_1864=l9_1863;
l9_1862=1-l9_1864;
}
else
{
int l9_1865=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1865=0;
}
else
{
l9_1865=in.varStereoViewID;
}
int l9_1866=l9_1865;
l9_1862=l9_1866;
}
int l9_1867=l9_1862;
int l9_1868=screenTexLayout_tmp;
int l9_1869=l9_1867;
float2 l9_1870=l9_1859;
bool l9_1871=(int(SC_USE_UV_TRANSFORM_screenTex_tmp)!=0);
float3x3 l9_1872=(*sc_set0.UserUniforms).screenTexTransform;
int2 l9_1873=int2(SC_SOFTWARE_WRAP_MODE_U_screenTex_tmp,SC_SOFTWARE_WRAP_MODE_V_screenTex_tmp);
bool l9_1874=(int(SC_USE_UV_MIN_MAX_screenTex_tmp)!=0);
float4 l9_1875=(*sc_set0.UserUniforms).screenTexUvMinMax;
bool l9_1876=(int(SC_USE_CLAMP_TO_BORDER_screenTex_tmp)!=0);
float4 l9_1877=(*sc_set0.UserUniforms).screenTexBorderColor;
float l9_1878=l9_1860;
bool l9_1879=l9_1876&&(!l9_1874);
float l9_1880=1.0;
float l9_1881=l9_1870.x;
int l9_1882=l9_1873.x;
if (l9_1882==1)
{
l9_1881=fract(l9_1881);
}
else
{
if (l9_1882==2)
{
float l9_1883=fract(l9_1881);
float l9_1884=l9_1881-l9_1883;
float l9_1885=step(0.25,fract(l9_1884*0.5));
l9_1881=mix(l9_1883,1.0-l9_1883,fast::clamp(l9_1885,0.0,1.0));
}
}
l9_1870.x=l9_1881;
float l9_1886=l9_1870.y;
int l9_1887=l9_1873.y;
if (l9_1887==1)
{
l9_1886=fract(l9_1886);
}
else
{
if (l9_1887==2)
{
float l9_1888=fract(l9_1886);
float l9_1889=l9_1886-l9_1888;
float l9_1890=step(0.25,fract(l9_1889*0.5));
l9_1886=mix(l9_1888,1.0-l9_1888,fast::clamp(l9_1890,0.0,1.0));
}
}
l9_1870.y=l9_1886;
if (l9_1874)
{
bool l9_1891=l9_1876;
bool l9_1892;
if (l9_1891)
{
l9_1892=l9_1873.x==3;
}
else
{
l9_1892=l9_1891;
}
float l9_1893=l9_1870.x;
float l9_1894=l9_1875.x;
float l9_1895=l9_1875.z;
bool l9_1896=l9_1892;
float l9_1897=l9_1880;
float l9_1898=fast::clamp(l9_1893,l9_1894,l9_1895);
float l9_1899=step(abs(l9_1893-l9_1898),9.9999997e-06);
l9_1897*=(l9_1899+((1.0-float(l9_1896))*(1.0-l9_1899)));
l9_1893=l9_1898;
l9_1870.x=l9_1893;
l9_1880=l9_1897;
bool l9_1900=l9_1876;
bool l9_1901;
if (l9_1900)
{
l9_1901=l9_1873.y==3;
}
else
{
l9_1901=l9_1900;
}
float l9_1902=l9_1870.y;
float l9_1903=l9_1875.y;
float l9_1904=l9_1875.w;
bool l9_1905=l9_1901;
float l9_1906=l9_1880;
float l9_1907=fast::clamp(l9_1902,l9_1903,l9_1904);
float l9_1908=step(abs(l9_1902-l9_1907),9.9999997e-06);
l9_1906*=(l9_1908+((1.0-float(l9_1905))*(1.0-l9_1908)));
l9_1902=l9_1907;
l9_1870.y=l9_1902;
l9_1880=l9_1906;
}
float2 l9_1909=l9_1870;
bool l9_1910=l9_1871;
float3x3 l9_1911=l9_1872;
if (l9_1910)
{
l9_1909=float2((l9_1911*float3(l9_1909,1.0)).xy);
}
float2 l9_1912=l9_1909;
l9_1870=l9_1912;
float l9_1913=l9_1870.x;
int l9_1914=l9_1873.x;
bool l9_1915=l9_1879;
float l9_1916=l9_1880;
if ((l9_1914==0)||(l9_1914==3))
{
float l9_1917=l9_1913;
float l9_1918=0.0;
float l9_1919=1.0;
bool l9_1920=l9_1915;
float l9_1921=l9_1916;
float l9_1922=fast::clamp(l9_1917,l9_1918,l9_1919);
float l9_1923=step(abs(l9_1917-l9_1922),9.9999997e-06);
l9_1921*=(l9_1923+((1.0-float(l9_1920))*(1.0-l9_1923)));
l9_1917=l9_1922;
l9_1913=l9_1917;
l9_1916=l9_1921;
}
l9_1870.x=l9_1913;
l9_1880=l9_1916;
float l9_1924=l9_1870.y;
int l9_1925=l9_1873.y;
bool l9_1926=l9_1879;
float l9_1927=l9_1880;
if ((l9_1925==0)||(l9_1925==3))
{
float l9_1928=l9_1924;
float l9_1929=0.0;
float l9_1930=1.0;
bool l9_1931=l9_1926;
float l9_1932=l9_1927;
float l9_1933=fast::clamp(l9_1928,l9_1929,l9_1930);
float l9_1934=step(abs(l9_1928-l9_1933),9.9999997e-06);
l9_1932*=(l9_1934+((1.0-float(l9_1931))*(1.0-l9_1934)));
l9_1928=l9_1933;
l9_1924=l9_1928;
l9_1927=l9_1932;
}
l9_1870.y=l9_1924;
l9_1880=l9_1927;
float2 l9_1935=l9_1870;
int l9_1936=l9_1868;
int l9_1937=l9_1869;
float l9_1938=l9_1878;
float2 l9_1939=l9_1935;
int l9_1940=l9_1936;
int l9_1941=l9_1937;
float3 l9_1942=float3(0.0);
if (l9_1940==0)
{
l9_1942=float3(l9_1939,0.0);
}
else
{
if (l9_1940==1)
{
l9_1942=float3(l9_1939.x,(l9_1939.y*0.5)+(0.5-(float(l9_1941)*0.5)),0.0);
}
else
{
l9_1942=float3(l9_1939,float(l9_1941));
}
}
float3 l9_1943=l9_1942;
float3 l9_1944=l9_1943;
float4 l9_1945=sc_set0.screenTex.sample(sc_set0.screenTexSmpSC,l9_1944.xy,level(l9_1938));
float4 l9_1946=l9_1945;
if (l9_1876)
{
l9_1946=mix(l9_1877,l9_1946,float4(l9_1880));
}
float4 l9_1947=l9_1946;
l9_1861=l9_1947;
l9_1727=l9_1861;
l9_1725+=l9_1727;
param_28=l9_1725;
param_28/=float4(8.0);
Output_N104=param_28;
float4 Output_N105=float4(0.0);
Output_N105=mix(Color_N46,Output_N104,float4((*sc_set0.UserUniforms).Port_Input2_N105));
float4 Export_N106=float4(0.0);
Export_N106=Output_N105;
FinalColor=Export_N106;
float param_30=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_30<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1948=gl_FragCoord;
float2 l9_1949=floor(mod(l9_1948.xy,float2(4.0)));
float l9_1950=(mod(dot(l9_1949,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_30<l9_1950)
{
discard_fragment();
}
}
float4 param_31=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_1951=param_31;
float4 l9_1952=l9_1951;
float l9_1953=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1953=l9_1952.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1953=fast::clamp(l9_1952.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1953=fast::clamp(dot(l9_1952.xyz,float3(l9_1952.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_1953=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_1953=(1.0-dot(l9_1952.xyz,float3(0.33333001)))*l9_1952.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1953=(1.0-fast::clamp(dot(l9_1952.xyz,float3(1.0)),0.0,1.0))*l9_1952.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1953=fast::clamp(dot(l9_1952.xyz,float3(1.0)),0.0,1.0)*l9_1952.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_1953=fast::clamp(dot(l9_1952.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1953=fast::clamp(dot(l9_1952.xyz,float3(1.0)),0.0,1.0)*l9_1952.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_1953=dot(l9_1952.xyz,float3(0.33333001))*l9_1952.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_1953=1.0-fast::clamp(dot(l9_1952.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_1953=fast::clamp(dot(l9_1952.xyz,float3(1.0)),0.0,1.0);
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
float l9_1954=l9_1953;
float l9_1955=l9_1954;
float l9_1956=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_1955;
float3 l9_1957=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_1951.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_1958=float4(l9_1957.x,l9_1957.y,l9_1957.z,l9_1956);
param_31=l9_1958;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_31=float4(param_31.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_1959=param_31;
float4 l9_1960=float4(0.0);
float4 l9_1961=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1962=out.sc_FragData0;
l9_1961=l9_1962;
}
else
{
float4 l9_1963=gl_FragCoord;
float2 l9_1964=l9_1963.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_1965=l9_1964;
float2 l9_1966=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1967=1;
int l9_1968=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1968=0;
}
else
{
l9_1968=in.varStereoViewID;
}
int l9_1969=l9_1968;
int l9_1970=l9_1969;
float3 l9_1971=float3(l9_1965,0.0);
int l9_1972=l9_1967;
int l9_1973=l9_1970;
if (l9_1972==1)
{
l9_1971.y=((2.0*l9_1971.y)+float(l9_1973))-1.0;
}
float2 l9_1974=l9_1971.xy;
l9_1966=l9_1974;
}
else
{
l9_1966=l9_1965;
}
float2 l9_1975=l9_1966;
float2 l9_1976=l9_1975;
float2 l9_1977=l9_1976;
float2 l9_1978=l9_1977;
float l9_1979=0.0;
int l9_1980;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1981=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1981=0;
}
else
{
l9_1981=in.varStereoViewID;
}
int l9_1982=l9_1981;
l9_1980=1-l9_1982;
}
else
{
int l9_1983=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1983=0;
}
else
{
l9_1983=in.varStereoViewID;
}
int l9_1984=l9_1983;
l9_1980=l9_1984;
}
int l9_1985=l9_1980;
float2 l9_1986=l9_1978;
int l9_1987=sc_ScreenTextureLayout_tmp;
int l9_1988=l9_1985;
float l9_1989=l9_1979;
float2 l9_1990=l9_1986;
int l9_1991=l9_1987;
int l9_1992=l9_1988;
float3 l9_1993=float3(0.0);
if (l9_1991==0)
{
l9_1993=float3(l9_1990,0.0);
}
else
{
if (l9_1991==1)
{
l9_1993=float3(l9_1990.x,(l9_1990.y*0.5)+(0.5-(float(l9_1992)*0.5)),0.0);
}
else
{
l9_1993=float3(l9_1990,float(l9_1992));
}
}
float3 l9_1994=l9_1993;
float3 l9_1995=l9_1994;
float4 l9_1996=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_1995.xy,bias(l9_1989));
float4 l9_1997=l9_1996;
float4 l9_1998=l9_1997;
l9_1961=l9_1998;
}
float4 l9_1999=l9_1961;
float3 l9_2000=l9_1999.xyz;
float3 l9_2001=l9_2000;
float3 l9_2002=l9_1959.xyz;
float3 l9_2003=definedBlend(l9_2001,l9_2002,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_1960=float4(l9_2003.x,l9_2003.y,l9_2003.z,l9_1960.w);
float3 l9_2004=mix(l9_2000,l9_1960.xyz,float3(l9_1959.w));
l9_1960=float4(l9_2004.x,l9_2004.y,l9_2004.z,l9_1960.w);
l9_1960.w=1.0;
float4 l9_2005=l9_1960;
param_31=l9_2005;
}
else
{
if ((int(sc_Voxelization_tmp)!=0))
{
float4 l9_2006=float4(in.varScreenPos.xyz,1.0);
param_31=l9_2006;
}
else
{
if ((int(sc_OutputBounds_tmp)!=0))
{
float4 l9_2007=gl_FragCoord;
float l9_2008=fast::clamp(abs(l9_2007.z),0.0,1.0);
float4 l9_2009=float4(l9_2008,1.0-l9_2008,1.0,1.0);
param_31=l9_2009;
}
else
{
float4 l9_2010=param_31;
float4 l9_2011=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_2011=float4(mix(float3(1.0),l9_2010.xyz,float3(l9_2010.w)),l9_2010.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_2012=l9_2010.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_2012=fast::clamp(l9_2012,0.0,1.0);
}
l9_2011=float4(l9_2010.xyz*l9_2012,l9_2012);
}
else
{
l9_2011=l9_2010;
}
}
float4 l9_2013=l9_2011;
param_31=l9_2013;
}
}
}
}
}
float4 l9_2014=param_31;
FinalColor=l9_2014;
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
float4 l9_2015=float4(0.0);
l9_2015=float4(0.0);
float4 l9_2016=l9_2015;
float4 Cost=l9_2016;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float4 param_32=FinalColor;
FinalColor=sc_OutputMotionVectorIfNeeded(param_32,in.varPosAndMotion,in.varNormalAndMotion);
float4 param_33=FinalColor;
float4 l9_2017=param_33;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_2017.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.sc_FragData0=l9_2017;
return out;
}
} // FRAGMENT SHADER
