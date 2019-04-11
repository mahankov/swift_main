//
//  FriendCollectionViewController.swift
//  Alter VK
//
//  Created by Anton Makhankov on 05/04/2019.
//  Copyright © 2019 Anton Makhankov. All rights reserved.
//

import UIKit

class FriendCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendCollectionViewCell.reuseId, for: indexPath) as? FriendCollectionViewCell else { fatalError("Cell can not be dequeued") }
    
        return cell
    }

}
