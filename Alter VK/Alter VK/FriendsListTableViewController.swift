//
//  FriendsListTableViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 05/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    private let users: [User] = [
        User(ID: 1, userName: "Нина Нинова", userPic: "user1"),
        User(ID: 2, userName: "Михаил Михайлов", userPic: "user2"),
        User(ID: 3, userName: "Николай Николаев", userPic: "user3"),
        User(ID: 4, userName: "Кристина Кристинина", userPic: "user4"),
        User(ID: 5, userName: "Александра Александрова", userPic: "user5"),
        User(ID: 6, userName: "Юрий Юрьев", userPic: "user6"),
        User(ID: 7, userName: "Алина Алинина", userPic: "user7"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.reuseId, for: indexPath) as? FriendsTableViewCell else { fatalError("Cell can not be dequeued") }
        
        cell.friendName.text = users[indexPath.row].userName
        cell.friendPic.avatarImage = UIImage(named: users[indexPath.row].userPic)!
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriend",
            let userPage = segue.destination as? FriendPageTableViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            let friendID = users[indexPath.row].ID
            userPage.userID = friendID
        }
    }
    
}
