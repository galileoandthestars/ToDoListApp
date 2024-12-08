//
//  Untitled.swift
//  ToDoListApp
//
//  Created by Fabiola Fonseca Rivera on 12/5/24.
//

import Foundation

struct Profile: Identifiable, Codable{
    let id: UUID
    var name: String
    var email: String
    
    
    init(id: UUID = UUID(), name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
