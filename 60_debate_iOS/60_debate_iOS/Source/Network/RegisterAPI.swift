//
//  RegisterAPI.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/29.
//

import UIKit

extension SigninViewController {
    func registerNetworking() {
        let completion: ((Login?) -> Void) = { data in
            debugPrint("😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀")
        }
        let param1 = ["email": emailTextField.text!]
        let param2 = [
            "email": emailTextField.text!,
            "name": nameTextField.text!,
            "password1": passwordTextField.text!,
            "password2": password2TextField.text!
        ]
        
        // 이메일 인증
        let completion: ((Login?) -> Void) = { data in
            debugPrint("😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀😀")
        }
        APImanager.doRequest("\(Constants.SERVER_IP)/join/mailCheck", method: .post, parameters: param1, completion: completion)
        
        
        
    }
}
