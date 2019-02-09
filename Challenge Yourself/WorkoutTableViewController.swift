//
//  WorkoutTableViewController.swift
//  Challenge Yourself
//
//  Created by Sirang Woolheater on 1/6/19.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class WorkoutTableViewController: UITableViewController {
    
    // MARK: Properties
    let sections = ["Bio", "Workout", "BONUS!"]
    var exercises = [Exercise]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load exersices
        loadExercises()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return exercises.count
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellIdentifier = "BioTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BioTableViewCell else {
                fatalError("The dequeued cell is not an instance of WorkoutTableViewCell.")
            }
            
            return cell
        case 1:
            let exercise = exercises[indexPath.row]
            
            if exercise.type == "Workout" {
                let cellIdentifier = "WorkoutTableViewCell"
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WorkoutTableViewCell else {
                    fatalError("The dequeued cell is not an instance of WorkoutTableViewCell.")
                }
                
                let youtubeURL = URL(string: "https://www.youtube.com/embed/\(exercise.youtubeID)")
                
                cell.exerciseName.text = exercise.name
                cell.workoutVideoWebKit.load(URLRequest(url: youtubeURL!))
                
                return cell
            }
        default:
            return UITableViewCell()
        }
        // Table view cells are reused and should be dequeued using a cell identifier.
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 340
        case 1:
            // open and close cells
            if indexPath.row == selectedRowIndex.row {
                // guard protects random crash
                guard let row = tableView.cellForRow(at: indexPath) else { return 50 }
                let cellHeight = row.bounds.height
                // close open cell
                if cellHeight == 220 {
                    return 50
                }
                // open closed cell
                return 220
            }
            return 50
        case 2:
            // open and close cells
            if indexPath.row == selectedRowIndex.row {
                // guard protects random crash
                guard let row = tableView.cellForRow(at: indexPath) else { return 50 }
                let cellHeight = row.bounds.height
                // close open cell
                if cellHeight == 220 {
                    return 50
                }
                // open closed cell
                return 220
            }
            return 50
        default:
            return 50
        }
    }
    
    var selectedRowIndex: IndexPath = IndexPath(row: -1, section: 0)
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            selectedRowIndex = indexPath
            tableView.beginUpdates()
            tableView.endUpdates()
            tableView.deselectRow(at: indexPath, animated: true)
        default:
            return
        }
    }
    
    // MARK: Private Methods
    
    private func loadExercises() {
        guard
            let exercise1 = Exercise(type: "Workout", name: "Mountain Climbers ~ 1 min", youtubeID: "fBZHkGT0W5Y"),
            let exercise2 = Exercise(type: "Workout", name: "Forearm Plank ~ 1 min", youtubeID: "Zy78sjo1TZE"),
            let exercise3 = Exercise(type: "Workout", name: "20 Sit Ups", youtubeID: "1fbU_MkV7NE"),
            let exercise4 = Exercise(type: "Workout", name: "20 Push Ups", youtubeID: "eFOSh8vpd6I"),
            let exercise5 = Exercise(type: "Workout", name: "20 Squats", youtubeID: "aclHkVaku9U"),
            let exercise6 = Exercise(type: "Workout", name: "20 Tricep Dips", youtubeID: "pnt7HBOvUj8"),
            let exercise7 = Exercise(type: "Workout", name: "Burpees ~ 1 min", youtubeID: "dZgVxmf6jkA"),
            let exercise8 = Exercise(type: "Workout", name: "20 Lunges", youtubeID: "QOVaHwm-Q6U"),
            let exercise9 = Exercise(type: "Workout", name: "20 Leg Lifts", youtubeID: "JB2oyawG9KI"),
            let exercise10 = Exercise(type: "Workout", name: "20 Military Push Up", youtubeID: "cnOS4D_snr8"),
            let exercise11 = Exercise(type: "Workout", name: "20 Glute Bridges", youtubeID: "k4BQruxcpxw"),
            let exercise12 = Exercise(type: "Workout", name: "Superman ~ 30 sec X2", youtubeID: "VUT1RHyMEuc"),
            let exercise13 = Exercise(type: "Workout", name: "High Plank ~ 1 min", youtubeID: "5znHfRpjczc"),
            let exercise14 = Exercise(type: "Workout", name: "Stretch ~ 5 min", youtubeID: "2L2lnxIcNmo")
            else {
                fatalError("Unable to instantiate exersice2")
        }
        
        exercises = [exercise1, exercise2, exercise3, exercise4, exercise5,
                      exercise6, exercise7, exercise8, exercise9, exercise10,
                      exercise11, exercise12, exercise13, exercise14]
    }

}
