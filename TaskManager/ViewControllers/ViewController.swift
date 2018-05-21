//
//  ViewController.swift
//  TaskManager
//
//  Created by Cristian Rodriguez on 5/9/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let taskController = TaskController.sharedInstance
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(taskController.tasks)
        return taskController.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskViewCell
        cell.configureCell(taskController.tasks[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let currentTask = taskController.tasks[indexPath.row]
        
        let finishTask = UITableViewRowAction(style: .normal, title: "Finish Task") { (_, _) in
            self.taskController.finishTask(currentTask)
            tableView.reloadData()
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            self.taskController.delete(currentTask)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        if currentTask.completedDate == nil {
            return [deleteAction,finishTask]
        }
        return [deleteAction]
    }
    @IBAction func unwindToTaskLibrary(_ segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }

}

