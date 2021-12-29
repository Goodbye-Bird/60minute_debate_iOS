//
//  getDebateList.swift
//  60_debate_iOS
//
//  Created by 손민 on 2021/12/29.
//

import Foundation
import Alamofire

extension ListViewController {
    
    func getDebateData() {
        let url = "\(Constants.SERVER_IP)/debate/notificate"
        
        
        let completion: ((devate?) -> Void) = { data in
            debugPrint("ㅗㅗㅗㅗㅗ")
            debugPrint(data?.devates?[0].name)
            self.debateListView.reloadData()
        }

        
        APImanager.doRequest(url, method: .get, parameters: nil, completion: completion)
    
    }
}
