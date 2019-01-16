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

class FriendCell: BaseCell {
    
    // Setup profileImage
    let profileImageView: UIImageView = {
        
        // Setup the imageView
        let imageView = UIImageView()
        
        // Set the content view
        imageView.contentMode = .scaleAspectFill
        
        // Round th ecorners
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        
        return imageView
        
    }()
    
    // Setup the dividerline
    let dividerLineView: UIView = {
        
        // Setup the view
        let view = UIView()
        
        // Set the color
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        
        return view
        
    }()
    
    
    override func setupViews() {
        
        
        // Add  the imageView
        addSubview(profileImageView)
        addSubview(dividerLineView)
        
        // Set the image for the cells
        profileImageView.image = UIImage(named: "zuckprofile")
        
        // This is needed to use the auto-layout
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        dividerLineView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the constraints
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[v0(68)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": profileImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0(68)]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": profileImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-82-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": dividerLineView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": dividerLineView]))
        
        
    }
    
}


// Base cell
class BaseCell: UICollectionViewCell {
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
