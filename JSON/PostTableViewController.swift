//
//  PostTableViewController.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import UIKit

class PostTableViewController: BaseTableViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Posts"
        self.url = "https://jsonplaceholder.typicode.com/posts"
        self.nextTableView = CommentTableViewController()
        
        networkCaller(url: url) { (result:Result<[Post]>) in
            switch result {
                
            case .success(let value):
                self.postArray = value
                
            case .error(let error):
                print(error)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}
