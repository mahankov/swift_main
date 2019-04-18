//
//  GroupTableViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 05/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class AllGroupsListTableViewController: UITableViewController {

    public var groups: [Group] = [
        Group(ID: 1, groupName: "Команда ВКонтакте", groupPic: "group2"),
        Group(ID: 2, groupName: "КиноКайф - Лучшие фильмы", groupPic: "group3"),
        Group(ID: 3, groupName: "Новая Музыка 2019 | Новинки", groupPic: "group5"),
        Group(ID: 4, groupName: "Киномания | Новинки 2019", groupPic: "group6"),
        Group(ID: 5, groupName: "MDK", groupPic: "group7"),
        Group(ID: 6, groupName: "Смешно до слез", groupPic: "group4"),
        Group(ID: 7, groupName: "ЁП", groupPic: "group1"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.reuseId, for: indexPath) as? GroupsTableViewCell else { fatalError("Cell can not be dequeued") }
        
        cell.groupName.text = groups[indexPath.row].groupName
        cell.groupPic.avatarImage = UIImage(named: groups[indexPath.row].groupPic)!
        
        return cell
    }

}
