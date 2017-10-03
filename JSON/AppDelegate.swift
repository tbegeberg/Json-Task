//
//  AppDelegate.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let mainController = BaseTableViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        mainController.title = "Post"
        showPosts()
        mainController.dc = self
        mainController.view.backgroundColor = UIColor.white
        let navigationController = UINavigationController(rootViewController: mainController)
        navigationController.navigationBar.isTranslucent = false
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func baseTableViewWasClicked(){
        mainController.title = "Comment"
        NetworkHandler.shared.getJSON (url: "https://jsonplaceholder.typicode.com/posts/\(row)/comments") { (result:Result<[Comment]>) in
            switch result {
                
            case .success(let value):
                self.mainController.postArray = value
                
            case .error(let error):
                print(error)
            }
        }
        mainController.tableView.allowsSelection = false
        let button = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(showPosts))
        mainController.navigationItem.setRightBarButton(button, animated: true)
    }
    
    func showPosts() {
        NetworkHandler.shared.getJSON (url: "https://jsonplaceholder.typicode.com/posts") { (result:Result<[Post]>) in
            switch result {
                
            case .success(let value):
                self.mainController.postArray = value
                
            case .error(let error):
                print(error)
            }
        }
        mainController.tableView.allowsSelection = true
    }
}

