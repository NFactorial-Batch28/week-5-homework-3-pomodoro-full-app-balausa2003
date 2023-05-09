//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by Балауса Косжанова on 08.05.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
       var timer: Timer?
       var startTime: Date?
       var endTime: Date?
    var elapsedTime: TimeInterval = 0.0
    var secondsValue = 0
    var count = 0.1

    lazy private var background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgr")
        return imageView
    }()
    lazy private var focusButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("  Focus Category", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        btn.setImage(UIImage(systemName: "pencil"), for: .normal)
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        let originalColor = UIColor.white
        let opacity: CGFloat = 0.4
        let modifiedColor = originalColor.withAlphaComponent(opacity)
        btn.backgroundColor = modifiedColor
        btn.layer.cornerRadius = 16
        return btn
    }()
    lazy private  var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "25:00"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy private var descriptionText: UILabel = {
       let label = UILabel()
        label.text = "Focus on your task"
        label.textColor = .white
        
        return label
    }()
    lazy private var playButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "play"), for: .normal)
        btn.tintColor = .white
        let originalColor = UIColor.white
        let opacity: CGFloat = 0.4
        let modifiedColor = originalColor.withAlphaComponent(opacity)
        btn.backgroundColor = modifiedColor
        btn.layer.masksToBounds = true
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 56/2
        

        return btn
    }()
    lazy private var stopButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "stop.fill"), for: .normal)
        btn.tintColor = .white
        let originalColor = UIColor.white
        let opacity: CGFloat = 0.4
        let modifiedColor = originalColor.withAlphaComponent(opacity)
        btn.backgroundColor = modifiedColor
        btn.layer.masksToBounds = true
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 56/2
        

        return btn
    }()
    var isPaused = true
    
    override func viewDidLoad() {
        setUpViews()
        setUpConstraints()
        playButton.addTarget(self, action: #selector(pressedPlayButton), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(pressedStopButton), for: .touchUpInside)
        
       
        let circularProgress = CircularProgress(frame: CGRect(x: 140.0, y: 270.0, width: 100.0, height: 100.0))
        circularProgress.progressColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
              circularProgress.trackColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.3)
              circularProgress.tag = 101
        self.view.addSubview(circularProgress)
        
        super.viewDidLoad()
        
    
       
    }
     func animateProgress() {
           let cp = self.view.viewWithTag(101) as! CircularProgress
        
         while count <= 1 {
             count += 0.000001
         }
        
         cp.setProgressWithAnimation(duration: 1.0, value: Float(count))
       
       }

       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }

    @objc
    func pressedStopButton() {
                 timer?.invalidate()
                 timer = nil
                 isPaused = true
             
         }
    @objc
    func pressedPlayButton() {
        if isPaused {
            startTimer(duration: elapsedTime)
            isPaused = false
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            
        }
        else {
            timer?.invalidate()
            timer = nil
            isPaused = true
          
            isPaused = true
            playButton.setImage(UIImage(systemName: "play"), for: .normal)

        }
    }
        
    func startTimer(duration: TimeInterval) {
           if timer == nil {
               startTime = Date()
               timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
           }
       }
       @objc func updateTimer() {
           guard let startTime = startTime else {
                     return
                 }
                 
                 let currentTime = Date()
                 elapsedTime = currentTime.timeIntervalSince(startTime)
                 
                 let timeRemaining = max(0, 25 * 60 - elapsedTime)
                 
                 let minutes = Int(timeRemaining) / 60
                 let seconds = Int(timeRemaining) % 60
                 let formattedTime = String(format: "%02d:%02d", minutes, seconds)
           secondsValue = seconds
           
                 
                 timerLabel.text = formattedTime
                 
                 if timeRemaining <= 0 {
                     timer?.invalidate()
                     timer = nil
                     isPaused = false
                 }
             }

}
extension HomeViewController {
    func setUpViews() {
        view.addSubview(background)
        view.addSubview(focusButton)
        view.addSubview(timerLabel)
        view.addSubview(descriptionText)
        view.addSubview(playButton)
        view.addSubview(stopButton)
    }
    func setUpConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        focusButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(140)
            make.centerX.equalToSuperview()
            make.height.equalTo(36)
            make.width.equalTo(174)
        }
        timerLabel.snp.makeConstraints { make in
            make.top.equalTo(focusButton.snp.bottom).offset(100)
            make.centerX.equalToSuperview().inset(20)
        }
//        startButton.snp.makeConstraints { make in
//            make.top.equalTo(timerLabel.snp.bottom).inset(20)
//            make.centerX.equalToSuperview().inset(20)
//        }
        
        descriptionText.snp.makeConstraints { make in
            make.top.equalTo(timerLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        playButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionText.snp.bottom).offset(150)
            make.leading.equalToSuperview().inset(100)
            make.height.width.equalTo(56)
            
            
        }
        stopButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionText.snp.bottom).offset(150)
            make.leading.equalTo(playButton.snp.trailing).offset(80)
            make.height.width.equalTo(56)
        }
        
    }
}

