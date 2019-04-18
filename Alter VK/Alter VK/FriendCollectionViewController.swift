//
//  FriendCollectionViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 05/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class FriendCollectionViewController: UICollectionViewController {
    
    public var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = username
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendCollectionViewCell.reuseId, for: indexPath) as? FriendCollectionViewCell else { fatalError() }

        return cell
    }

}
