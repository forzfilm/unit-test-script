//
//  UserViewController.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var loadButton: UIButton!

    private let viewModel = UserViewModel()

    private let activity = UIActivityIndicatorView(style: .medium)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        bindViewModel()

        // Optional: load on startup
        Task { await viewModel.loadUser(id: 1) }
    }

    private func bindViewModel() {
        // Simple closure-based binding. Called on main actor by ViewModel.
        viewModel.onChange = { [weak self] in
            guard let self = self else { return }
            self.nameLabel.text = "Name: " + (self.viewModel.user?.title ?? "—")
            self.emailLabel.text = "id: " + (String(self.viewModel.user?.id ?? 0))
            self.activity.isAnimating ? self.activity.stopAnimating() : ()
            if self.viewModel.isLoading {
                self.activity.startAnimating()
            } else {
                self.activity.stopAnimating()
            }

            if let err = self.viewModel.errorMessage {
                self.showError(err)
            }
        }

        viewModel.onImageLoaded = { [weak self] image in
            self?.imageView.image = image
        }
    }

    @IBAction func closeButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func loadButtonClicked(_ sender: UIButton) {
        Task {
            await viewModel.loadUser(id: 1) // change id if you want
        }
    }

    private func showError(_ msg: String) {
        let a = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        a.addAction(.init(title: "OK", style: .default))
        present(a, animated: true)
    }
}
