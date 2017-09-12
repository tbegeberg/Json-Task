//
//  CommentTableViewController.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import UIKit

class CommentTableViewController: UITableViewController {
    
    var commentArray = [Comment]() 


    init() {
        super.init(nibName: nil, bundle: nil)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.estimatedRowHeight = 40.0
        self.tableView.rowHeight = UITableViewAutomaticDimension

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool)  {
        super.viewDidLoad()
        self.title = "Comments"
        self.tableView.reloadData()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let comment = self.commentArray[indexPath.row]
        cell.textLabel?.text = ("\(comment.postId): \(comment.name)")
        cell.textLabel?.numberOfLines = Int(UITableViewAutomaticDimension)
        
        return cell
    }
    


}
