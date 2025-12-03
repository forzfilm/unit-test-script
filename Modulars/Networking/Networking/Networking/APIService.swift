//
//  APIService.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import Foundation

public struct APIService {
    public static func fetchUser(id: Int) async throws -> User {
        let urlString = "https://jsonplaceholder.typicode.com/todos/\(id)"
        guard let url = URL(string: urlString) else { throw APIError.badURL }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw APIError.invalidResponse
        }

        do {
            return try JSONDecoder().decode(User.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }
}
