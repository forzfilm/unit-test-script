//
//  User.swift
//  Example1
//
//  Created by Pattaravadee Luamsomboon on 19/11/2568 BE.
//

import Foundation

public struct User: Codable {
    public let id: Int
    public let userId: Int
    public let title: String
    public let completed: Bool
}
