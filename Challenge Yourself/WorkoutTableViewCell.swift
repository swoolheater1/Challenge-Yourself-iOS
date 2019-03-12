//
//  WorkoutTableViewCell.swift
//  Challenge Yourself
//
//  Created by Sirang Woolheater on 1/6/19.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit
import WebKit

class WorkoutTableViewCell: UITableViewCell {

    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var workoutVideoWebKit: WKWebView!
    @IBOutlet var goal: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        workoutVideoWebKit.layer.cornerRadius = 15.0
        workoutVideoWebKit.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
