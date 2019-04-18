//
//  FriendPageTableViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 16/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class FriendPageTableViewController: UITableViewController {
    
    public var userID = 0
    
    public var posts: [Post] = [
        Post(ID: 1, authorID: 1, text: "90-летнему дедушке, который собирал банки, чтобы скопить на операцию, собрали деньги. Это всё вы, наши дорогие.Дяде Грише с Пражской очень нужна была операция на глаза, а денег не было: мошенники забрали всё скопленное. Весь чертановский (и не только) мир собрался с силами — и за неделю собрал ветерану больше 100 тысяч.", likeCount: 10, postDate: "11.01.2019"),
        Post(ID: 1, authorID: 2, text: "Итак, что вчера произошло с Милоновым: Виталий Валентинович приходит с другом на штрафстоянку, закатывает мощный скандал из-за машины и отправляется к администраторам, которые бьют его дверью. Боль, горечь, досада, заявление в полицию об избиении.", likeCount: 12, postDate: "12.01.2019"),
        Post(ID: 1, authorID: 1, text: "Собор Парижской Богоматери в огне — горит уже полчаса. Скорее всего, загорелись деревянные части ремонтных лесов. Реставрационные работы ведутся в соборе с начала апреля. Полностью горит крыша собора — так говорят очевидцы. В 2013 здание отметило свое 850-летие.", likeCount: 14, postDate: "13.01.2019"),
        Post(ID: 1, authorID: 3, text: "Это так ужасно — смотреть на то, как пылает Нотр Дам. Наверное, можно было бы использовать пожарные гидросамолеты. Надо действовать быстро! Дональд Трамп всегда (ну вот всегда) знает, что делать.", likeCount: 12, postDate: "14.01.2019"),
    ]
    
    public var users: [User] = [
        User(ID: 1, userName: "Нина Нинова", userPic: "user1"),
        User(ID: 2, userName: "Михаил Михайлов", userPic: "user2"),
        User(ID: 3, userName: "Николай Николаев", userPic: "user3"),
        User(ID: 4, userName: "Кристина Кристинина", userPic: "user4"),
        User(ID: 5, userName: "Александра Александрова", userPic: "user5"),
        User(ID: 6, userName: "Юрий Юрьев", userPic: "user6"),
        User(ID: 7, userName: "Алина Алинина", userPic: "user7"),
    ]
    
    lazy var userPosts = posts.filter({$0.authorID == userID})
    lazy var user = users.filter({$0.ID == userID})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseId, for: indexPath) as? PostTableViewCell else { fatalError("Cell can not be dequeued") }
        
        cell.authorName.text = user[0].userName
        cell.authorPic.avatarImage = UIImage(named: user[0].userPic)!
        cell.postText.text = userPosts[indexPath.row].text
        cell.postDate.text = userPosts[indexPath.row].postDate
        
        return cell
    }

}
