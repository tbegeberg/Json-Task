//
//  CommentTableViewController.swift
//  JSON
//
//  Created by TørK on 26/08/2017.
//  Copyright © 2017 Tørk Egeberg. All rights reserved.
//

import UIKit

class CommentTableViewController: BaseTableViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Comments"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
   
}
