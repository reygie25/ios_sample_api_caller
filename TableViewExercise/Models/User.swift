//
//  User.swift
//  TableViewExercise
//
//  Created by Shaider John Abuel on 2022-06-23.
//

import Foundation

struct UserList {
  let headerTitle: String
  let users: [User]
}

struct User: Codable {
  let id: Int
  let name, username, email: String
  let address: Address
  let phone, website: String
  let company: Company
}

struct Address: Codable {
  let street, suite, city, zipcode: String
  let geo: Geo
  
  var fullAddress: String {
    return "\(street) \(city) \(zipcode)"
  }
  
}

struct Geo: Codable {
  let lat, lng: String
}

struct Company: Codable {
  let name, catchPhrase, bs: String
}
