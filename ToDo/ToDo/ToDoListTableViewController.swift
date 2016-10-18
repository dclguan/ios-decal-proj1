//
//  ToDoListTableViewController.swift
//  ToDo
//
//  Created by Daniel Guan on 10/15/16.
//  Copyright © 2016 Daniel Guan. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController{
    var toDoTasks: [ToDoTask] = []
    
    var numComplete : String = ""
    
    var timer : Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsMultipleSelection = true
        
        toDoTasks.append(ToDoTask(name: "Sample task"))

        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(ToDoListTableViewController.autoUpdateAndClear), userInfo: nil, repeats: true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.toDoTasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = toDoTasks[indexPath.row].itemName
        cell.accessoryType = toDoTasks[indexPath.row].completed ? .checkmark : .none

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if toDoTasks[indexPath.row].completed {
                cell.accessoryType = .none
                toDoTasks[indexPath.row].completed = false
                toDoTasks[indexPath.row].counter = 0
            } else if !toDoTasks[indexPath.row].completed{
                cell.accessoryType = .checkmark
                toDoTasks[indexPath.row].completed = true
            }
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if toDoTasks[indexPath.row].completed {
                cell.accessoryType = .none
                toDoTasks[indexPath.row].completed = false
                toDoTasks[indexPath.row].counter = 0
            } else if !toDoTasks[indexPath.row].completed{
                cell.accessoryType = .checkmark
                toDoTasks[indexPath.row].completed = true
            }
            tableView.reloadData()
        }
    }
    
    func autoUpdateAndClear() {
        var removedSomething = false
        for item in toDoTasks{
            if item.completed {
                item.counter += 1
            }
            if item.counter >= 1440 {
                toDoTasks.remove(at: toDoTasks.index(of: item)!)
                removedSomething = true
            }
        }
        if removedSomething {
            tableView.reloadData()
        }
    }

    @IBAction func unwindToList(segue: UIStoryboardSegue) {}
    
    @IBAction func unwindAndAddToList(segue: UIStoryboardSegue) {
        let source = segue.source as! AddToDoItemViewController
        if source.item == nil {
            return
        }
        let newTask: ToDoTask = source.item!
        
        if newTask.itemName != "" {
            toDoTasks.append(newTask)
            tableView.reloadData()
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            toDoTasks.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Stats" {
            let dest = segue.destination as! DailyStatsViewController
            dest.completedTasks = toDoTasks.filter {$0.completed == true}

        }
    }
    

}
