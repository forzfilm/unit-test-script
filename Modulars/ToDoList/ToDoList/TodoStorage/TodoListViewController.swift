//
//  TodoListViewController.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewModel = TodoListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
        navigationItem.leftBarButtonItem = closeButton

        let rightButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = rightButton

        tableView.delegate = self
        tableView.dataSource = self
        let bundle = Bundle(for: type(of: self)) // framework bundle
        tableView.register(UINib(nibName: "TodoItemTableViewCell", bundle: bundle), forCellReuseIdentifier: "TodoItemTableViewCell")
        tableView.register(UINib(nibName: "EmptyTableViewCell", bundle: bundle), forCellReuseIdentifier: "EmptyTableViewCell")
    }

    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    @objc func addButtonTapped() {
        let bundle = Bundle(for: type(of: self)) // framework bundle
        let vc = TodoInitViewController(nibName: "TodoInitViewController", bundle: bundle)
        vc.configure(onAddAction: { [weak self] (title, detail) in
            self?.viewModel.addTodoList(title: title, detail: detail)
            self?.tableView.reloadData()
        })
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfTodoList()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.shouldShowEmptyView() {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemTableViewCell", for: indexPath) as? TodoItemTableViewCell else {
                return UITableViewCell()
            }
            cell.setData(model: viewModel.todoList[indexPath.row], removeButtonClicked: { [weak self] id in
                self?.viewModel.removeTodoListAt(id: id)
                self?.tableView.reloadData()
            })
            return cell
        }
    }
}

extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let bundle = Bundle(for: type(of: self)) // framework bundle
        let vc = TodoDetailViewController(nibName: "TodoDetailViewController", bundle: bundle)
        vc.configure(model: viewModel.todoList[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
