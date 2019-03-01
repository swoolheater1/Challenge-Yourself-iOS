//
//  Exersice.swift
//  Challenge Yourself
//
//  Created by Sirang Woolheater on 1/6/19.
//  Copyright © 2019 CY. All rights reserved.
//

import Foundation

class Exercise {

    //MARK: Properties
    var type: String
    var name: String
    var goal: String
    var timeLimit: Int
    var youtubeID: String
    
    //MARK: Initialization
    init?(type: String, name: String, goal: String, timeLimit: Int, youtubeID: String) {
        guard !type.isEmpty else {
            return nil
        }
        guard !name.isEmpty else {
            return nil
        }
        guard !goal.isEmpty else {
            return nil
        }
        guard !youtubeID.isEmpty else {
            return nil
        }
        
        self.type = type
        self.name = name
        self.goal = goal
        self.timeLimit = timeLimit
        self.youtubeID = youtubeID
    }
}
