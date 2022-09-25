//
//  ContentView.swift
//  DatabaseStudy
//
//  Created by Rodney Aiglstorfer on 9/25/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var taskManager = TaskManager()
    
    var body: some View {
        TaskListView()
            .environmentObject(taskManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
