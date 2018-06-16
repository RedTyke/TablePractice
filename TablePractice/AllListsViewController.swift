//
//  AllListsViewController.swift
//  TablePractice
//
//  Created by John McNiffe on 03/06/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {

    var lists = [CheckList]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Dummy Data
        let list1 = CheckList(title: "Shopping List")
        lists.append(list1)
        
        let list2 = CheckList(title: "Fitness workouts")
        lists.append(list2)
        
        let list3 = CheckList(title: "Gardening jobs")
        lists.append(list3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = makeCell(tableView)
        let checkList = lists[indexPath.row]
        cell.textLabel!.text = checkList.title
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }

    // MARK: Table actions
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "ShowCheckList", sender: checklist)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCheckList" {
            let controller = segue.destination as! CheckListTableViewController
            controller.checklist = sender as! CheckList
            
        }
    }
    
    
    // MARK: Convenience functions
    
    func makeCell(_ tableView: UITableView) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell
        } else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            return cell
        }
    }
    
   

}
