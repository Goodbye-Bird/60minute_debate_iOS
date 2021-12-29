//
//  getDebateList.swift
//  60_debate_iOS
//
//  Created by 손민 on 2021/12/29.
//

import Foundation
import Alamofire
func getDebateData() {
    let url = "http://192.168.111.202:9090"
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: ["Content-Type":"application/json"])
                .validate(statusCode: 200..<300)
                .responseJSON { (json) in
                    print(json)
    }
}
