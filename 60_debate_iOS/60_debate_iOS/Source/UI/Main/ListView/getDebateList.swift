//
//  getDebateList.swift
//  60_debate_iOS
//
//  Created by 손민 on 2021/12/29.
//

import Foundation
import Alamofire
func getDebateData(_ result: @escaping ((devate?) -> Void)) {
    let url = "\(Constants.SERVER_IP)/debate/notificate"

        
        APImanager.doRequest(url, method: .get, parameters: nil, completion: result)
    
}
