//
//  Data.swift
//  TablePractice
//
//  Created by John McNiffe on 22/05/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import Foundation

public class ListItem: NSObject {
    
    var name = ""
    var checked = true
    
   // init(name: String, checked: Bool) {
        
   //     self.name = name
   //     self.checked = checked

    
    // Q: DO we need an init? aDecoder?  Otherwise cannot declare a ListItem without initialising
    
    func toggleChecked() {
        checked = !checked
        
    }
    
}


