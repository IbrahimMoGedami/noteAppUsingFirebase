//
//  Register+Extensions.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 05/02/2021.
//

import UIKit
import SkyFloatingLabelTextField

extension SignupVC{
    
    //MARK:- This will notify us when something has changed on the textfield
    @objc func textFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                
                if(text.isValidEmail()){
                    floatingLabelTextField.errorMessage = ""
                }
                else {
                    floatingLabelTextField.errorMessage = "Invalid email"
                    floatingLabelTextField.selectedLineColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                    floatingLabelTextField.lineErrorColor = .red
                    
                }
            }
        }
    }
    
    
    @objc func usernameTextFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                
                if(text.isValidName()){
                    floatingLabelTextField.errorMessage = ""
                }
                else {
                    floatingLabelTextField.errorMessage = "Invalid Username"
                    floatingLabelTextField.selectedLineColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                    floatingLabelTextField.lineErrorColor = .red
                    
                }
            }
        }
    }
    
    @objc func passwordTextFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                
                if textfield == passwordTxtField{
                    if(text.isValidPassword()){
                        floatingLabelTextField.errorMessage = "Valid Password"
                        floatingLabelTextField.lineErrorColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                        floatingLabelTextField.titleErrorColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                        
                    }
                    else {
                        floatingLabelTextField.errorMessage = "Invalid Password"
                        floatingLabelTextField.selectedLineColor = #colorLiteral(red: 0.02352941176, green: 0.3450980392, blue: 0.3411764706, alpha: 1)
                        floatingLabelTextField.lineErrorColor = .red
                        floatingLabelTextField.titleErrorColor = .red
                    }
                }
            }
        }
    }
}
