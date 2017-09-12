//
//  PostTableViewController.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    var postArray = [Post]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.title = "Posts new title"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.estimatedRowHeight = 40.0
        self.tableView.rowHeight = UITableViewAutomaticDimension

        NetworkHandler.shared.getJSONPosts(url: "https://jsonplaceholder.typicode.com/posts") { (result) in
            switch result {

            case .success(let value):

                if let items = value as? [Post] {
                    self.postArray = items
                }

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
        
        cell.textLabel?.text = ("\(post.id): \(post.title)")
        cell.textLabel?.numberOfLines = Int(UITableViewAutomaticDimension)

        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentTable = CommentTableViewController()

        self.postArray[indexPath.row].getComments(complete: { (result) in
            switch result {
            case .success(let comments):
                commentTable.commentArray = comments
                self.navigationController?.pushViewController(commentTable, animated: true)
            case .error(let error):
                print(error)
            }
        })
        
    }


}
