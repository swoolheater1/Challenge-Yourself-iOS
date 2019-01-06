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
    var name: String
//    var youtubeID: String
    
    //MARK: Initialization
    init?(name: String) {
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
    }}
