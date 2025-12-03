//
//  ViewController.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 18/11/2568 BE.
//

import UIKit
import ToDoList

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func apiButtonClicked(_ sender: UIButton) {
//        let vc = UserViewController(nibName: "UserViewController", bundle: Bundle.main)
//        present(vc, animated: true)
    }

    @IBAction func todoListButtonClicked(_ sender: UIButton) {
        let vc = ToDoListConfigurator.shared.createToDoListView()
        let navigationVC = UINavigationController(rootViewController: vc)
        present(navigationVC, animated: true)
    }
}

