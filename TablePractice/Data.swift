//
//  Data.swift
//  TablePractice
//
//  Created by John McNiffe on 22/05/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import Foundation

public class ListItem {
    
    var name = ""
    var checked = true
    
    init(name: String, checked: Bool) {
        
        self.name = name
        self.checked = checked
    }
    
    
    func toggledChecked() {
        
        checked = !checked
    }
    
}


