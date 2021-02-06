//
//  SignUpVC.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 05/02/2021.
//

import UIKit
import Firebase
import SkyFloatingLabelTextField

class SignupVC: UIViewController {
    
    @IBOutlet weak var nameTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var signUpBu: UIButton!
    @IBOutlet weak var hideShowPasswordBu: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configureSignUpBu()
        emailTxtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        nameTxtField.addTarget(self, action: #selector(usernameTextFieldDidChange(_:)), for: .editingChanged)
        passwordTxtField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    func configureSignUpBu(){
        signUpBu.backgroundColor = .mainBlueTint
        signUpBu.layer.cornerRadius = 5
    }
    
    func handleSignUp() {
        
        guard let email = emailTxtField.text else { return }
        guard let password = passwordTxtField.text else { return}
        guard let fullname = nameTxtField.text else { return }
        
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self](response, error) in
            guard let self = self else {return}
            if let error = error {
                self.customFailureAlert(msg: error.localizedDescription, timeSelected: 5)
            }
            guard let uid = response?.user.uid else { return }
            let values = ["email": email,
                          "fullname": fullname] as [String : Any]
            Helper.saveID(id : uid)
            
            self.uploadUserDataAndShowHomeController(uid: uid, values: values)

        }
    }
    
    func uploadUserDataAndShowHomeController(uid: String, values: [String: Any]) {
        Configers.REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: { [weak self](error, ref) in
            guard let self = self else {return}
            
            self.handlePushSegue(viewController: HomeVC.self)
        })
    }
    

    @IBAction func signUpBuTapped(_ sender: UIButton) {
        handleSignUp()
    }
    
    @IBAction func loginBuTapped(_ sender: UIButton) {
        handlePushSegue(viewController: LoginVC.self)
    }
}
