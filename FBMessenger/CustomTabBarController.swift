//
//  CustomTabBarController.swift
//  FBMessenger
//
//  Created by Lucas Dahl on 1/16/19.
//  Copyright © 2019 Lucas Dahl. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup custome view controllers
        let layout = UICollectionViewFlowLayout()
        let friendsController = FriendsController(collectionViewLayout: layout)
        let recentMessagesNavController = UINavigationController(rootViewController: friendsController)
        recentMessagesNavController.tabBarItem.title = "Recent"
        recentMessagesNavController.tabBarItem.image = UIImage(named: "recent")
        

        
        // Setup all the controllers
        viewControllers = [recentMessagesNavController, createDummyNavControllerWithTitle(title: "Calls", imageName: "calls"), createDummyNavControllerWithTitle(title: "Groups", imageName: "groups"), createDummyNavControllerWithTitle(title: "People", imageName: "people"), createDummyNavControllerWithTitle(title: "Settings", imageName: "settings")]
        
    }
    
    // Convince method for making dummy viewControllerss
    private func createDummyNavControllerWithTitle(title: String, imageName: String) -> UINavigationController {
        
        let viewController = UIViewController()
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
        
    }
    
    
}
