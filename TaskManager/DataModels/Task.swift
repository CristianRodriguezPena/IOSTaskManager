//
//  Task.swift
//  TaskManager
//
//  Created by Cristian Rodriguez on 5/9/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class Task: Object {
    dynamic var title = ""
    dynamic var dueDate = ""
    dynamic var desc = ""
    dynamic var startDate = ""
    dynamic var completedDate: String? = nil
    
    func isCompleted() {
        if completedDate == nil {
            completedDate = timeFormatter().string(from: Date())
        }
    }
    
    func islate() -> Bool {
        return timeFormatter().date(from: dueDate)! < Date() && completedDate == nil
    }
    
    func timeFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/d/yy h:mm a"
        formatter.timeZone = TimeZone(abbreviation: "EST")
        return formatter
    }
    
    convenience init(_ title: String, _ description: String, _ dueDate: Date) {
        self.init()
        self.title = title
        self.dueDate = timeFormatter().string(from: dueDate)
        self.startDate = timeFormatter().string(from: Date())
        self.desc = description
    }
}
