//
//  ViewController.swift
//  YouTube Example
//
//  Created by AshutoshD on 21/04/20.
//  Copyright © 2020 ravindraB. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var videos : [Video] = Video.allVideos()
    @objc private let player = AVQueuePlayer()
    
    let videoPreviewLooper = VideoLooperView(clips: VideoClip.allClips())
    
    let newView = UIView()
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
        print(videos)
        
     
        
       
      //  tblView.register(UINib(nibName: "VideoTableCell", bundle: nil), forCellReuseIdentifier: "VideoTableCell")
    }
    
//    let VideoCellReuseIdentifier = "VideoCell"
//    let tableView = UITableView()
    
    //? Add the video looper view
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //? Start the looping video player when the view appears
        videoPreviewLooper.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //? Make sure it's paused when the user leaves this screen
        videoPreviewLooper.pause()
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tblView.dequeueReusableCell(withIdentifier: "VideoTableCell", for: indexPath) as! VideoTableCell
        let video = videos[indexPath.row]
        print(video)
        
//        cell?.lblTitle.text = videos[indexPath.row].title
//        cell?.lblSubTitlte.text = videos[indexPath.row].subtitle
////        let image = UIImage(named: (video?.thumbURL.path)!)
//        let image = videos[indexPath.row].thumbURL
//        cell?.imgView.image = UIImage(named: image.path)
        cell.video = videos[indexPath.row]
        let player = AVPlayer()
        player.pause()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     //   let video = videos[indexPath.row]
        return 280
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //2 Create an AVPlayerViewController and present it when the user taps
        let cell = tblView.dequeueReusableCell(withIdentifier: "VideoTableCell", for: indexPath) as! VideoTableCell
        let video = videos[indexPath.row]
     
        
//            let videoURL = video.url
//                    let player = AVPlayer(url: videoURL)
//                    let playerViewController = AVPlayerViewController()
//                    playerViewController.player = player
//            let player = AVPlayer(url: videoURL)
//            player.rate = 1 //auto play
//            let playerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 250)
//            let playerViewController = AVPlayerViewController()
//            playerViewController.player = player
//            playerViewController.view.frame = playerFrame
//            playerViewController.showsPlaybackControls = false
//
//            addChild(playerViewController)
//            view.addSubview(playerViewController.view)
//            playerViewController.didMove(toParent: self)
//            selectedCell = indexPath.row
        
       
        
//        playVideo(urlVideo: videoURL)
        
//        let player = AVPlayer(url: videoURL)
//        player.pause()
//        let playerController = AVPlayerViewController()
//        playerController.player = player
//        let playerLayerAV = AVPlayerLayer(player: player)
//        //now we set the size of frame to be like the view ("backview")
//        playerLayerAV.frame = backView!.bounds
//        // the backview is the view i'm using it to insert a video
//        backView!.layer.addSublayer(playerLayerAV)
//        player.play()
        
        
        for item in videos {
            
          if item.isPlay == true {
                item.isPlay = false
          //      cell.imgView.isHidden = false
                let player = AVPlayer()
                player.pause()
                tblView.reloadData()
            }
        }
        
        
        
//        if video.isPlay == true {
//
//            for item in videos {
//
//                item.isPlay = false
//            }
//
//        }
//
        if video.isPlay ==  false {

            let videoURL = video.url
       //     cell.imgView.isHidden = true
            let backView = cell.backView
            video.isPlay = true
            print(video.isPlay)
//            playVideo(urlVideo: videoURL, backView: backView!)
            let player = AVPlayer(url: videoURL)
                        player.rate = 1 //auto play
                        let playerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 250)
                        let playerViewController = AVPlayerViewController()
                        playerViewController.player = player
                        playerViewController.view.frame = playerFrame
                        playerViewController.showsPlaybackControls = false
            
                        addChild(playerViewController)
                        view.addSubview(playerViewController.view)
                        playerViewController.didMove(toParent: self)
            player.play()
                       // selectedCell = indexPath.row
            tblView.reloadData()
        }
        
//        present(playerViewController, animated: true) {
//            player.play()
//        }
    }
    
    private func playVideo(urlVideo : URL , backView : UIView) {
//        guard let path = Bundle.main.path(forResource: "video", ofType:"mp4") else {
//            debugPrint("video.mp4 not found")
//            return
//        }
        tblView.reloadData()
        let player = AVPlayer(url: urlVideo)
       // player.pause()
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        let playerLayerAV = AVPlayerLayer(player: player)
        //now we set the size of frame to be like the view ("backview")
        playerLayerAV.frame = backView.bounds
        playerLayerAV.videoGravity = .resizeAspect
        // the backview is the view i'm using it to insert a video
        backView.layer.addSublayer(playerLayerAV)
            player.play()
      
        
    }
    
    
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
}

// pause the video before the controller is dismissed
extension AVPlayerViewController {
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.player?.pause()
        NotificationCenter.default.post(name: Notification.Name("avPlayerDidDismiss"), object: nil, userInfo: nil)
    }
}
