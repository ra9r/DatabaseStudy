//
//  TaskManager.swift
//  DatabaseStudy
//
//  Created by Rodney Aiglstorfer on 9/25/22.
//

import Foundation

class TaskManager: ObservableObject {
    @Published private(set) var tasks: [Task] = []
    
    init() {
        getTasks()
    }
    
    func getTasks() {
        let defaults = UserDefaults.standard
        if let savedTasks = defaults.object(forKey: "SavedTasks") as? Data {
            let decoder = JSONDecoder()
            if let loadedTasks = try? decoder.decode([Task].self, from: savedTasks) {
                tasks = loadedTasks
            }
        }
    }
    
    func saveTasks() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedTasks")
        }
    }
    
    func addTask(title: String) {
        tasks.append(Task(title))
        saveTasks()
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
        saveTasks()
        print("Updated task \(id) completed:\(tasks[ndx].completed)")
    }
    
    func deleteTask(id: String) {
        tasks.removeAll { task in
            task.id == id
        }
        saveTasks()
    }
}

