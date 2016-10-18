//
//  ViewController.swift
//  ToDo
//
//  Created by Daniel Guan on 10/15/16.
//  Copyright © 2016 Daniel Guan. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {
    
    struct myData {
        var itemName : String
    }

    
    var item : ToDoTask?

    @IBOutlet var textField: UITextField!

    @IBOutlet var doneBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? NSObject != doneBtn{
            return
        }
        if (textField.text?.characters.count)! > 0 {
            item = ToDoTask(name: textField.text!)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

