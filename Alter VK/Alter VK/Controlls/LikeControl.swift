//
//  LikeControl.swift
//  Alter VK
//
//  Created by Anton Makhankov on 18/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class LikeControl: UIControl {
    
    @IBOutlet weak var postLikes: UILabel!
    
    public var isLiked: Bool = false
    let heartImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        heartImageView.isUserInteractionEnabled = true
        heartImageView.addGestureRecognizer(tapGR)
        
        addSubview(heartImageView)
        heartImageView.image = UIImage(named: "isnotliked")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        heartImageView.frame = bounds
    }
    
    //MARK: - Privates
    @objc func likeTapped() {
        isLiked.toggle()
        let postCurLikes = Int(postLikes.text!)
        
        if isLiked {
            heartImageView.image = UIImage(named: "isliked")
            postLikes.textColor = .red
            postLikes.text = String(postCurLikes! + 1)
        } else {
            heartImageView.image = UIImage(named: "isnotliked")
            postLikes.textColor = .black
            postLikes.text = String(postCurLikes! - 1)
        }
        
        sendActions(for: .valueChanged)
    }
}
