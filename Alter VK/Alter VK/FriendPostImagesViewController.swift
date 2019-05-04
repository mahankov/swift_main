//
//  FriendPostImagesViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 02/05/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class FriendPostImagesViewController: UIViewController {

    @IBOutlet weak var myBlock: UIView!
    
    public var postID = 0
    public var postData = [Post]()
    private var images = UIImageView()
    private var curImageNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(curImageNumber) of \(postData[0].postImages.count)"
        setupNavigation()
        setupImages()
        toggleNavigation(self)
    }
    
    private func setupNavigation() {
        let showNavigationGesture = UITapGestureRecognizer(target: self, action: #selector(toggleNavigation))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(showNavigationGesture)
        self.tabBarController!.tabBar.barStyle = .black
        self.navigationController!.navigationBar.barStyle = .black
    }
    
    private func setupImages() {
        let closeImagesGesture = UISwipeGestureRecognizer(target: self, action: #selector(closeImages))
        closeImagesGesture.direction = [.down, .up]
        
        let swipeImageRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeImagesRight))
        swipeImageRight.direction = .right
        
        let swipeImageLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeImagesLeft))
        swipeImageLeft.direction = .left
        
        let imagesContainer = UIView()
        imagesContainer.backgroundColor = .black
        imagesContainer.frame = self.view.frame
        imagesContainer.isUserInteractionEnabled = true
        imagesContainer.addGestureRecognizer(closeImagesGesture)
        imagesContainer.addGestureRecognizer(swipeImageRight)
        imagesContainer.addGestureRecognizer(swipeImageLeft)
        self.view.addSubview(imagesContainer)
        
        images = UIImageView()
        images.bounds = CGRect(x: 0, y: 0, width: 500, height: 500)
        images.frame = imagesContainer.frame
        images.contentMode = .scaleAspectFit
        images.image = UIImage(named: postData[0].postImages[0])
        images.isUserInteractionEnabled = false
        images.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        images.frame.origin = CGPoint(x: 0, y: 0)
        
        imagesContainer.addSubview(images)
    }
    
    @objc func toggleNavigation(_ sender: AnyObject) {
        let tabBar = self.tabBarController!.tabBar
        let navBar = self.navigationController!.navigationBar
        let navBarAnimation = CABasicAnimation(keyPath: "opacity")
        let tabBarAnimation = CABasicAnimation(keyPath: "opacity")
        if navBar.layer.opacity == 0 {
            navBarAnimation.fromValue = navBar.layer.opacity = 0
            navBarAnimation.toValue = navBar.layer.opacity = 1
            tabBarAnimation.fromValue = tabBar.layer.opacity = 0
            tabBarAnimation.toValue = tabBar.layer.opacity = 1
        } else {
            navBarAnimation.fromValue = navBar.layer.opacity = 1
            navBarAnimation.toValue = navBar.layer.opacity = 0
            tabBarAnimation.fromValue = tabBar.layer.opacity = 1
            tabBarAnimation.toValue = tabBar.layer.opacity = 0
            
        }
        navBarAnimation.duration = 1
        tabBarAnimation.duration = 1
        navBar.layer.add(navBarAnimation, forKey: nil)
        tabBar.layer.add(tabBarAnimation, forKey: nil)
    }
    
    @objc func closeImages(_ recognizer: UISwipeGestureRecognizer) {
        self.tabBarController!.tabBar.barStyle = .default
        self.navigationController!.navigationBar.barStyle = .default
        navigationController?.popViewController(animated: true)
    }
    
    
    func setInitialViewTransformLeftIn() {
        let rotation = CATransform3DMakeRotation(1.57, 0, 1, 0)
        self.images.frame.origin = CGPoint(x: 0, y: 0)
        self.images.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.images.transform = CATransform3DGetAffineTransform(rotation)
    }
    
    func setInitialViewTransformLeftOut() {
        let rotation = CATransform3DMakeRotation(0, 0, 1, 0)
        self.images.frame.origin = CGPoint(x: 0, y: 0)
        self.images.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.images.transform = CATransform3DGetAffineTransform(rotation)
    }
    
    func setInitialViewTransformRightIn() {
        let rotation = CATransform3DMakeRotation(-1.57, 0, 1, 0)
        self.images.frame.origin = CGPoint(x: self.images.frame.size.width, y: 0)
        self.images.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.images.transform = CATransform3DGetAffineTransform(rotation)
    }
    
    func setInitialViewTransformRightOut() {
        let rotation = CATransform3DMakeRotation(0, 0, 1, 0)
        self.images.frame.origin = CGPoint(x: self.images.frame.size.width, y: 0)
        self.images.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.images.transform = CATransform3DGetAffineTransform(rotation)
    }
    
    @objc func swipeImagesRight(_ recognizer: UISwipeGestureRecognizer) {
        if curImageNumber > 1 {
            curImageNumber -= 1
            title = "\(curImageNumber) of \(postData[0].postImages.count)"
            UIView.animate(withDuration: 0.5, animations: {
                self.setInitialViewTransformRightIn()
            }, completion: { _ in
                self.images.image = UIImage(named: self.postData[0].postImages[self.curImageNumber - 1])
                UIView.animate(withDuration: 0.5, animations: {
                    self.setInitialViewTransformRightOut()
                }, completion: nil)
            })
        } else {
            
        }
    }
    
    @objc func swipeImagesLeft(_ recognizer: UISwipeGestureRecognizer) {
        if curImageNumber < postData[0].postImages.count {
            curImageNumber += 1
            title = "\(curImageNumber) of \(postData[0].postImages.count)"
            UIView.animate(withDuration: 0.5, animations: {
                self.setInitialViewTransformLeftIn()
            }, completion: { _ in
                self.images.image = UIImage(named: self.postData[0].postImages[self.curImageNumber - 1])
                UIView.animate(withDuration: 0.5, animations: {
                    self.setInitialViewTransformLeftOut()
                }, completion: nil)
            })
        } else {
            
        }
    }
}
