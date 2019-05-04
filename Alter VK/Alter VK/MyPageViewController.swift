//
//  MyPageViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 03/05/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    var loader = LoaderView()
    
    @IBOutlet weak var switchButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader = LoaderView()
        loader.frame.origin = CGPoint(x: self.view.frame.size.width / 2 - 50, y: self.view.frame.size.height / 2)
        self.view.addSubview(loader)
    }
    
    @IBAction func loaderSwith() {
        if switchButton.isOn {
            loader.startAnimation()
        } else {
            loader.stopAnimation()
        }
    }
}
