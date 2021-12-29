//
//  APImanager.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/29.
//

import Foundation
import Alamofire
import HandyJSON

class APImanager: NSObject {
    
    static func doRequest<T: HandyJSON>(_ url: String,
                                        method: HTTPMethod = .get,
                                        parameters: Parameters? = nil,
                                        headers: HTTPHeaders? = ["Content-Type": "application/json"],
                                        encoding: ParameterEncoding = JSONEncoding.default,
                                        completion: @escaping (T?) -> Void) {
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers) { $0.timeoutInterval = 15 }.responseJSON { response in
            switch response.result {
            case .success(let value):
                if let data = value as? NSDictionary, let model = T.deserialize(from: data) {
                    completion(model)
                }
            case .failure(let error):
                completion(nil)
                break
            }
        }
    }
    
}
