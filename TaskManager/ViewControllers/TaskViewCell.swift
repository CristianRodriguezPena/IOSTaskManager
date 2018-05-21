//
//  TaskViewCell.swift
//  TaskManager
//
//  Created by Cristian Rodriguez on 5/15/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import UIKit

class TaskViewCell: UITableViewCell {
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var taskStatusLabel: UILabel!
    @IBOutlet weak var taskDueDateLabel: UILabel!
    @IBOutlet weak var taskStartDateLabel: UILabel!
    
    func configureCell(_ task: Task) {
        taskTitleLabel.text = task.title
        taskDescriptionLabel.text = task.desc
        taskStatusLabel.layer.cornerRadius = taskStatusLabel.frame.height / 2
        taskStatusLabel.backgroundColor = task.islate() ? #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1) : task.completedDate != nil ? #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1) : #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        taskDueDateLabel.text = "Due by: " + task.dueDate
        taskStartDateLabel.text = "Started on: " + task.startDate
    }

}
