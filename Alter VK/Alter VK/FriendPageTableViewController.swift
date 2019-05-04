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
    public var username = ""
    var postsArray = [Post]()
    var usersArray = [User]()
    var tappedImagesId = 0
    
    
    @objc func showImage(_ sender: AnyObject) {
        tappedImagesId = Int(sender.view!.accessibilityIdentifier!)!
        performSegue(withIdentifier: "showImages", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController!.tabBar.barStyle = .default
        self.navigationController!.navigationBar.barStyle = .default
        setupPosts()
        setupUsers()
        title = username
    }
    
    private func setupPosts() {
        postsArray.append(Post(ID: 1, authorID: 1, text: "90-летнему дедушке, который собирал банки, чтобы скопить на операцию, собрали деньги. Это всё вы, наши дорогие.Дяде Грише с Пражской очень нужна была операция на глаза, а денег не было: мошенники забрали всё скопленное. Весь чертановский (и не только) мир собрался с силами — и за неделю собрал ветерану больше 100 тысяч.", likeCount: 10, postDate: "11.01.2019", postImages: ["postImage-1-1","postImage-2-1"]))
        postsArray.append(Post(ID: 2, authorID: 2, text: "Итак, что вчера произошло с Милоновым: Виталий Валентинович приходит с другом на штрафстоянку, закатывает мощный скандал из-за машины и отправляется к администраторам, которые бьют его дверью. Боль, горечь, досада, заявление в полицию об избиении.", likeCount: 12, postDate: "12.01.2019", postImages: ["postImage-2-1"]))
        postsArray.append(Post(ID: 3, authorID: 1, text: "Собор Парижской Богоматери в огне — горит уже полчаса. Скорее всего, загорелись деревянные части ремонтных лесов. Реставрационные работы ведутся в соборе с начала апреля. Полностью горит крыша собора — так говорят очевидцы. В 2013 здание отметило свое 850-летие.", likeCount: 14, postDate: "13.01.2019", postImages: ["postImage-3-1","postImage-2-1","postImage-1-1","postImage-4-1","postImage-2-1"]))
        postsArray.append(Post(ID: 4, authorID: 3, text: "Это так ужасно — смотреть на то, как пылает Нотр Дам. Наверное, можно было бы использовать пожарные гидросамолеты. Надо действовать быстро! Дональд Трамп всегда (ну вот всегда) знает, что делать.", likeCount: 12, postDate: "14.01.2019", postImages: ["postImage-4-1","postImage-3-1","postImage-2-1"]))
        postsArray.append(Post(ID: 5, authorID: 4, text: "Это так ужасно — смотреть на то, как пылает Нотр Дам. Наверное, можно было бы использовать пожарные гидросамолеты. Надо действовать быстро! Дональд Трамп всегда (ну вот всегда) знает, что делать.", likeCount: 12, postDate: "14.01.2019", postImages: ["postImage-4-1"]))
        postsArray.append(Post(ID: 6, authorID: 5, text: "Это так ужасно — смотреть на то, как пылает Нотр Дам. Наверное, можно было бы использовать пожарные гидросамолеты. Надо действовать быстро! Дональд Трамп всегда (ну вот всегда) знает, что делать.", likeCount: 12, postDate: "14.01.2019", postImages: ["postImage-4-1"]))
        postsArray.append(Post(ID: 7, authorID: 6, text: "Это так ужасно — смотреть на то, как пылает Нотр Дам. Наверное, можно было бы использовать пожарные гидросамолеты. Надо действовать быстро! Дональд Трамп всегда (ну вот всегда) знает, что делать.", likeCount: 12, postDate: "14.01.2019", postImages: ["postImage-4-1"]))
        postsArray.append(Post(ID: 8, authorID: 7, text: "Это так ужасно — смотреть на то, как пылает Нотр Дам. Наверное, можно было бы использовать пожарные гидросамолеты. Надо действовать быстро! Дональд Трамп всегда (ну вот всегда) знает, что делать.", likeCount: 12, postDate: "14.01.2019", postImages: []))
    }
    
    private func setupUsers() {
        usersArray.append(User(ID: 1, userName: "Нина Нинова", userPic: "user1"))
        usersArray.append(User(ID: 2, userName: "Михаил Михайлов", userPic: "user2"))
        usersArray.append(User(ID: 3, userName: "Николай Николаев", userPic: "user3"))
        usersArray.append(User(ID: 4, userName: "Кристина Кристинина", userPic: "user4"))
        usersArray.append(User(ID: 5, userName: "Александра Александрова", userPic: "user5"))
        usersArray.append(User(ID: 6, userName: "Юрий Юрьев", userPic: "user6"))
        usersArray.append(User(ID: 7, userName: "Алина Алинина", userPic: "user7"))
    }
    
    lazy var userPosts = postsArray.filter({$0.authorID == userID})
    lazy var user = usersArray.filter({$0.ID == userID})
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseId, for: indexPath) as? PostTableViewCell else { fatalError("Cell can not be dequeued") }

        let showImageGesture = UITapGestureRecognizer(target: self, action: #selector(showImage))
        
        cell.authorName.text = user[0].userName
        cell.authorPic.avatarImage = UIImage(named: user[0].userPic)!
        cell.postText.text = userPosts[indexPath.row].text
        cell.postDate.text = userPosts[indexPath.row].postDate
        cell.postLikesCounter.text = String(userPosts[indexPath.row].likeCount)
        
        cell.postImages.isUserInteractionEnabled = true
        cell.postImages.addGestureRecognizer(showImageGesture)
        cell.postImages.accessibilityIdentifier = String(userPosts[indexPath.row].ID)
        
        let imagesCount = userPosts[indexPath.row].postImages.count
        
        let maxImagesInRow = 2
        let maxImagesRows = 2
        
        var imageSubViewX = 0
        var imageSubViewY = 0
        var imageSubViewWidth = Int(cell.postImages.frame.size.width)
        var imageSubViewHeight = Int(cell.postImages.frame.size.height)
        
        switch imagesCount {
            case 0:
                cell.postImages.removeFromSuperview()
            case 1:
                let imageSubView = UIImageView()
                imageSubView.image = UIImage(named: userPosts[indexPath.row].postImages[0])
                imageSubView.clipsToBounds = true
                imageSubView.contentMode = .scaleAspectFill
                imageSubView.frame = CGRect(x: imageSubViewX, y: imageSubViewY, width: imageSubViewWidth, height: imageSubViewHeight)
                cell.postImages.addSubview(imageSubView)
            
            case 2:
                imageSubViewWidth /= 2
                for image in userPosts[indexPath.row].postImages {
                    let imageSubView = UIImageView()
                    imageSubView.image = UIImage(named: image)
                    imageSubView.clipsToBounds = true
                    imageSubView.contentMode = .scaleAspectFill
                    imageSubView.frame = CGRect(x: imageSubViewX, y: imageSubViewY, width: imageSubViewWidth, height: imageSubViewHeight)
                    cell.postImages.addSubview(imageSubView)
                    
                    imageSubViewX += imageSubViewWidth
                }
            case 3:
                var curImageInRow = 0
                imageSubViewWidth /= maxImagesInRow
                imageSubViewHeight /= maxImagesInRow
                for image in userPosts[indexPath.row].postImages {
                    curImageInRow += 1
                    let imageSubView = UIImageView()
                    imageSubView.image = UIImage(named: image)
                    imageSubView.clipsToBounds = true
                    imageSubView.contentMode = .scaleAspectFill
                    imageSubView.frame = CGRect(x: imageSubViewX, y: imageSubViewY, width: imageSubViewWidth, height: imageSubViewHeight)
                    cell.postImages.addSubview(imageSubView)
                    
                    if curImageInRow == maxImagesInRow {
                        imageSubViewX = 0
                        imageSubViewY = imageSubViewHeight
                        imageSubViewWidth *= 2
                        curImageInRow = 0
                    } else {
                        imageSubViewX += imageSubViewWidth
                        imageSubViewY = 0
                    }
                }
            case 4:
                var curImageInRow = 0
                var curRow = 1
                imageSubViewWidth /= maxImagesInRow
                imageSubViewHeight /= maxImagesInRow
                for image in userPosts[indexPath.row].postImages {
                    curImageInRow += 1
                    let imageSubView = UIImageView()
                    imageSubView.image = UIImage(named: image)
                    imageSubView.clipsToBounds = true
                    imageSubView.contentMode = .scaleAspectFill
                    imageSubView.frame = CGRect(x: imageSubViewX, y: imageSubViewY, width: imageSubViewWidth, height: imageSubViewHeight)
                    cell.postImages.addSubview(imageSubView)
                    
                    if curImageInRow == maxImagesInRow {
                        imageSubViewX = 0
                        imageSubViewY = imageSubViewHeight
                        curImageInRow = 0
                        curRow += 1
                    } else {
                        imageSubViewX += imageSubViewWidth
                        imageSubViewY = imageSubViewHeight * curRow - imageSubViewHeight
                    }
                }
            default:
                var curImageInRow = 0
                var curRow = 1
                imageSubViewWidth /= maxImagesInRow
                imageSubViewHeight /= maxImagesInRow
                for image in userPosts[indexPath.row].postImages {
                    curImageInRow += 1
                    let imageSubView = UIImageView()
                    imageSubView.image = UIImage(named: image)
                    imageSubView.clipsToBounds = true
                    imageSubView.contentMode = .scaleAspectFill
                    imageSubView.frame = CGRect(x: imageSubViewX, y: imageSubViewY, width: imageSubViewWidth, height: imageSubViewHeight)
                    cell.postImages.addSubview(imageSubView)
                    
                    if curImageInRow == maxImagesInRow && curRow <= maxImagesRows {
                        imageSubViewX = 0
                        imageSubViewY = imageSubViewHeight
                        curImageInRow = 0
                        curRow += 1
                    } else if curRow <= maxImagesRows {
                        imageSubViewX += imageSubViewWidth
                        imageSubViewY = imageSubViewHeight * curRow - imageSubViewHeight
                    } else {
                        let lastSubView = UILabel()
                        lastSubView.frame = CGRect(x: (imageSubViewX + imageSubViewWidth), y: imageSubViewY, width: imageSubViewWidth, height: imageSubViewHeight)
                        lastSubView.font = lastSubView.font.withSize(40)
                        lastSubView.textColor = .white
                        lastSubView.text = "+\(String(imagesCount - 3))"
                        lastSubView.backgroundColor = .black
                        lastSubView.layer.opacity = 0.7
                        lastSubView.textAlignment = .center
                        cell.postImages.addSubview(lastSubView)
                        break
                    }
                }
            }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImages" {
            let imagesPage = segue.destination as? FriendPostImagesViewController
            imagesPage!.postID = tappedImagesId
            imagesPage!.postData = postsArray.filter({$0.ID == tappedImagesId})
        }
    }
}
