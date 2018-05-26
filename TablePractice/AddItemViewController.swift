//
//  AddItemViewController.swift
//  TablePractice
//
//  Created by John McNiffe on 25/05/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    @IBAction func cancelPressed() {
       navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func donePressed() {
       navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        
        navigationItem.largeTitleDisplayMode = .never
        
        super.viewDidLoad()

    }

 
}
