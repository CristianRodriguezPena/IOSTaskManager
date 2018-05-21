//
//  AddTaskViewController.swift
//  TaskManager
//
//  Created by Cristian Rodriguez on 5/21/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    @IBOutlet weak var taskTitleTextField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var taskDueDateDatePicker: UIDatePicker!
    
    let taskController = TaskController.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveTaskButton(_ sender: Any) {
        if taskTitleTextField.text!.isEmpty || taskDescriptionTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Incomplete requirements", message: "The Task name or description text box(es) are incomplet", preferredStyle: .alert)
            let action = UIAlertAction(title: "K", style: .default)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else if taskDueDateDatePicker.date < Date() {
            let alert = UIAlertController(title: "Incorrect Date", message: "The Task due date must be after the current date", preferredStyle: .alert)
            let action = UIAlertAction(title: "K", style: .default)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            taskController.create(Task(taskTitleTextField.text!, taskDescriptionTextField.text!, taskDueDateDatePicker.date))
            self.performSegue(withIdentifier: "toTaskLibrary", sender: self)
        }
    }
}
