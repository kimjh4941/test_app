//
//  UserInfo.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/11.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import Foundation

struct Post: Codable {
    let id: Int
    let user: User
    let body: String
    let created_at: String
    let updated_at: String
}

struct User: Codable {
    let login: String
    let avatar_url: String
}
