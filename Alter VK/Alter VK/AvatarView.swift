//
//  avatarsView.swift
//  Alter VK
//
//  Created by Anton Makhankov on 14/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    var shadowColor: UIColor = .black
    var shadowRadius: CGFloat = 2
    var shadowOpacity: Float = 0.5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height/2
    }
}

class ClippedView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height/2
    }
}

class AvatarView: UIImageView {
    var shadowColor: UIColor = .black
    var shadowRadius: CGFloat = 2
    var shadowOpacity: Float = 0.3
    var avatarImage: UIImage = UIImage(named: "user2")! {
        didSet {
            clippedImageView.image = avatarImage
        }
    }
    
    let shadowView = ShadowView()
    let clippedImageView = ClippedView(frame: .zero)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.masksToBounds = false
        addSubview(shadowView)
        
        clippedImageView.image = avatarImage
        addSubview(clippedImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowView.frame = bounds
        clippedImageView.frame = bounds
    }
}
