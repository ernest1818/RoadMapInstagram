//
//  StoriesViewController.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 20.10.2022.
//

import AVFoundation
import UIKit

/// Экран отображения историй
final class StoriesViewController: UIViewController {

    private enum Constants {
        static let firstImageName = "6"
        static let secondImageName = "7"
        static let therdImageName = "8"
    }
    
    // MARK: - Private IBOutlets
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet private weak var storiesProgressView: UIProgressView!
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet weak var secondProgressView: UIProgressView!
    @IBOutlet private weak var userNameLabel: UILabel!
    
    // MARK: - Public properties
    var imageName: String?
    var nameText: String?
    
    // MARK: - Private properties
    private var timer = Timer()
    private var player = AVPlayer()
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        createVideoplayer()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Private IBActions
    @IBAction private func closedAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        createProgressView()
        cresteUI()
    }
    
    private func createVideoplayer() {
        guard let url = Bundle.main.url(forResource: "video", withExtension: "MOV") else { return }
        let item = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: item)
        
    }
    
    private func createProgressView() {
        storiesProgressView.setProgress(0.0, animated: true)
        timer = Timer.scheduledTimer(timeInterval: 0.0003,
                                     target: self,
                                     selector: #selector(progressAction),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func cresteUI() {
        userImageView.image = UIImage(named: imageName ?? "")
        userNameLabel.text = nameText
    }
    
    @objc private func progressAction() {
        storiesProgressView.progress += 0.0001
        if storiesProgressView.progress == 1 {
            contentImage.image = nil
            timer.invalidate()
            let interval = CMTime(seconds: 0.0001, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
            player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] _ in
                self?.secondProgressView.progress += (1 / 15) / 100
                if self?.secondProgressView.progress == 1 {
                    self?.player.pause()
                    self?.dismiss(animated: true)
                }
            }
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = contentImage.bounds
            contentImage.layer.addSublayer(playerLayer)
            player.play()
            storiesProgressView.setProgress(1, animated: false)
        }
    }
}
