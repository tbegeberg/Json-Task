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
        
        cell.textLabel?.text = ("\(post.id): \(post.title)")
        
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
