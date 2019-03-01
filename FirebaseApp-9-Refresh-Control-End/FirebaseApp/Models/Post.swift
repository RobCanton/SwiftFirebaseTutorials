//
//  Post.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-08.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation


class Post {
    var id:String
    var author:UserProfile
    var text:String
    var createdAt:Date
    
    init(id:String, author:UserProfile,text:String,timestamp:Double) {
        self.id = id
        self.author = author
        self.text = text
        self.createdAt = Date(timeIntervalSince1970: timestamp / 1000)
    }
    
    static func parse(_ key:String, _ data:[String:Any]) -> Post? {
        
        if let author = data["author"] as? [String:Any],
            let uid = author["uid"] as? String,
            let username = author["username"] as? String,
            let photoURL = author["photoURL"] as? String,
            let url = URL(string:photoURL),
            let text = data["text"] as? String,
            let timestamp = data["timestamp"] as? Double {
            
            let userProfile = UserProfile(uid: uid, username: username, photoURL: url)
            return Post(id: key, author: userProfile, text: text, timestamp:timestamp)
            
        }
        
        return nil
    }
}
