//
//  Model.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 05/02/2021.
//

import Foundation
import CoreLocation

struct User {
    let fullname: String
    let email: String
    let uid: String
    
    var firstInitial: String { return String(fullname.prefix(1)) }
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}

struct Note {
    var id: String?
    var title: String?
    var content: String?
    var location : String?
    
    init(id : String? , title : String? , content : String? , location : String?) {
        self.id = id
        self.content = content
        self.title = title
        self.location = location
    }
    
}
