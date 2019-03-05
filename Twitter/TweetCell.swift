//
//  TweetCell.swift
//  Twitter
//
//  Created by Om Prakaash on 3/4/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
