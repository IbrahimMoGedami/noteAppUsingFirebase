//
//  Configers.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 05/02/2021.
//

import Firebase

class Configers {
    
    static let DB_REF = Database.database().reference()
    static let REF_USERS = DB_REF.child("users")
    static let REF_NOTES = DB_REF.child("notes")
//    static let REF_DRIVER_LOCATIONS = DB_REF.child("driver-locations")
//    static let REF_TRIPS = DB_REF.child("trips")
}
