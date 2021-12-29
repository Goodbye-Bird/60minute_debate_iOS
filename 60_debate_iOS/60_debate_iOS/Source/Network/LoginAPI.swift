//
//  LoginAPI.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/29.
//

import UIKit
import Alamofire
import KeychainAccess

extension LoginViewController {
    
    func LoginNetworking() {
        let completion: ((Login?) -> Void) = { data in
            debugPrint("😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀")
        }
        let parameters = ["email": emailTextField.text!, "password": passwordTextField.text!]
        APImanager.doRequest("\(Constants.SERVER_IP)/auth/login", method: .post, parameters: parameters, completion: completion)
    }
}
