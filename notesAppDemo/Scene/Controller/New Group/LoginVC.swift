//
//  LoginVC.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 05/02/2021.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

class LoginVC: UIViewController {
    
    @IBOutlet weak var passwordTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var loginBu: UIButton!
    @IBOutlet weak var hideShowPasswordBu: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configureSignUpBu()
        emailTxtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTxtField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    func configureSignUpBu(){
        loginBu.backgroundColor = .mainBlueTint
        loginBu.layer.cornerRadius = 5
    }
    
    func handleLogin() {
        
        guard let email = emailTxtField.text else { return }
        guard let password = passwordTxtField.text else { return}
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self](response, error) in
            guard let self = self else {return}
            if let error = error {
                self.customFailureAlert(msg: error.localizedDescription, timeSelected: 5)
                return
            }else{
                self.handlePushSegue(viewController: HomeVC.self)
            }
        }
    }

    @IBAction func loginBuTapped(_ sender: UIButton) {
        handleLogin()
    }
    
    @IBAction func signupBuTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

}
