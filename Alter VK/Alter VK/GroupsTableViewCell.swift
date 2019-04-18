//
//  GroupsTableViewCell.swift
//  Alter VK
//
//  Created by Anton Makhankov on 11/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    static let reuseId = "GroupsListCell";
    
    
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupPicCircle: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
