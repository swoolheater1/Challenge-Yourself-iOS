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
    @IBOutlet var resetButton: UIButton!
    
    @IBOutlet var timerContainer: UIView!
    
    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    var status: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        resetButton.isEnabled = false
        
        timerContainer.layer.shadowColor = UIColor.black.cgColor
        timerContainer.layer.shadowOffset = CGSize(width: 0, height: -5.0)
        timerContainer.layer.shadowOpacity = 0.1
        timerContainer.layer.shadowRadius = 3.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startStopButtonTapped(_ sender: UIButton) {
        if (status) {
            stop()
            sender.setTitle("Start", for: .normal)
            resetButton.isEnabled = true
        } else {
            start()
            sender.setTitle("Stop", for: .normal)
            resetButton.isEnabled = false
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        
        // Reset timer variables
        startTime = 0
        time = 0
        elapsed = 0
        status = false
        
        // Reset timer label
        timerLabel.text = "00:00:00"
    }
    
    func start() {
        startTime = Date.timeIntervalSinceReferenceDate - elapsed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        status = true
    }
    
    func stop() {
        elapsed = Date.timeIntervalSinceReferenceDate - startTime
        timer?.invalidate()
        
        status = false
    }
    
    @objc func updateCounter() {
        // Calculate the total time since the timer started in seconds
        time = Date.timeIntervalSinceReferenceDate - startTime
        
        // Calculate minutes
        let minutes = Int(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        
        // Calculate seconds
        let seconds = Int(time)
        time -= TimeInterval(seconds)
        
        // Calculate milliseconds
        let milliseconds = Int(time * 100)
        
        // Format time
        let timeString = String(format:"%02d:%02d:%02d", minutes, seconds, milliseconds)
        
        // Add time to label
        timerLabel.text = timeString
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
