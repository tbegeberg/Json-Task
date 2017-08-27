//
//  PostTableViewController.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    
    let commentViewButton = UIBarButtonItem()
    var postArray = [Posts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Posts"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        commentViewButton.title = "Comments"
        commentViewButton.target = self
        commentViewButton.action = #selector(buttonAction(sender:))
        self.navigationItem.setRightBarButton(commentViewButton, animated: true)
        
        postArray.removeAll()
        
        let caller = NetworkCaller.shared
        caller.getOutput(url: "https://jsonplaceholder.typicode.com/posts") { (result) in
            switch result {
            case .success(let value):
                self.postArray = value as! [Posts]
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

    // MARK: - Table view data source

 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let post = self.postArray[indexPath.row]
        cell.textLabel?.text = post.title

        return cell
    }
    
    
    func buttonAction(sender:UIBarButtonItem!)
    {
        print("Button tapped")
        
        let commentTable = CommentTableViewController()
        commentTable.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(commentTable, animated: true)
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
