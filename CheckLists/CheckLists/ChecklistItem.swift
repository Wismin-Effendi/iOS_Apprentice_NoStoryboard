//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by Wismin Effendi on 11/2/17.
//  Copyright © 2017 Wismin Effendi. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text: String = ""
    var checked: Bool = false
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
    
    func toggleChecked() {
        checked = !checked
    }
}
