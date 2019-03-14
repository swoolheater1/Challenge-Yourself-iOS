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
//        return sections.count
        return 2
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
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
                cell.goal.text = exercise.goal
                cell.workoutVideoWebKit.load(URLRequest(url: youtubeURL!))
                
                return cell
            }
        case 2:
            let exercise = exercises[indexPath.row]
            
            if exercise.type == "Bonus" {
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
            return 300
        case 1:
//            // open and close cells
//            if indexPath.row == selectedRowIndex.row {
//                // guard protects random crash
//                guard let row = tableView.cellForRow(at: indexPath) else { return 40 }
//                let cellHeight = row.bounds.height
//                // close open cell
//                if cellHeight == 220 {
//                    return 40
//                }
//                // open closed cell
//                return 220
//            }
            return 174
        case 2:
            return 40
        default:
            return 40
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
        case 2:
            tableView.deselectRow(at: indexPath, animated: true)
        default:
            return
        }
    }
    
    // MARK: Private Methods
    
    private func loadExercises() {
        guard
            let exercise1 = Exercise(type: "Workout", name: "Mountain Climbers", goal: "1 min", timeLimit: 1, youtubeID: "fBZHkGT0W5Y"),
            let exercise2 = Exercise(type: "Workout", name: "Forearm Plank", goal: "1 min", timeLimit: 1, youtubeID: "Zy78sjo1TZE"),
            let exercise3 = Exercise(type: "Workout", name: "Sit Ups", goal: "20 Reps", timeLimit: 1, youtubeID: "1fbU_MkV7NE"),
            let exercise4 = Exercise(type: "Workout", name: "Push Ups", goal: "20 Reps", timeLimit: 1, youtubeID: "eFOSh8vpd6I"),
            let exercise5 = Exercise(type: "Workout", name: "Squats", goal: "20 Reps", timeLimit: 1, youtubeID: "aclHkVaku9U"),
            let exercise6 = Exercise(type: "Workout", name: "Tricep Dips", goal: "20 Reps", timeLimit: 1, youtubeID: "pnt7HBOvUj8"),
            let exercise7 = Exercise(type: "Workout", name: "Burpees", goal: "1 min", timeLimit: 1, youtubeID: "dZgVxmf6jkA"),
            let exercise8 = Exercise(type: "Workout", name: "Lunges", goal: "20 Reps", timeLimit: 1, youtubeID: "QOVaHwm-Q6U"),
            let exercise9 = Exercise(type: "Workout", name: "Leg Lifts", goal: "20 Reps", timeLimit: 1, youtubeID: "JB2oyawG9KI"),
            let exercise10 = Exercise(type: "Workout", name: "Military Push Up", goal: "20 Reps", timeLimit: 1, youtubeID: "cnOS4D_snr8"),
            let exercise11 = Exercise(type: "Workout", name: "Glute Bridges", goal: "20 Reps", timeLimit: 1, youtubeID: "k4BQruxcpxw"),
            let exercise12 = Exercise(type: "Workout", name: "Superman", goal: "30 sec twice", timeLimit: 1, youtubeID: "VUT1RHyMEuc"),
            let exercise13 = Exercise(type: "Workout", name: "High Plank", goal: "1 min", timeLimit: 1, youtubeID: "5znHfRpjczc"),
            let exercise14 = Exercise(type: "Workout", name: "Stretch", goal: "5 min", timeLimit: 1, youtubeID: "2L2lnxIcNmo")
            else {
                fatalError("Unable to instantiate exersice")
        }
        
        exercises = [exercise1, exercise2, exercise3, exercise4, exercise5,
                      exercise6, exercise7, exercise8, exercise9, exercise10,
                      exercise11, exercise12, exercise13, exercise14]
    }

}
