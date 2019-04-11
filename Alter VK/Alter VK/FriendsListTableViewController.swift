//
//  FriendsListTableViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 05/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    private let friends: [Friend] = [
        Friend(userName: "Нина Нинова", userPicCircle: "user1"),
        Friend(userName: "Марина Маринина", userPicCircle: "user2"),
        Friend(userName: "Михаил Михайлов", userPicCircle: "user3"),
        Friend(userName: "Кристина Кристинина", userPicCircle: "user4"),
        Friend(userName: "Александра Александрова", userPicCircle: "user5"),
        Friend(userName: "Юрий Юрьев", userPicCircle: "user6"),
        Friend(userName: "Борис Борисов", userPicCircle: "user7"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.reuseId, for: indexPath) as? FriendsTableViewCell else { fatalError("Cell can not be dequeued") }
        
        cell.friendName.text = friends[indexPath.row].userName
        cell.friendPicCircle.image = UIImage.init(named: friends[indexPath.row].userPicCircle)
        
        return cell
    }

}
