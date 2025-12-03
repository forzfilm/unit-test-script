//
//  TodoInitViewController.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import UIKit

class TodoInitViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!

    private var onAddAction: ((String, String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonClicked(_ sender: UIButton) {
        let title = titleTextField.text ?? ""
        let detail = detailTextField.text ?? ""
        onAddAction?(title, detail)
        navigationController?.popViewController(animated: true)
    }

    func configure(onAddAction: ((String, String) -> Void)?) {
        self.onAddAction = onAddAction
    }
}
