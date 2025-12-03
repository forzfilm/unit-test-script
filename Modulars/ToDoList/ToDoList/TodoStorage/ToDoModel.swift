//
//  TodoModel.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import Foundation

class ToDoModel: Codable, Equatable {
    static func == (lhs: ToDoModel, rhs: ToDoModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: Int
    var title: String
    var detail: String
    var createdAt: Date

    init(id: Int, title: String, detail: String, createdAt: Date) {
        self.id = id
        self.title = title
        self.detail = detail
        self.createdAt = createdAt
    }
}
