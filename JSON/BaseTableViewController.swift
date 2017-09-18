//
//  File.swift
//  api demo
//
//  Created by TørK on 18/09/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import UIKit

class BaseTableViewController:UITableViewController {
    
    var postArray = [Listable]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.estimatedRowHeight = 40.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        NetworkHandler.shared.getJSON (url: url) { (result:Result<[Post]>) in
            switch result {
                
            case .success(let value):
                self.postArray = value
                
            case .error(let error):
                print(error)
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let post = self.postArray[indexPath.row]
        
        cell.textLabel?.text = ("\(post.title)")
        cell.textLabel?.numberOfLines = Int(UITableViewAutomaticDimension)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentTable = CommentTableViewController()
        let row = indexPath.row + 1
        
        NetworkHandler.shared.getJSON (url: "https://jsonplaceholder.typicode.com/posts/\(row)/comments") { (result:Result<[Comment]>) in
            switch result {
                
            case .success(let comments):
                commentTable.postArray = comments
                if self.title == "Comments" {
                    print("Already in CommentView")
                } else {
                    self.navigationController?.pushViewController(commentTable, animated: true)
                }
                
            case .error(let error):
                print(error)
            }
        }
    }
}
