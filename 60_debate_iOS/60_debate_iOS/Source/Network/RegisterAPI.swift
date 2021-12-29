//
//  RegisterAPI.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/29.
//

import UIKit

extension SigninViewController {
    
//    func registerNetworking() {
//        
//        let loginURL = "\(Constants.SERVER_IP)/auth/join"
//        
//        var request = URLRequest(url: URL(string: loginURL)!)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.timeoutInterval = 5
//        
//        
//        guard let name = nameTextField.text,
//              let email = emailTextField.text,
//              let password1 = passwordTextField.text,
//              let password2 = password2TextField.text else { return }
//        
//        let namePram = ["name": name]
//        let emailPram = ["email": email]
//        let passwordPram = ["password": password1]
//        let password2Prma = ["password2": password2]
//        
//        do {
//            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
//        } catch {
//            print("http Body Error")
//        }
//
//        AF.request(request).responseData { (response) in
//            switch response.result{
//            case .success(let data):
//                print("POST 성공")
//                let decoder = JSONDecoder()
//                let result = try.decoder.decode(Register.self, from: data)
//                
//                print(data)
//            
//            case .failure(let error):
//                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
//            }
//        }
//    }
//    
}
