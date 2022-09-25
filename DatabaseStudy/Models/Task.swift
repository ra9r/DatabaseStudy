//
//  Task.swift
//  DatabaseStudy
//
//  Created by Rodney Aiglstorfer on 9/25/22.
//

import Foundation

struct Task: Identifiable, Codable {
    var id: String
    var title: String
    var completed: Bool
    
    init(_ title: String) {
        self.id = UUID().uuidString
        self.title = title
        self.completed = false
    }
}
