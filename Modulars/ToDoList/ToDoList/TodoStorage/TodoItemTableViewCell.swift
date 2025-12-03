//
//  TodoItemTableViewCell.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import UIKit

class TodoItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    private var removeButtonClicked: ((Int) -> Void)?

    private var model: ToDoModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func removeButtonClicked(_ sender: UIButton) {
        removeButtonClicked?(model?.id ?? 0)
    }

    func setData(model: ToDoModel?, removeButtonClicked: ((Int) -> Void)?) {
        titleLabel.text = model?.title
        detailLabel.text = model?.detail
        dateLabel.text = model?.createdAt.description
        self.removeButtonClicked = removeButtonClicked
        self.model = model
    }
}
