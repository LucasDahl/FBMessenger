//
//  ViewController.swift
//  FBMessenger
//
//  Created by Lucas Dahl on 1/16/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class FriendsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // Properties
    private let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background
        collectionView.backgroundColor = UIColor.white
        
        // Register the cell class
        collectionView.register(FriendCell.self, forCellWithReuseIdentifier: cellId)
        
        // Allow for dragging up and down, even if there is not enough cells
        collectionView.alwaysBounceVertical = true
        
    }

    
    //===============================
    // MARK: - ColelctionView methods
    //===============================
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100.0)
    }
    
}


//===================
// MARK: - Cell class
//===================

class FriendCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        // Set the background color
        backgroundColor = UIColor.blue
        
    }
    
}
