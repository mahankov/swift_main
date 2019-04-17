//
//  GroupsListTableViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 05/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class CurGroupsListTableViewController: UITableViewController {

    public var groups: [Group] = [
        Group(ID: 1, groupName: "Команда ВКонтакте", groupPic: "group2"),
        Group(ID: 2, groupName: "КиноКайф - Лучшие фильмы", groupPic: "group3"),
        Group(ID: 3, groupName: "Новая Музыка 2019 | Новинки", groupPic: "group5"),
        Group(ID: 4, groupName: "Киномания | Новинки 2019", groupPic: "group6"),
        Group(ID: 5, groupName: "MDK", groupPic: "group7"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.reuseId, for: indexPath) as? GroupsTableViewCell else { fatalError("Cell can not be dequeued") }

        cell.groupName.text = groups[indexPath.row].groupName
        cell.groupPic.avatarImage = UIImage(named: groups[indexPath.row].groupPic)!

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if let allGroupsList = segue.source as? AllGroupsListTableViewController,
        let indexPath = allGroupsList.tableView.indexPathForSelectedRow {
            
                let newGroup = allGroupsList.groups[indexPath.row]
            
                guard !groups.contains(where: { (group) -> Bool in
                    return group.ID == newGroup.ID
                }) else { return }
            
                groups.append(newGroup)
                let newIndexPath = IndexPath(item: groups.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        }
        
    }
    
    /* Will be use after creating view for group
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowGroup",
            let groupVC = segue.destination as? FriendCollectionViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            let groupName = groups[indexPath.row].groupName
            groupVC.groupName = groupName
        }
    }
    */
}
