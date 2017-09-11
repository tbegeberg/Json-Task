//
//  PostTableViewController.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController, UITextFieldDelegate {

    var postArray = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Posts"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        
        postArray.removeAll()
        
        let caller = NetworkHandler.shared
        caller.getJSONPosts(url: "https://jsonplaceholder.typicode.com/posts") { (result) in
            switch result {
            case .success(let value):
                if let items = value as? [Post]{
                     self.postArray = items
                }
                self.tableView.estimatedRowHeight = 40.0
                self.tableView.rowHeight = UITableViewAutomaticDimension
                self.tableView.reloadData()
            case .error(let error):
                print(error)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let post = self.postArray[indexPath.row]
        
        cell.textLabel?.text = ("\(post.id): \(post.title)")
        cell.textLabel?.numberOfLines = Int(UITableViewAutomaticDimension)
        
        /*
        let sampleTextField = UITextField(frame: CGRect(x: cell.frame.width - 100, y: 0, width: 100, height: cell.frame.height))
        sampleTextField.placeholder = "Enter text here"
        sampleTextField.font = sampleTextField.font?.withSize(15)
        sampleTextField.borderStyle = UITextBorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        sampleTextField.delegate = self
        sampleTextField.tag = indexPath.row
        cell.addSubview(sampleTextField)
        */
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let commentTable = CommentTableViewController()
        commentTable.view.backgroundColor = UIColor.white
        commentTable.postId = (indexPath.row + 1)
        self.navigationController?.pushViewController(commentTable, animated: true)
    }
    
    
    
    
    /*
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        self.tableView.reloadData()
    }
    
   
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("I am done")
        print(textField.text)
        print(textField.tag)
    }*/
    
  



}
