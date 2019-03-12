//
//  WorkoutContainerViewController.swift
//  Challenge Yourself
//
//  Created by Sirang Woolheater on 1/12/19.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class WorkoutContainerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet var timerContainer: UIView!
    
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    
    var resumeTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        pauseButton.isEnabled = false
        timerLabel.text = timeString(time: TimeInterval(seconds))
        
        timerContainer.layer.shadowColor = UIColor.black.cgColor
        timerContainer.layer.shadowOffset = CGSize(width: 0, height: -5.0)
        timerContainer.layer.shadowOpacity = 0.1
        timerContainer.layer.shadowRadius = 3.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
            self.startButton.isEnabled = false
        }
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume",for: .normal)
        } else {
            runTimer()
            self.resumeTapped = false
            self.pauseButton.setTitle("Pause",for: .normal)
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = 0
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        self.resumeTapped = false
        self.pauseButton.setTitle("Pause",for: .normal)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(WorkoutContainerViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        pauseButton.isEnabled = true
    }
    
    @objc func updateTimer() {
        if seconds >= 360000 - 1{ // will stop timer before it gets to 100 hours
            timer.invalidate()
            pauseButton.isEnabled = false
        } else {
            seconds += 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    // Format time
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        let milliseconds = Int(time)
        
//        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        return String(format:"%02i:%02i:%02i", minutes, seconds, milliseconds)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
