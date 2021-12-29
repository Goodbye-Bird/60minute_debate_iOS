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
            guard let status = data?.status else { return }
            if status == 200 {
                let storyboard = UIStoryboard(name: "List", bundle: nil)
                guard let VC = storyboard.instantiateViewController(withIdentifier: "List") as? ListViewController else { return }
                UIApplication.shared.keyWindow?.replaceRootViewController(VC, animated: true, completion: nil)
            }
        }
        let parameters = ["email": emailTextField.text!, "password": passwordTextField.text!]
        APImanager.doRequest("\(Constants.SERVER_IP)/auth/login", method: .post, parameters: parameters, completion: completion)
    }
}
