//
//  TodoListViewModelTest.swift
//  Example1Tests
//
//  Created by Pattaravadee Luamsomboon on 2/12/2568 BE.
//

import Foundation
import Testing
@testable import ToDoList

@Suite("To do list Tests") struct TodoListViewModelTest {
    @Suite struct EmptyToDoList {

        @Test func testGetToDoListWithoutAddModelToDoListShouldReturnEmpty() {
            let viewModel = TodoListViewModel()
            #expect(viewModel.getToDoList().isEmpty)
        }

        @Test func testGetToDoListWithoutAddModelNumberOfToDoListShouldReturn1() {
            let viewModel = TodoListViewModel()
            #expect(viewModel.numberOfTodoList() == 1)
        }

        @Test func testGetToDoListWithoutAddModelShouldShowEmptyViewShouldReturnTrue() {
            let viewModel = TodoListViewModel()
            #expect(viewModel.shouldShowEmptyView() == true)
        }
    }

    @Suite struct AddToDoList {

        @Test func testGetToDoListWithAdd2ModelsToDoListShouldReturnNotEmpty() {
            let viewModel = TodoListViewModel()
            viewModel.addTodoList(title: "1", detail: "1")
            viewModel.addTodoList(title: "2", detail: "2")
            #expect(viewModel.getToDoList().isEmpty == false)
        }

        @Test func testGetToDoListWithAdd2ModelsNumberOfListShouldReturn2() {
            let viewModel = TodoListViewModel()
            viewModel.addTodoList(title: "1", detail: "1")
            viewModel.addTodoList(title: "2", detail: "2")
            #expect(viewModel.numberOfTodoList() == 2)
        }

        @Test func testGetToDoListWithAdd2ModelsShouldShowEmptyViewShouldReturnFalse() {
            let viewModel = TodoListViewModel()
            viewModel.addTodoList(title: "1", detail: "1")
            viewModel.addTodoList(title: "2", detail: "2")
            #expect(viewModel.shouldShowEmptyView() == false)
        }
    }

    @Suite struct RemoveToDoList {

        @Test func testGetToDoListWitAdd3ModelsAndRemove1ModelGetToDoListShouldReturnNotEmpty() {
            let viewModel = TodoListViewModel()
            viewModel.addTodoList(title: "1", detail: "1")
            viewModel.addTodoList(title: "2", detail: "2")
            viewModel.addTodoList(title: "3", detail: "3")
            viewModel.removeTodoListAt(id: 1)
            #expect(viewModel.getToDoList().isEmpty == false)
        }

        @Test func testGetToDoListWitAdd3ModelsAndRemove1ModelNumberOfTodoListShouldReturn2() {
            let viewModel = TodoListViewModel()
            viewModel.addTodoList(title: "1", detail: "1")
            viewModel.addTodoList(title: "2", detail: "2")
            viewModel.addTodoList(title: "3", detail: "3")
            viewModel.removeTodoListAt(id: 1)
            #expect(viewModel.numberOfTodoList() == 2)
        }

        @Test func testGetToDoListWitAdd3ModelsAndRemove1ModelShouldShowEmptyViewShouldReturnFalse() {
            let viewModel = TodoListViewModel()
            viewModel.addTodoList(title: "1", detail: "1")
            viewModel.addTodoList(title: "2", detail: "2")
            viewModel.addTodoList(title: "3", detail: "3")
            viewModel.removeTodoListAt(id: 1)
            #expect(viewModel.shouldShowEmptyView() == false)
        }
    }
}
