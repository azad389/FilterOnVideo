//
//  AppDelegate.swift
//  FiltersDemo
//
//  Created by Azad Rather on 05/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}



extension UIImage {
func addFilter(filter : FilterType) -> UIImage {

    let filter = CIFilter(name: filter.rawValue)
// convert UIImage to CIImage and set as input
let ciInput = CIImage(image: self)
filter?.setValue(ciInput, forKey: "inputImage")
// get output CIImage, render as CGImage first to retain proper UIImage scale
let ciOutput = filter?.outputImage
let ciContext = CIContext()
let cgImage = ciContext.createCGImage(ciOutput!, from: (ciOutput?.extent)!)
//Return the image
return UIImage(cgImage: cgImage!)
}
}



/*
 //MARK: CICategoryBlur
case Boxblur = "CIBoxBlur"
case Discblur = "CIDiscBlur"
 CIGaussianBlur
 CIMaskedVariableBlur
 CIMedianFilter
 CIMotionBlur
 CINoiseReduction
 CIZoomBlur
 //MARK: CICategoryColorAdjustment
 CIColorClamp
 CIColorControls
 CIColorMatrix
 CIColorPolynomial
 CIExposureAdjust
 CIGammaAdjust
 CIHueAdjust
 CILinearToSRGBToneCurve
 CISRGBToneCurveToLinear
 CITemperatureAndTint
 CIToneCurve
 CIVibrance
 CIWhitePointAdjust
 //MARK: CICategoryColorEffect
 CIColorCrossPolynomial
 CIColorCube
 CIColorCubeWithColorSpace
 CIColorInvert
 CIColorMap
 CIColorMonochrome
 CIColorPosterize
 CIFalseColor
 CIMaskToAlpha
 CIMaximumComponent
 CIMinimumComponent
 CIPhotoEffectChrome
 CIPhotoEffectFade
 CIPhotoEffectInstant
 CIPhotoEffectMono
 CIPhotoEffectNoir
 CIPhotoEffectProcess
 CIPhotoEffectTonal
 CIPhotoEffectTransfer
 CISepiaTone
 CIVignette
 CIVignetteEffect
 //MARK: CICategoryCompositeOperation
 CIAdditionCompositing
 CIColorBlendMode
 CIColorBurnBlendMode
 CIColorDodgeBlendMode
 CIDarkenBlendMode
 CIDifferenceBlendMode
 CIDivideBlendMode
 CIExclusionBlendMode
 CIHardLightBlendMode
 CIHueBlendMode
 CILightenBlendMode
 CILinearBurnBlendMode
 CILinearDodgeBlendMode
 CILuminosityBlendMode
 CIMaximumCompositing
 CIMinimumCompositing
 CIMultiplyBlendMode
 CIMultiplyCompositing
 CIOverlayBlendMode
 CIPinLightBlendMode
 CISaturationBlendMode
 CIScreenBlendMode
 CISoftLightBlendMode
 CISourceAtopCompositing
 CISourceInCompositing
 CISourceOutCompositing
 CISourceOverCompositing
 CISubtractBlendMode
 //MARK: CICategoryDistortionEffect
 CIBumpDistortion
 CIBumpDistortionLinear
 CICircleSplashDistortion
 CICircularWrap
 CIDroste
 CIDisplacementDistortion
 CIGlassDistortion
 CIGlassLozenge
 CIHoleDistortion
 CILightTunnel
 CIPinchDistortion
 CIStretchCrop
 CITorusLensDistortion
 CITwirlDistortion
 CIVortexDistortion
 //MARK: CICategoryGenerator
 CIAztecCodeGenerator
 CICheckerboardGenerator
 CICode128BarcodeGenerator
 CIConstantColorGenerator
 CILenticularHaloGenerator
 CIPDF417BarcodeGenerator
 CIQRCodeGenerator
 CIRandomGenerator
 CIStarShineGenerator
 CIStripesGenerator
 CISunbeamsGenerator
 //MARK: CICategoryGeometryAdjustment
 CIAffineTransform
 CICrop
 CILanczosScaleTransform
 CIPerspectiveCorrection
 CIPerspectiveTransform
 CIPerspectiveTransformWithExtent
 CIStraightenFilter
 //MARK: CICategoryGradient
 CIGaussianGradient
 CILinearGradient
 CIRadialGradient
 CISmoothLinearGradient
 //MARK: CICategoryHalftoneEffect
 CICircularScreen
 CICMYKHalftone
 CIDotScreen
 CIHatchedScreen
 CILineScreen
 //MARK: CICategoryReduction
 CIAreaAverage
 CIAreaHistogram
 CIRowAverage
 CIColumnAverage
 CIHistogramDisplayFilter
 CIAreaMaximum
 CIAreaMinimum
 CIAreaMaximumAlpha
 CIAreaMinimumAlpha
 //MARK: CICategorySharpen
 CISharpenLuminance
 CIUnsharpMask
 //MARK: CICategoryStylize
 CIBlendWithAlphaMask
 CIBlendWithMask
 CIBloom
 CIComicEffect
 CIConvolution3X3
 CIConvolution5X5
 CIConvolution7X7
 CIConvolution9Horizontal
 CIConvolution9Vertical
 CICrystallize
 CIDepthOfField
 CIEdges
 CIEdgeWork
 CIGloom
 CIHeightFieldFromMask
 CIHexagonalPixellate
 CIHighlightShadowAdjust
 CILineOverlay
 CIPixellate
 CIPointillize
 CIShadedMaterial
 CISpotColor
 CISpotLight
 //MARK: CICategoryTileEffect
 CIAffineClamp
 CIAffineTile
 CIEightfoldReflectedTile
 CIFourfoldReflectedTile
 CIFourfoldRotatedTile
 CIFourfoldTranslatedTile
 CIGlideReflectedTile
 CIKaleidoscope
 CIOpTile
 CIParallelogramTile
 CIPerspectiveTile
 CISixfoldReflectedTile
 CISixfoldRotatedTile
 CITriangleKaleidoscope
 CITriangleTile
 CITwelvefoldReflectedTile
 //MARK: CICategoryTransition
 CIAccordionFoldTransition
 CIBarsSwipeTransition
 CICopyMachineTransition
 CIDisintegrateWithMaskTransition
 CIDissolveTransition
 CIFlashTransition
 CIModTransition
 CIPageCurlTransition
 CIPageCurlWithShadowTransition
 CIRippleTransition
 CISwipeTransition

 */


