//
//  SigninViewController.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/28.
//


import UIKit

class SigninViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        
        print(Constants.SERVER_IP)
    }
}
