//
//  Debate.swift
//  60_debate_iOS
//
//  Created by 손민 on 2021/12/29.
//

import Foundation
import HandyJSON

class devate: HandyJSON {
    var devates: [Debates]?
    required init() {}
}

class Debates: HandyJSON {
    var name: String?
    var room: Int?
    required init() {}
}
