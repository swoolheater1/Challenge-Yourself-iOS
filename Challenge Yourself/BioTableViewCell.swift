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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profilePic.layer.cornerRadius = profilePic.frame.height/2
        profilePic.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
