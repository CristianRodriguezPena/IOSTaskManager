//
//  TaskController.swift
//  TaskManager
//
//  Created by Cristian Rodriguez on 5/10/18.
//  Copyright © 2018 Cristian Rodriguez. All rights reserved.
//

import Foundation
import RealmSwift

final class TaskController {
    static let sharedInstance = TaskController()
    
    let realm = try! Realm()
    let calendar = Calendar.current
    var tasks: Results<Task>!
    
    private init() {
        tasks = realm.objects(Task.self)
    }
    
    func create(_ task: Task) {
        do {
            try realm.write {
                realm.add(task)
            }
        } catch {
            print(error)
        }
    }
    
    func delete(_ task: Task) {
        
        do {
            try realm.write {
                realm.delete(task)
            }
        } catch  {
            print(error)
        }
    }
    
    func finishTask(_ task: Task) {
        try! realm.write {
            task.isCompleted()
        }
    }
}
