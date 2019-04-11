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
        Group(groupName: "ЁП", groupPicCircle: "group1"),
        Group(groupName: "Команда ВКонтакте", groupPicCircle: "group2"),
        Group(groupName: "КиноКайф - Лучшие фильмы", groupPicCircle: "group3"),
        Group(groupName: "Смешно до слез", groupPicCircle: "group4"),
        Group(groupName: "Новая Музыка 2019 | Новинки", groupPicCircle: "group5"),
        Group(groupName: "Киномания | Новинки 2019", groupPicCircle: "group6"),
        Group(groupName: "MDK", groupPicCircle: "group7"),
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
        cell.groupPicCircle.image = UIImage.init(named: groups[indexPath.row].groupPicCircle)
        
        return cell
    }

}
