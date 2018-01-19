//
//  VideoPlayerViewController.swift
//  VideoPlayer
//
//  Created by Cheng-Shan Hsieh on 2018/1/19.
//  Copyright © 2018年 HsinTing Hsieh. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerViewController: UIViewController {
    
    let playerView = UIView()
    var avPlayer = AVPlayer()
    let avPlayerLayer = AVPlayerLayer()
    let buttomView = UIView()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        playerView.frame = self.view.bounds
//        self.view.addSubview(playerView)
//        avplayerLayer.frame = self.view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtomView()

        // Do any additional setup after loading the view.
    }
    
    func setUpButtomView() {
        
        self.buttomView.frame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        
        buttomView.backgroundColor = UIColor.gray
        
        let playButton = UIButton()
        playButton.setTitle("Pause", for: .normal)
        playButton.frame = CGRect(x: 20, y: 10 , width: 50, height: 30)
        playButton.tintColor = UIColor.white
        buttomView.addSubview(playButton)
        
        let muteButton = UIButton()
        muteButton.setTitle("Mute", for: .normal)
        muteButton.frame = CGRect(x: self.view.frame.width - 70, y: 10 , width: 50, height: 30)
        muteButton.tintColor = UIColor.white
        buttomView.addSubview(muteButton)
        
        self.view.addSubview(buttomView)
        
        
        
    }
    
    

}
