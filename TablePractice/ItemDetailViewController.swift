//
//  AddItemViewController.swift
//  TablePractice
//
//  Created by John McNiffe on 25/05/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import UIKit

// MARK: AddItem Protocol
protocol ItemDetailViewControllerDelegate: class {
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ListItem)
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ListItem)
}


class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    weak var delegate: ItemDetailViewControllerDelegate?
    
    var itemToEdit: ListItem?
    
    
    override func viewDidLoad() {
        navigationItem.largeTitleDisplayMode = .never
        super.viewDidLoad()
        // textField already selected (the focus) when page opens to avoid having to select first
        textField.becomeFirstResponder()
        
        if let itemToEdit = itemToEdit {
            title = "Edit Item"
            textField.text = itemToEdit.name
            doneButton.isEnabled = true
        }
    }
    
    // MARK: Actions
    
    @IBAction func cancelPressed() {
        delegate?.ItemDetailViewControllerDidCancel(self)
   
    }
    
    @IBAction func donePressed() {
        
        if let itemToEdit = itemToEdit {
            
        itemToEdit.name = textField.text!
        delegate?.ItemDetailViewController(self, didFinishEditing: itemToEdit)
        } else {
        
        let item = ListItem()
        item.name = textField.text!
        item.checked = false
        delegate?.ItemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    // MARK: TableView methods
    // Prevent cells from being selected
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // MARK: Textfield methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Using textField method to identify if content is blank
        let oldText = textField.text!
        // Convert NSRange to UIRange
        let stringRange = Range(range, in: oldText)!
        // work out newText by replacing characters in oldText with replacementString and check if it is blank or not!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        doneButton.isEnabled = !newText.isEmpty
        return true
    }
    
    
}
