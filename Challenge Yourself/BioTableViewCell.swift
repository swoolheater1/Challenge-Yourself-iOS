//
//  BioTableViewCell.swift
//  Challenge Yourself
//
//  Created by Sirang Woolheater on 2/9/19.
//  Copyright © 2019 CY. All rights reserved.
//

import UIKit

class BioTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet var instructions: UITextView!
    @IBOutlet var equipment: UITextView!
    
    @IBOutlet var bioContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bioContainer.layer.cornerRadius = 15.0
        bioContainer.clipsToBounds = true
        
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.clipsToBounds = true
        instructions.text = "Hit the goal and move to the next exercise. Try and finish the workout as fast as you can but take breaks when you need them."
        equipment.text = "\u{2022} Yoga Mat"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