/*
let filterArr = [
                      CIFilter.hueSaturationValueGradient(),
                       CIFilter.linearGradient(),
                       CIFilter.radialGradient(),
                       CIFilter.smoothLinearGradient(),
                       CIFilter.sharpenLuminance(),
                       CIFilter.unsharpMask(),
                       CIFilter.dotScreen(),
                       CIFilter.hatchedScreen(),
                       CIFilter.lineScreen(),
                       CIFilter.bicubicScaleTransform(),
                       CIFilter.edgePreserveUpsample(),
                       CIFilter.keystoneCorrectionCombined(),
                       CIFilter.keystoneCorrectionHorizontal(),
                       CIFilter.keystoneCorrectionVertical(),
                       CIFilter.lanczosScaleTransform(),
                       CIFilter.perspectiveCorrection(),
                       CIFilter.perspectiveRotate(),
                       CIFilter.perspectiveTransform(),
                       CIFilter.perspectiveTransformWithExtent(),
                       CIFilter.straighten(),
                       CIFilter.accordionFoldTransition(),
                       CIFilter.barsSwipeTransition(),
                       CIFilter.copyMachineTransition(),
                       CIFilter.disintegrateWithMaskTransition(),
                       CIFilter.dissolveTransition(),
                       CIFilter.flashTransition(),
                       CIFilter.modTransition(),
                       CIFilter.pageCurlTransition(),
                       CIFilter.pageCurlWithShadowTransition(),
                       CIFilter.rippleTransition(),
                       CIFilter.swipeTransition(),
                       CIFilter.additionCompositing(),
                       CIFilter.colorBlendMode(),
                       CIFilter.colorBurnBlendMode(),
                       CIFilter.colorDodgeBlendMode(),
                       CIFilter.darkenBlendMode(),
                       CIFilter.differenceBlendMode(),
                       CIFilter.divideBlendMode(),
                       CIFilter.exclusionBlendMode(),
                       CIFilter.hardLightBlendMode(),
                       CIFilter.hueBlendMode(),
                       CIFilter.lightenBlendMode(),
                       CIFilter.linearBurnBlendMode(),
                       CIFilter.linearDodgeBlendMode(),
                       CIFilter.luminosityBlendMode(),
                       CIFilter.maximumCompositing(),
                       CIFilter.minimumCompositing(),
                       CIFilter.multiplyBlendMode(),
                       CIFilter.multiplyCompositing(),
                       CIFilter.overlayBlendMode(),
                       CIFilter.pinLightBlendMode(),
                       CIFilter.saturationBlendMode(),
                       CIFilter.screenBlendMode(),
                       CIFilter.softLightBlendMode(),
                       CIFilter.sourceAtopCompositing(),
                       CIFilter.sourceInCompositing(),
                       CIFilter.sourceOutCompositing(),
                       CIFilter.sourceOverCompositing(),
                       CIFilter.subtractBlendMode(),
                       CIFilter.colorAbsoluteDifference(),
                       CIFilter.colorClamp(),
                       CIFilter.colorControls(),
                       CIFilter.colorMatrix(),
                       CIFilter.colorPolynomial(),
                       CIFilter.colorThreshold(),
                       CIFilter.colorThresholdOtsu(),
                       CIFilter.depthToDisparity(),
                       CIFilter.disparityToDepth(),
                       CIFilter.exposureAdjust(),
                       CIFilter.gammaAdjust(),
                       CIFilter.hueAdjust(),
                       CIFilter.linearToSRGBToneCurve(),
                       CIFilter.sRGBToneCurveToLinear(),
                       CIFilter.temperatureAndTint(),
                       CIFilter.toneCurve(),
                       CIFilter.vibrance(),
                       CIFilter.whitePointAdjust(),
                       CIFilter.colorCrossPolynomial(),
                       CIFilter.colorCube(),
                       CIFilter.colorCubesMixedWithMask(),
                       CIFilter.colorCubeWithColorSpace(),
                       CIFilter.colorCurves(),
                       CIFilter.colorInvert(),
                       CIFilter.colorMap(),
                       CIFilter.colorMonochrome(),
                       CIFilter.colorPosterize(),
                       CIFilter.dither(),
                       CIFilter.documentEnhancer(),
                       CIFilter.falseColor(),
                       CIFilter.labDeltaE(),
                       CIFilter.maskToAlpha(),
                       CIFilter.maximumComponent(),
                       CIFilter.minimumComponent(),
                       CIFilter.paletteCentroid(),
                       CIFilter.palettize(),
                       CIFilter.photoEffectChrome(),
                       CIFilter.photoEffectFade(),
                       CIFilter.photoEffectInstant(),
                       CIFilter.photoEffectMono(),
                       CIFilter.photoEffectNoir(),
                       CIFilter.photoEffectProcess(),
                       CIFilter.photoEffectTonal(),
                       CIFilter.photoEffectTransfer(),
                       CIFilter.sepiaTone(),
                       CIFilter.thermal(),
                       CIFilter.vignette(),
                       CIFilter.vignetteEffect(),
                       CIFilter.xRay(),
                       CIFilter.bumpDistortion(),
                       CIFilter.bumpDistortionLinear(),
                       CIFilter.circleSplashDistortion(),
                       CIFilter.circularWrap(),
                       CIFilter.displacementDistortion(),
                       CIFilter.droste(),
                       CIFilter.glassDistortion(),
                       CIFilter.glassLozenge(),
                       CIFilter.holeDistortion(),
                       CIFilter.lightTunnel(),
                       CIFilter.ninePartStretched(),
                       CIFilter.ninePartTiled(),
                       CIFilter.pinchDistortion(),
                       CIFilter.stretchCrop(),
                       CIFilter.torusLensDistortion(),
                       CIFilter.twirlDistortion(),
                       CIFilter.vortexDistortion(),
                       CIFilter.affineClamp(),
                       CIFilter.affineTile(),
                       CIFilter.eightfoldReflectedTile(),
                       CIFilter.fourfoldReflectedTile(),
                       CIFilter.fourfoldRotatedTile(),
                       CIFilter.fourfoldTranslatedTile(),
                       CIFilter.glideReflectedTile(),
                       CIFilter.kaleidoscope(),
                       CIFilter.opTile(),
                       CIFilter.parallelogramTile(),
                       CIFilter.perspectiveTile(),
                       CIFilter.sixfoldReflectedTile(),
                       CIFilter.sixfoldRotatedTile(),
                       CIFilter.triangleKaleidoscope(),
                       CIFilter.triangleTile(),
                       CIFilter.twelvefoldReflectedTile(),
                       CIFilter.attributedTextImageGenerator(),
                       CIFilter.aztecCodeGenerator(),
                       CIFilter.barcodeGenerator(),
                       CIFilter.checkerboardGenerator(),
                       CIFilter.code128BarcodeGenerator(),
                       CIFilter.lenticularHaloGenerator(),
                       CIFilter.meshGenerator(),
                       CIFilter.pdf417BarcodeGenerator(),
                       CIFilter.qrCodeGenerator(),
                       CIFilter.randomGenerator(),
                       CIFilter.roundedRectangleGenerator(),
                       CIFilter.starShineGenerator(),
                       CIFilter.stripesGenerator(),
                       CIFilter.sunbeamsGenerator(),
                       CIFilter.textImageGenerator(),
                       CIFilter.blendWithAlphaMask(),
                       CIFilter.blendWithBlueMask(),
                       CIFilter.blendWithMask(),
                       CIFilter.blendWithRedMask(),
                       CIFilter.bloom(),
                       CIFilter.comicEffect(),
                       CIFilter.convolution3X3(),
                       CIFilter.convolution5X5(),
                       CIFilter.convolution7X7(),
                       CIFilter.convolution9Horizontal(),
                       CIFilter.convolution9Vertical(),
                       CIFilter.coreMLModel(),
                       CIFilter.crystallize(),
                       CIFilter.depthOfField(),
                       CIFilter.edges(),
                       CIFilter.edgeWork(),
                       CIFilter.gaborGradients(),
                       CIFilter.gloom(),
                       CIFilter.heightFieldFromMask(),
                       CIFilter.hexagonalPixellate(),
                       CIFilter.highlightShadowAdjust(),
                       CIFilter.lineOverlay(),
                       CIFilter.mix(),
                       CIFilter.pixellate(),
                       CIFilter.pointillize(),
                       CIFilter.saliencyMap(),
                       CIFilter.shadedMaterial(),
                       CIFilter.spotColor(),
                       CIFilter.spotLight(),
                       CIFilter.bokehBlur(),
                       CIFilter.boxBlur(),
                       CIFilter.discBlur(),
                       CIFilter.gaussianBlur(),
                       CIFilter.maskedVariableBlur(),
                       CIFilter.median(),
                       CIFilter.morphologyGradient(),
                       CIFilter.morphologyMaximum(),
                       CIFilter.morphologyMinimum(),
                       CIFilter.morphologyRectangleMaximum(),
                       CIFilter.morphologyRectangleMinimum(),
                       CIFilter.motionBlur(),
                       CIFilter.noiseReduction(),
                       CIFilter.zoomBlur] as [AnyObject]
*/

