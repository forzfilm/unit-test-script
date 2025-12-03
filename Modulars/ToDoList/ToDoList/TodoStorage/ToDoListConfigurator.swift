//
//  ToDoListConfigurator.swift
//  Pods
//
//  Created by Pattaravadee Luamsomboon on 3/12/2568 BE.
//


public class ToDoListConfigurator {
    public static var shared = ToDoListConfigurator()

    public func createToDoListView() -> UIViewController {
        let bundle = Bundle(for: type(of: self)) // framework bundle
        let vc = TodoListViewController(nibName: "TodoListViewController", bundle: bundle)
        return vc
    }
}
