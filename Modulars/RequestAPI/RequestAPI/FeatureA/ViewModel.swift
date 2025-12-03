//
//  ViewModel.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import Foundation
import UIKit
import Networking

@MainActor
final class UserViewModel {
    // Public read-only state
    private(set) var user: User?
    private(set) var isLoading: Bool = false
    private(set) var errorMessage: String?

    // Simple callback-based binding for the exam (no Combine/Rx)
    var onChange: (() -> Void)?
    var onImageLoaded: ((UIImage?) -> Void)?

    private func notify() {
        onChange?()
    }

    func loadUser(id: Int) async {
        isLoading = true
        errorMessage = nil
        notify()

        do {
            let fetched = try await APIService.fetchUser(id: id)
            print("fetched: \(fetched)")
            user = fetched
        } catch {
            // Simple error mapping
            if let apiErr = error as? APIError {
                switch apiErr {
                case .badURL: errorMessage = "Bad URL"
                case .invalidResponse: errorMessage = "Invalid response"
                case .decodingError: errorMessage = "Decoding error"
                }
            } else {
                errorMessage = error.localizedDescription
            }
            user = nil
        }
        loadProfileImage()
        isLoading = false
        notify()
    }

    func loadProfileImage() {
            Task {
                let image = await fetchImage(from: "https://i.pinimg.com/736x/00/79/b7/0079b7d0d38bc285def998d2aacfb7e5.jpg")
                DispatchQueue.main.async {
                    self.onImageLoaded?(image)
                }
            }
        }

        private func fetchImage(from urlString: String) async -> UIImage? {
            guard let url = URL(string: urlString) else { return nil }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                return UIImage(data: data)
            } catch {
                return nil
            }
        }
}
