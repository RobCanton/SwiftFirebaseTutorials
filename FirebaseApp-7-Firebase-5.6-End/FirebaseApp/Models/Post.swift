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
}
