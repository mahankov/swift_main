//
//  PostTableViewCell.swift
//  Alter VK
//
//  Created by Anton Makhankov on 16/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    static let reuseId = "PostsListCell";
    
    @IBOutlet weak var authorPic: AvatarView!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postLikesCounter: UILabel!
}
