//
//  User.swift
//  Users
//
//  Created by Berkan Çalışkan on 19.02.2025.
//

import Foundation

typealias UserList = [User]

struct User: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

struct Geo: Codable {
    let lat, lng: String?
}

struct Company: Codable {
    let name, catchPhrase, bs: String?
}


