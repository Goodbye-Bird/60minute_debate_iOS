//
//  RegisterAPI.swift
//  60_debate_iOS
//
//  Created by κΉμμ on 2021/12/29.
//

import UIKit

extension SigninViewController {
    func registerNetworking() {
        let param1 = ["email": emailTextField.text!]
        let param2 = [
            "email": emailTextField.text!,
            "name": nameTextField.text!,
            "password": passwordTextField.text!,
            "password2": password2TextField.text!
        ]
        
        let completion1: ((Register?) -> Void) = { data in
            debugPrint("π aslkdfjalskdjflaskdjfalskdfj")
        }
        
        // μ΄λ©μΌ μΈμ¦
        let completion: ((Login?) -> Void) = { data in
            debugPrint("πππππππππππππππππππππππππππππππ")
            APImanager.doRequest("\(Constants.SERVER_IP)/auth/join", method: .post, parameters: param2, completion: completion1)
        }
        APImanager.doRequest("\(Constants.SERVER_IP)/auth/join/mailCheck", method: .post, parameters: param1, completion: completion)
    
    }
}
