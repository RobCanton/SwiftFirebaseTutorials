//
//  User.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-09.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation

class UserProfile {
    var uid:String
    var username:String
    var photoURL:URL
    
    init(uid:String, username:String,photoURL:URL) {
        self.uid = uid
        self.username = username
        self.photoURL = photoURL
    }
}

