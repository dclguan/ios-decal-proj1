//
//  StatsViewController.swift
//  ToDo
//
//  Created by Daniel Guan on 10/16/16.
//  Copyright © 2016 Daniel Guan. All rights reserved.
//

import UIKit

class DailyStatsViewController: UIViewController {
    
    var completedTasks: [ToDoTask]!

    @IBOutlet var numComplete: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numComplete.text = String(completedTasks.count)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
