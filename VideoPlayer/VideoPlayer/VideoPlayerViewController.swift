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

    let searchBar = UISearchBar()
    var avPlayer = AVPlayer()
    let avPlayerLayer = AVPlayerLayer()
    let bottomView = UIView()
    let playButton = UIButton()
    let muteButton = UIButton()
    var isPalying = true
    var isMuted = false

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpButtomView()
        setupSearchBar()
    }

    override func viewWillLayoutSubviews() {

        if UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) {

            self.searchBar.isHidden = true
            self.bottomView.frame = CGRect(x: 0, y: self.view.frame.height - 44, width: self.view.frame.width, height: 44)
            playButton.frame = CGRect(x: 30, y: 10, width: 50, height: 20)
            muteButton.frame = CGRect(x: self.view.frame.width - 80, y: 10, width: 60, height: 20)
            avPlayerLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 44)

        } else {

            self.searchBar.isHidden = false
            self.bottomView.frame = CGRect(x: 0, y: self.view.frame.height - 44, width: self.view.frame.width, height: 44)
            playButton.frame = CGRect(x: 30, y: 10, width: 50, height: 20)
            muteButton.frame = CGRect(x: self.view.frame.width - 80, y: 10, width: 60, height: 20)
            avPlayerLayer.frame = CGRect(x: 0, y: 76, width: self.view.frame.width, height: self.view.frame.height - 126)
        }
    }

    func setUpButtomView() {

        bottomView.backgroundColor = Color.bottomViewColor

        playButton.tintColor = UIColor.white
        playButton.addTarget(self, action: #selector(playButtonTaped), for: .touchUpInside)
        bottomView.addSubview(playButton)

        muteButton.tintColor = UIColor.white
        muteButton.addTarget(self, action: #selector(muteButtonTapped), for: .touchUpInside)
        bottomView.addSubview(muteButton)

        self.view.addSubview(bottomView)
    }

    func setupSearchBar() {

        searchBar.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 56)
        searchBar.delegate = self
        searchBar.placeholder = "Enter URL of video."
        searchBar.barTintColor = UIColor.clear
        self.view.addSubview(searchBar)

    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {

        if keyPath == "rate" {

            if let rate = change?[.newKey] as? Float {

                if rate == 0.0 {

                    isPalying = false

                } else if rate == 1.0 {

                    isPalying = true
                }
            }
        }
    }

    @objc func playButtonTaped() {

        if isPalying {

            self.avPlayer.pause()
            self.playButton.setTitle("Play", for: .normal)

        } else {

            self.avPlayer.play()
            self.playButton.setTitle("Pause", for: .normal)
        }

    }

    @objc func muteButtonTapped() {

        if isMuted {

            self.avPlayer.isMuted = false
            self.muteButton.setTitle("Mute", for: .normal)
            self.isMuted = false

        } else {

            self.avPlayer.isMuted = true
            self.muteButton.setTitle("Sound", for: .normal)
            self.isMuted = true
        }
    }

    deinit {
        self.avPlayerLayer.removeObserver(self, forKeyPath: "rate")
    }

}

extension VideoPlayerViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)

        guard
            let urlString = searchBar.text,
            let url = URL(string: urlString)
        else {
            return
        }

        self.avPlayer = AVPlayer(url: url)
        self.avPlayerLayer.player = self.avPlayer
        self.view.layer.addSublayer(self.avPlayerLayer)
        playButton.setTitle("Pause", for: .normal)
        muteButton.setTitle("Mute", for: .normal)

        self.avPlayer.addObserver(self, forKeyPath: "rate", options: .new, context: nil)

        self.avPlayer.play()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = nil
    }
}
