//
//  ContentView.swift
//  DatabaseStudy
//
//  Created by Rodney Aiglstorfer on 9/25/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var taskManager = TaskManager()
//    @State private var showAddTaskView = false
    
    var body: some View {
        TaskListView()
            .environmentObject(taskManager)
//        ZStack(alignment: .bottomTrailing) {
//            TaskListView()
//                .environmentObject(taskManager)
//
//            SmallAddButton()
//                .padding()
//                .onTapGesture {
//                    showAddTaskView.toggle()
//                }
//        }
//        .sheet(isPresented: $showAddTaskView) {
//            AddTaskView()
//                .presentationDetents([.medium])
//                .environmentObject(taskManager)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
