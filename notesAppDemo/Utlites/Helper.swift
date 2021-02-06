//
//  Helper.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 05/02/2021.
//

import Foundation

class Helper{
    
//    class func saveUserId(id : String){
//        let user = UserID(context: context)
//        user.uid = id
//    }
//
//    class func getUserId() -> String{
//        return ""
//    }
    class func saveID(id : String){
        
        let defaults = UserDefaults.standard
        defaults.setValue(id, forKey: "uid")
        defaults.synchronize() // to save id in memory
        print("IDFROMSAVEID : \(id)")

    }
    
//    // MARK:- removeID
//    class func removeID(id : Int){
//        let defaults = UserDefaults.standard
//        defaults.removeObject(forKey: "user_id")
//        print("IDremove : \(id)")
//        self.restartApp()
//    }
    
    class func getApiID() -> String? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: "uid") as? String

    }
}

protocol AnalyticsService {
    func recordEvent(_ eventName: String, parameters: [String:String]?, metrics: [String:Double]?) -> Void
}

