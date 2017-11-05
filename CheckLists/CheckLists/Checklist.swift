//
//  Checklist.swift
//  CheckLists
//
//  Created by Wismin Effendi on 11/3/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {

    var name = ""
    var items = [ChecklistItem]() 
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
