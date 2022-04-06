//
//  ViewController.swift
//  FiltersDemo
//
//  Created by Azad Rather on 05/04/22.
//

import UIKit
import AVFoundation
import Photos
import AVKit
import AssetsLibrary

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    var filter = CIFilter(name: "CIColorInvert")!
    var  playerItem = AVPlayerItem.init(url: Bundle.main.url(forResource: "Azaan", withExtension: ".mov")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: Chnage filter
    @IBAction func btnChangeFilterTapped(_ sender: Any) {
        let filterName =  FilterType.allCases.randomElement()!
        imgView.image = UIImage(named: "img")?.addFilter(filter:filterName)
        filter = CIFilter(name: filterName.rawValue)!
    }
    
    //MARK: Add Filter And Play Video
    @IBAction func btnPlayVideo(_ sender: Any) {
        let urlVideofile = Bundle.main.url(forResource: "Azaan", withExtension: "mov")
        let videoAsset = AVAsset(url: urlVideofile!)
        let composition = AVMutableVideoComposition(asset: videoAsset, applyingCIFiltersWithHandler: { request in
            let source = request.sourceImage.clampedToExtent()
//            let filterName =  FilterType.allCases.randomElement()!
//            let filter = CIFilter(name: filterName.rawValue)
            
            self.filter.setValue(source, forKey: kCIInputImageKey)
            let output = self.filter.outputImage!.cropped(to: request.sourceImage.extent)
            request.finish(with: output, context: nil)
        })
        playerItem = AVPlayerItem(asset: videoAsset)
        playerItem.videoComposition = composition
        let objAVPlayerVC = AVPlayerViewController()
        objAVPlayerVC.player = AVPlayer(playerItem: playerItem)
        self.present(objAVPlayerVC, animated: true, completion: {() -> Void in
            objAVPlayerVC.player?.play()
        })
    }
    
    
    //MARK: Export video with filter
    func exportVideo(){
        let urlVideofile = Bundle.main.url(forResource: "Azaan", withExtension: "mov")
        let videoAsset = AVAsset(url: urlVideofile!)
        let eagl = EAGLContext(api: EAGLRenderingAPI.openGLES2)
        let context = CIContext(eaglContext: eagl!, options: [CIContextOption.workingColorSpace : NSNull()])
        
        let filters = [self.filter]
        let videoFilterExport = VideoFilterExport(asset: videoAsset, filters: filters, context: context)
        
        videoFilterExport.export(toURL: getOutPutUrl(), callback: { url in
            self.saveVideo(videoUrl: url!)
        })
    }
    
    //MARK: Save Video to gallery
    func saveVideo(videoUrl:URL){
        let saveVideoToPhotos = {
            let changes: () -> Void = {
                PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: videoUrl)
            }
            PHPhotoLibrary.shared().performChanges(changes) { saved, error in
                DispatchQueue.main.async {
                    let success = saved && (error == nil)
                    let title = success ? "Success" : "Error"
                    let message = success ? "Video saved" : "Failed to save video"
                    
                    let alert = UIAlertController(
                        title: title,
                        message: message,
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(
                        title: "OK",
                        style: UIAlertAction.Style.cancel,
                        handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        if PHPhotoLibrary.authorizationStatus() != .authorized {
            PHPhotoLibrary.requestAuthorization { status in
                if status == .authorized {
                    saveVideoToPhotos()
                }
            }
        } else {
            saveVideoToPhotos()
        }
    }
    
    @IBAction func btnExportTap(_ sender: Any) {
        exportVideo()
    }
    
    //MARK: Get Output path for export
    func getOutPutUrl()->URL{
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: Date())
        let path = documentsDirectory.appendingPathComponent("Filterd\(date).mp4")
        try? FileManager.default.removeItem(at: path)
        return path
    }
}
//MARK: Filters
enum FilterType : String,CaseIterable {
    case Chrome = "CIPhotoEffectChrome"
    case Fade = "CIPhotoEffectFade"
    case Instant = "CIPhotoEffectInstant"
    case Mono = "CIPhotoEffectMono"
    case Noir = "CIPhotoEffectNoir"
    case Process = "CIPhotoEffectProcess"
    case Tonal = "CIPhotoEffectTonal"
    case Transfer =  "CIPhotoEffectTransfer"
    case Boxblur = "CIBoxBlur"
    case Discblur = "CIDiscBlur"
    case CIConvolution3X3 = "CIConvolution3X3"
    case CIConvolution5X5 = "CIConvolution5X5"
    case CIConvolution7X7 = "CIConvolution7X7"
}
