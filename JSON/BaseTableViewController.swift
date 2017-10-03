//
//  File.swift
//  api demo
//
//  Created by TørK on 18/09/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import UIKit

var row = Int()

class BaseTableViewController: UITableViewController {
    
    var postArray = [Listable]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.estimatedRowHeight = 40.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    weak var dc: AppDelegate?

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
        row = indexPath.row + 1
        dc?.baseTableViewWasClicked()
    }
 
}
