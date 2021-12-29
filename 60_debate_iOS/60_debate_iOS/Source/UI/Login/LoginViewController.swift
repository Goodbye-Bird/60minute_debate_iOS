//
//  LoginViewController.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/28.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var moveToSignUpView: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            
            self.view.endEditing(true)
    }
    
    @IBAction func moveToSignUpView(_ sender: UIButton) {
    }
    @IBAction func pushLoginButton(_ sender: UIButton) {
        LoginNetworking()
    }
    
}
