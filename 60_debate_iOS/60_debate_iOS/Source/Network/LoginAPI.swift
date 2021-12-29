//
//  LoginAPI.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/29.
//

import UIKit
import Alamofire
import 

extension LoginViewController {
    
    func LoginNetworking() {
        let loginURL = "\(Constants.SERVER_IP)/login"
        var request = URLRequest(url: URL(string: loginURL)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 5
        
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        let params = [
            "email": email,
            "password": password
        ]
        
        var result1 = {
            AF.request(request).responseData { (response) in
                switch response.result{
                case .success(let data):
                    print("POST 성공")
                    let decoder = JSONDecoder()
                    let result = try.decoder.decode(LoginEmail.self, from: data)
                    print(data)
                    
                    do {
                        try self.self.
                    }
                    
                }
            }
        }
        
    }

}
