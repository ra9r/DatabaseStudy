//
//  TaskManager.swift
//  DatabaseStudy
//
//  Created by Rodney Aiglstorfer on 9/25/22.
//

import Foundation

class TaskManager: ObservableObject {
    @Published private(set) var tasks: [Task] = []
    
    func getTasks() {
        // No Op
    }
    
    func addTask(title: String) {
        tasks.append(Task(title))
    }
    
    func updateTask(id: String, completed: Bool) {
        let ndx = tasks.firstIndex { task in
            task.id == id
        }
        guard let ndx else {
            print("Unable to update task \(id)")
            return
        }
        
        tasks[ndx].completed = completed
        print("Updated task \(id) completed:\(tasks[ndx].completed)")
    }
    
    func deleteTask(id: String) {
        tasks.removeAll { task in
            task.id == id
        }
    }
}

