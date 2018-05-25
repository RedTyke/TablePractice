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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Dispose of any resources that can be recreated.
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
            var item = items[indexPath.row]
            
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
    
    
/*    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.row][1] = !data[indexPath.row][1]
        
    }
*/
 
 
}
