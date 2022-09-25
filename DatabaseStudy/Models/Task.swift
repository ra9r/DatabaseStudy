//
//  Task.swift
//  DatabaseStudy
//
//  Created by Rodney Aiglstorfer on 9/25/22.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var title: String = ""
    @Persisted var completed: Bool = false
    
}
