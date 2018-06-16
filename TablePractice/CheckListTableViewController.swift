//
//  PracticeTableViewController.swift
//  TablePractice
//
//  Created by John McNiffe on 22/05/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import UIKit

class CheckListTableViewController: UITableViewController, ItemDetailViewControllerDelegate {
    
    var items = [ListItem]()
    var checklist: CheckList! // Implicitly unwrapped optional as will be set by PrepareForSegue when screen is called
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
       
        
        // Default data in table
        let listItem1 = ListItem()
        listItem1.name = "Ethan"
        listItem1.checked = true
        items.append(listItem1)
        
        print("Documents folder is \(documentsDirectory())")
        print("Data file path is \(dataFilePath())")
        
        title = checklist.title
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Tableview Delegates
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PracticeCell", for: indexPath)
      
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    //Click on cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Slide to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let rowNumber = indexPath.row
        // Delete item from data model
        items.remove(at: rowNumber)
        // remove item from table
        var indexPaths = [IndexPath]()
        indexPaths.append(indexPath)
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        SaveCheckListItems()    
    }
    
    // MARK: Private methods
    
    func configureCheckmark(for cell: UITableViewCell, with item: ListItem) {
        
        let check = cell.viewWithTag(1001) as! UILabel
        
        if item.checked {
            check.text = "√"
        } else {
            check.text = ""
        }
    }
    
   func configureText(for cell: UITableViewCell, with item: ListItem) {
     
       let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.name
    }
    
    
    
    // MARK: AddItemViewController Delegate Methods
    
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        print("Listening to AddItemViewController pressing cancel")
        navigationController?.popViewController(animated: true)
    }
    
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ListItem) {
        // Add item to data model
        let newRowIndex = items.count
        items.append(item)
        // Add item to table
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        var indexPaths = [IndexPath]()
        indexPaths.append(indexPath)
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
        
        SaveCheckListItems()
    }
    
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ListItem) {
        // Find index for Edited cell (using cell before changed)
        // ListItem needs to be Equatable (done by conforming to NSObject)
        if let index = items.index(of: item) {
            let indexPath = IndexPath(item: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
               configureText(for: cell, with: item)
            }
            
        }
        
        navigationController?.popViewController(animated: true)
    
        SaveCheckListItems()
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // As move to AddItemViewController declare self as the delegate for that view
        if segue.identifier == "AddItem"
        {
            let controller = segue.destination as! ItemDetailViewController
            
            controller.delegate = self
        } else if segue.identifier == "EditItem"
        {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
           
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
    
    
    
    // MARK: Data Management
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
      // return documentsDirectory().appendPathComponent("TablePractice.plist")
        return documentsDirectory().appendingPathComponent("TablePractice.plist")
    }
    
    
    func SaveCheckListItems() {
        let encoder = PropertyListEncoder()
        do {
            
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            
        } catch {
            
            print("Error encoding item array")
        }
    }
    
    func LoadCheckListItems() {
        
    }
    
}
