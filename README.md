# FilterOnVideo
 
       self.filter = CIFilter(name: "CIPhotoEffectTonal")!
        let urlVideofile = Bundle.main.url(forResource: "Azaan", withExtension: "mov")
        let videoAsset = AVAsset(url: urlVideofile!)
        let eagl = EAGLContext(api: EAGLRenderingAPI.openGLES2)
        let context = CIContext(eaglContext: eagl!, options: [CIContextOption.workingColorSpace : NSNull()])
        
        let filters = [self.filter]
        let videoFilterExport = VideoFilterExport(asset: videoAsset, filters: filters, context: context)
        
        videoFilterExport.export(toURL: getOutPutUrl(), callback: { url in
            self.saveVideo(videoUrl: url!)
        })
    
