//
//  APIError.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import Foundation

public enum APIError: Error {
    case badURL, invalidResponse, decodingError(Error)
}
