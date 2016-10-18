//
//  ToDoTask.swift
//  ToDo
//
//  Created by Daniel Guan on 10/15/16.
//  Copyright © 2016 Daniel Guan. All rights reserved.
//

import UIKit

class ToDoTask: NSObject {
    var itemName: String
    var completed: Bool
    var counter: Int = 0
    
    init(name : String){
        itemName = name
        completed = false
        
    }
}
