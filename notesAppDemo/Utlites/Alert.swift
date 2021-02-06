//
//  Alert.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 05/02/2021.
//

import UIKit
import MIAlertController
import PopupDialog
import SwiftEntryKit
import CDAlertView

extension UIViewController{
    
    func setAction(title:String , message: String ,actionTitle: String? = nil , handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: handler)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func showHideAlert(title : String, message : String , handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
                guard self?.presentedViewController == alert else { return }
                
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func fireSuccessAction(successMsg: String , handler : ((CDAlertViewAction) -> Void)? = nil) {
        let alert = CDAlertView(title: "Success", message: successMsg, type: .success)
        let action = CDAlertViewAction(title: "Ok", handler: handler)
            
//        alert.autoHideTime =
        alert.alertBackgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        alert.titleTextColor = #colorLiteral(red: 0.01143209357, green: 0.3911819458, blue: 0.3708234429, alpha: 1)
        alert.messageTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 3, y: 3)
            alpha = 0
        }
//        alert.hideAnimationDuration = 0.88
        alert.add(action: action)
        alert.show()
    }
    
    func customFailureAlert(msg:String,timeSelected : Double){
        let alert = CDAlertView( title: "Failed", message: msg, type: .error)
        alert.autoHideTime = timeSelected
        alert.alertBackgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        alert.titleTextColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        alert.messageTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        alert.hideAnimations = { (center, transform, alpha) in
            transform = CGAffineTransform(scaleX: 3, y: 3)
            alpha = 0
        }
        alert.hideAnimationDuration = 0.88
        alert.show()
    }
}
