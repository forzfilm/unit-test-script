//
//  TodoListViewModel.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import Foundation

class TodoListViewModel {
    private(set) var todoList: [ToDoModel] = []

    func addTodoList(title: String, detail: String) {
        todoList.append(ToDoModel(id: todoList.count, title: title, detail: detail, createdAt: Date()))
    }

    func removeTodoListAt(id: Int) {
        todoList.removeAll { $0.id == id }
    }

    func numberOfTodoList() -> Int {
        return todoList.count == 0 ? 1 : todoList.count
    }

    func shouldShowEmptyView() -> Bool {
        return todoList.count == 0
    }

    func getToDoList() -> [ToDoModel] {
        return todoList
    }
}
