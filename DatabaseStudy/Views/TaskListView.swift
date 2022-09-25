//
//  TaskListView.swift
//  DatabaseStudy
//
//  Created by Rodney Aiglstorfer on 9/25/22.
//

import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskManager: TaskManager

    var body: some View {
        VStack {
            AddTaskView()
                .frame(height: 150)
            List {
                ForEach(taskManager.tasks, id: \.id) { task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                taskManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    taskManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
            }
            
            Spacer()
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    
    static var previews: some View {
        TaskListView()
            .environmentObject(TaskManager())
    }
}
