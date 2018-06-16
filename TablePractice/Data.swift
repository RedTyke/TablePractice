//
//  Data.swift
//  TablePractice
//
//  Created by John McNiffe on 22/05/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import Foundation

public class ListItem: NSObject, Codable {
    var name = ""
    var checked = true
    
    func toggleChecked() {
        checked = !checked
        
    }
}


