//
//  ViewController.swift
//  EggTimer
//


import UIKit
import AVFoundation

class ViewController: UIViewController {

    let eggTimes = ["Soft":300, "Medium": 420,"Hard":720]
    var counter : Int = 0
    var totalTime = 0

    var myTimer = Timer()

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        progressBar.progress = 0.0
        titleLabel.text = hardness
        counter = 0
        totalTime = eggTimes[hardness!]!
        myTimer.invalidate()
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if counter < totalTime{
            let percentageProgress = Float(counter)/Float(totalTime)
            progressBar.progress = percentageProgress
            counter += 1
        }else {
            myTimer.invalidate()
            titleLabel.text = "Done"
            progressBar.progress = 1.0
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()

        }
                
    }
    
}
