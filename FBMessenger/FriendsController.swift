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
        
        // Set the navBr title
        navigationItem.title = "Recent"
        
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
    
    //===================
    // MARK: - Properties
    //===================
    
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
    
    let nameLabel: UILabel = {
        
       // Create the label
        let label = UILabel()
        
        // Set the font
        label.font = UIFont.systemFont(ofSize: 18)
        
        // Set the text
        label.text = "Friend Name"
        
        return label
        
    }()
    
    let messagelabel: UILabel = {
       
        // Create the label
        let label = UILabel()
        
        // Set the font
        label.font = UIFont.systemFont(ofSize: 14)
        
        // Set the the text
        label.text = "Your  Friend's message and something else..."
        label.textColor = UIColor.darkGray
        
        return label
        
    }()
    
    let timeLabel: UILabel = {
       
        // Setup the label
        let label = UILabel()
        
        // Set the text
        label.text = "12:00 pm"
        
        // Set the text alignment
        label.textAlignment = .right
        
        // Set the font
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
        
    }()

    
    //================
    // MARK: - Methods
    //================
    
    private func setupContainerView() {
        
        // Setup the container
        let containerView = UIView()
        
        // Add it to the subview
        addSubview(containerView)
        
        addConstraintWithFormat(format: "H:|-90-[v0]|", views: containerView)
        addConstraintWithFormat(format: "V:[v0(50)]", views: containerView)
        
        // Centers the cell
        addConstraint(NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
        // Add the labels to the containerView
        containerView.addSubview(nameLabel)
        containerView.addSubview(messagelabel)
        containerView.addSubview(timeLabel)
        
        // Label constraints
        // V - vertical, H is height "v#" is which item in the array, and the number before the [v#] is padding on the left, and after is padding on the right
        containerView.addConstraintWithFormat(format: "H:|[v0][v1(80)]-20-|", views: nameLabel, timeLabel)
        containerView.addConstraintWithFormat(format: "V:|[v0][v1(24)]|", views: nameLabel, messagelabel)
        containerView.addConstraintWithFormat(format: "H:|[v0]-12-|", views: messagelabel)
        containerView.addConstraintWithFormat(format: "V:|[v0(20)]", views: timeLabel)
        
    }
    
    
    
    override func setupViews() {
        
        
        // Add  the imageView
        addSubview(profileImageView)
        addSubview(dividerLineView)
        
        // Set the image for the cells
        profileImageView.image = UIImage(named: "zuckprofile")
        
        setupContainerView()
        
        // This is needed to use the auto-layout
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        dividerLineView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the constraints
        addConstraintWithFormat(format: "H:|-12-[v0(68)]", views: profileImageView)
        addConstraintWithFormat(format: "V:[v0(68)]", views: profileImageView)
        
        // This centers the profileImageView
        addConstraint(NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraintWithFormat(format: "H:|-82-[v0]|", views: dividerLineView)
        addConstraintWithFormat(format: "V:[v0(1)]|", views: dividerLineView)
  
        
    }

    
} // End cell

// Used to add the constraints from a method
extension UIView {
    
    
    // This is a way to add constraints
    func  addConstraintWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        // Loop through the dictionary
        for (index, view) in views.enumerated() {
            
            // Set the key
            let key = "v\(index)"
            
            // Add the value to the key
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
        // Add the constraint
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
        
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
