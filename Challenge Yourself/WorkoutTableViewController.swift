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
        
        let youtubeURL = URL(string: "https://www.youtube.com/embed/r25IWquxe9s")
        
        
        cell.exerciseName.text = exercise.name
        cell.workoutVideoWebKit.load(URLRequest(url: youtubeURL!))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex.row {
            return 300
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
        guard let exercise1 = Exercise(name: "1) PUSH UPS!") else {
            fatalError("Unable to instantiate exercise1")
        }
        guard let exercise2 = Exercise(name: "2) SQUAT") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise3 = Exercise(name: "3) RUN") else {
            fatalError("Unable to instantiate exersice2")
        }
        guard let exercise4 = Exercise(name: "4) CRUNCH") else {
            fatalError("Unable to instantiate exersice2")
        }
        
        exercises += [exercise1, exercise2, exercise3, exercise4]
    }

}
