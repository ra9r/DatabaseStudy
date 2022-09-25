//
//  AddTaskView.swift
//  DatabaseStudy
//
//  Created by Rodney Aiglstorfer on 9/25/22.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var title: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            TextField(
                "Enter your task here",
                text: $title
            )
            .padding(5)
            .font(.title2)
            .textFieldStyle(.roundedBorder)
            
            
            Button {
                // Only adding a task if user added something in the TextField
                if title != "" {
                    taskManager.addTask(title: title)
                    title = ""
                }
            } label: {
                Text("Add task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.primary)
                    .cornerRadius(30)
            }
            
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(TaskManager())
    }
}
