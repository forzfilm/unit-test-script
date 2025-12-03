//
//  TodoDetailViewController.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import UIKit

class TodoDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    var model: ToDoModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = model?.title
        detailLabel.text = model?.detail
    }

    func configure(model: ToDoModel?) {
        self.model = model
    }
}
