//
//  CheckList.swift
//  TablePractice
//
//  Created by John McNiffe on 03/06/2018.
//  Copyright © 2018 John McNiffe. All rights reserved.
//

import Foundation

public class CheckList: NSObject, Codable {
    var title = ""
    
    init(title: String) {
        self.title = title
        super.init()
    }
}
