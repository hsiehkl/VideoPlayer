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
    
    var avPlayer = AVPlayer()
    let avPlayerLayer = AVPlayerLayer()
    let buttomView = UIView()
    let searchBar = UISearchBar()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtomView()
        setupSearchBar()


    }
    
    func setUpButtomView() {
        
        self.buttomView.frame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        
        buttomView.backgroundColor = Color.buttomViewColor
        
        let playButton = UIButton()
        playButton.setTitle("Pause", for: .normal)
        playButton.frame = CGRect(x: 20, y: 10 , width: 50, height: 20)
        playButton.tintColor = UIColor.white
        buttomView.addSubview(playButton)
        
        let muteButton = UIButton()
        muteButton.setTitle("Mute", for: .normal)
        muteButton.frame = CGRect(x: self.view.frame.width - 70, y: 10 , width: 50, height: 20)
        muteButton.tintColor = UIColor.white
        buttomView.addSubview(muteButton)
        
        self.view.addSubview(buttomView)
        
        buttomView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func setupSearchBar() {
        
        if UIDevice.current.orientation.isLandscape {
            self.searchBar.isHidden = true
        }
        
        searchBar.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 56)
        searchBar.delegate = self
        searchBar.placeholder = "Enter URL of video."
        searchBar.barTintColor = UIColor.clear
        self.view.addSubview(searchBar)
        
    }
}

extension VideoPlayerViewController: UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    
}
