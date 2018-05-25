//
//  PracticeTableViewController.swift
//  TablePractice
//
//  Created by John McNiffe on 22/05/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import UIKit

class PracticeTableViewController: UITableViewController {

    var items = [ListItem]()
    
    @IBAction func addItem() {
        
        // Add item to data modl
        
        let newRowNIndex = items.count
        
        let item = ListItem(name: "Samson", checked: true)
        items.append(item)
        
        // Add item to table
        
        let indexPath = IndexPath(row: newRowNIndex, section: 0)
        var indexPaths = [IndexPath]()
        
        indexPaths.append(indexPath)
        
       tableView.insertRows(at: indexPaths, with: .automatic)
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let rowNumber = indexPath.row
        
        // Delete item from data model
        items.remove(at: rowNumber)
    
        // remove item from table
        var indexPaths = [IndexPath]()
        indexPaths.append(indexPath)
        
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true

        let listItem1 = ListItem(name: "Ethan", checked: true)
        items.append(listItem1)
        let listItem2 = ListItem(name: "Finlay", checked: false)
        items.append(listItem2)
        let listItem3 = ListItem(name: "Delila", checked: true)
        items.append(listItem3)
        let listItem4 = ListItem(name: "Dawn", checked: true)
        items.append(listItem4)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PracticeCell", for: indexPath)

        let label = cell.viewWithTag(1000) as! UILabel
        
        let item = items[indexPath.row]
        
       label.text = item.name
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            
            print("Checked Pre: \(item.checked)")
            item.toggledChecked()
            
            configureCheckmark(for: cell, with: item)
            
        print("Checked Post: \(item.checked)")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ListItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    

 
}
