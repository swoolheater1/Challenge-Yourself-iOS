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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return exercises.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "WorkoutTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WorkoutTableViewCell else {
            fatalError("The dequeued cell is not an instance of WorkoutTableViewCell.")
        }
        
        let exercise = exercises[indexPath.row]
        
        let youtubeURL = URL(string: "https://www.youtube.com/embed/\(exercise.youtubeID)")
        
        cell.exerciseName.text = exercise.name
        cell.workoutVideoWebKit.load(URLRequest(url: youtubeURL!))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
    }
    
    var selectedRowIndex: IndexPath = IndexPath(row: -1, section: 0)
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowIndex = indexPath
        tableView.beginUpdates()
        tableView.endUpdates()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: Private Methods
    
    private func loadExercises() {
        guard let exercise1 = Exercise(name: "Mountain Climbers ~ 1 min", youtubeID: "fBZHkGT0W5Y") else {
            fatalError("Unable to instantiate exercise1")
        }
        guard let exercise2 = Exercise(name: "Forearm Plank ~ 1 min", youtubeID: "Zy78sjo1TZE") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise3 = Exercise(name: "20 Sit Ups", youtubeID: "1fbU_MkV7NE") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise4 = Exercise(name: "20 Push Ups", youtubeID: "eFOSh8vpd6I") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise5 = Exercise(name: "20 Squats", youtubeID: "aclHkVaku9U") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise6 = Exercise(name: "20 Tricep Dips", youtubeID: "pnt7HBOvUj8") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise7 = Exercise(name: "Burpees ~ 1 min", youtubeID: "dZgVxmf6jkA") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise8 = Exercise(name: "20 Lunges", youtubeID: "QOVaHwm-Q6U") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise9 = Exercise(name: "20 Leg Lifts", youtubeID: "JB2oyawG9KI") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise10 = Exercise(name: "20 Military Push Up", youtubeID: "cnOS4D_snr8") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise11 = Exercise(name: "20 Glute Bridges", youtubeID: "k4BQruxcpxw") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise12 = Exercise(name: "Superman ~ 30 sec X2", youtubeID: "VUT1RHyMEuc") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise13 = Exercise(name: "High Plank ~ 1 min", youtubeID: "5znHfRpjczc") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise14 = Exercise(name: "Stretch ~ 5 min", youtubeID: "2L2lnxIcNmo") else {
            fatalError("Unable to instantiate exersice2")
        }
        
        exercises += [exercise1, exercise2, exercise3, exercise4, exercise5,
                      exercise6, exercise7, exercise8, exercise9, exercise10,
                      exercise11, exercise12, exercise13, exercise14]
    }

}
