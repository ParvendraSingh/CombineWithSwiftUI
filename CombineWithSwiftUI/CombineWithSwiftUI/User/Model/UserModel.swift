//
//  UserModel.swift
//  CombineWithSwiftUI
//
//  Created by Parvendra Kumar on 25/08/23.
//

import Foundation

struct UserModel: Decodable {
    var id: Int?
    var name: String?
    var username: String?
    var address: Address?
}

struct Address : Decodable {
    var city: String?
    var zipcode: String?
}
