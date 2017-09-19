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
    var row = Int()
    var nextTableView = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.estimatedRowHeight = 40.0
        self.tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    func networkCaller<T> (url: String, completion: @escaping (Result<[T]>)->()) where T: Initializer {
        NetworkHandler.shared.getJSON (url: url) { (result:Result<[T]>) in
            switch result {
                
            case .success(let value):
                if let values = value as? [Listable]{
                    self.postArray = values
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

        cell.textLabel?.text = ("\(post.title)")
        cell.textLabel?.numberOfLines = Int(UITableViewAutomaticDimension)
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if nextTableView.title != nil {
            self.navigationController?.pushViewController(self.nextTableView, animated: true)
        }
    }
    
}
