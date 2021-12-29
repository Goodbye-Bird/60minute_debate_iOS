//
//  RegisterModel.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/29.
//

import Foundation

struct LoginEmail: Codable {
    var status: Int
    var error: String?
    var message: String?
}

struct LoginPassword: Codable {
    var status: Int
    var error: String?
    var message: String?
}
