//
//  FriendsTableViewCell.swift
//  Alter VK
//
//  Created by Anton Makhankov on 11/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    static let reuseId = "FriendsListCell";
    
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendPic: AvatarView!
    
}
