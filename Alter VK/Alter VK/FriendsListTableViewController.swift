//
//  FriendsListTableViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 05/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit
import Foundation

class FriendsListTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - properties
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var usersArray = [User]()
    var curUsersArray = [User]()
    var firstLetters = [Character]()
    var sortedUsers = [Character: [User]]()
    
    // MARK: - functions
    
    private func sort(users: [User]) -> (firstLetters: [Character], sortedUsers: [Character: [User]]) {
        
        var firstLetters = [Character]()
        var sortedUsers = [Character: [User]]()
        
        for user in users {
            guard let firstLetter = user.userName.first else { continue }
            if sortedUsers[firstLetter] != nil {
                sortedUsers[firstLetter]!.append(user)
            } else {
                sortedUsers[firstLetter] = [user]
            }
        }
        
        firstLetters = Array(sortedUsers.keys.sorted())
        
        return (firstLetters, sortedUsers)
    }
    
    private func setUpUsers() {
        usersArray.append(User(ID: 1, userName: "Нина Нинова", userPic: "user1"))
        usersArray.append(User(ID: 2, userName: "Михаил Михайлов", userPic: "user2"))
        usersArray.append(User(ID: 3, userName: "Николай Николаев", userPic: "user3"))
        usersArray.append(User(ID: 4, userName: "Кристина Кристинина", userPic: "user4"))
        usersArray.append(User(ID: 5, userName: "Александра Александрова", userPic: "user5"))
        usersArray.append(User(ID: 6, userName: "Юрий Юрьев", userPic: "user6"))
        usersArray.append(User(ID: 7, userName: "Алина Алинина", userPic: "user7"))
        
        curUsersArray = usersArray
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            (firstLetters, sortedUsers) = sort(users: usersArray)
            table.reloadData()
            return
        }
        
        
        let curUsersArray = usersArray.filter({ (user) -> Bool in
            return user.userName.lowercased().contains(searchText.lowercased())
        })
        
        (firstLetters, sortedUsers) = sort(users: curUsersArray)
        table.reloadData()
    }
    
    //MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUsers()
        (firstLetters, sortedUsers) = sort(users: usersArray)
        table.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return firstLetters.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = firstLetters[section]
        guard let users = sortedUsers[letter] else { return 0 }
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  String(firstLetters[section])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.reuseId, for: indexPath) as? FriendsTableViewCell else { fatalError("Cell can not be dequeued") }
        
        let letter = firstLetters[indexPath.section]
        guard let users = sortedUsers[letter] else { return UITableViewCell() }
        let user = users[indexPath.row]
        
        cell.friendName.text = user.userName
        cell.friendPic.avatarImage = UIImage(named: user.userPic)!
        return cell
    }
    
    // MARK: - segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriend",
        let userPage = segue.destination as? FriendPageTableViewController,
        let indexPath = tableView.indexPathForSelectedRow {
            let letter = firstLetters[indexPath.section]
            guard let users = sortedUsers[letter] else { return }
            let userName = users[indexPath.row].userName
            let userID = users[indexPath.row].ID
            userPage.username = userName
            userPage.userID = userID
        }
    }
}
