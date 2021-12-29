//
//  RegisterModel.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/29.
//

import Foundation
import HandyJSON

class TestModel {
    var testVar1: String?
    required init() {}
}

class Login: HandyJSON {
    var status: Int
    var error: String?
    var message: String?
}

//struct Login: Codable {
//    var status: Int
//    var error: String?
//    var message: String?
//}

struct Register: Codable {
    var status: Int
    var error: String?
    var message: String?
}
