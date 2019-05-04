//
//  LoaderView.swift
//  Alter VK
//
//  Created by Anton Makhankov on 03/05/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class LoaderView: UIView {

    let dot1 = UIView()
    let dot2 = UIView()
    let dot3 = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        startAnimation()
    }
    
    private func setupView() {
        
        self.frame.size = CGSize(width: 100, height: 50)
        
        dot1.layer.cornerRadius = 10
        dot1.clipsToBounds = true
        dot1.backgroundColor = .lightGray
        
        dot2.layer.cornerRadius = 10
        dot2.clipsToBounds = true
        dot2.backgroundColor = .lightGray
        
        dot3.layer.cornerRadius = 10
        dot3.clipsToBounds = true
        dot3.backgroundColor = .lightGray
        
        self.addSubview(dot1)
        self.addSubview(dot2)
        self.addSubview(dot3)
    }
    
    override func layoutSubviews() {
        let size = CGSize(width: 20, height: 20)
        let offset = self.bounds.size.width / 3
        let origin1 = CGPoint(x: 0, y: 0)
        let origin2 = CGPoint(x: offset, y: 0)
        let origin3 = CGPoint(x: 2 * offset, y: 0)
        
        dot1.frame = CGRect(origin: origin1, size: size)
        dot2.frame = CGRect(origin: origin2, size: size)
        dot3.frame = CGRect(origin: origin3, size: size)
    }
    
    public func startAnimation() {
        dot1.layer.opacity = 1
        dot2.layer.opacity = 1
        dot3.layer.opacity = 1
        UIView.animate(withDuration: 0.6, delay: 0, options: [.autoreverse, .curveEaseInOut, .repeat], animations: {
            self.dot1.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.3, options: [.autoreverse, .curveEaseInOut, .repeat], animations: {
            self.dot2.alpha = 0
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 0.6, options: [.autoreverse, .curveEaseInOut, .repeat], animations: {
            self.dot3.alpha = 0
        }, completion: nil)
    }
    
    public func stopAnimation() {
        dot1.layer.removeAllAnimations()
        dot2.layer.removeAllAnimations()
        dot3.layer.removeAllAnimations()
    }
    
}
