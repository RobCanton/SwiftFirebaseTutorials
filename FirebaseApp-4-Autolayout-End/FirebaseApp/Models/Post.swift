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
    var author:String
    var text:String
    
    init(id:String, author:String,text:String) {
        self.id = id
        self.author = author
        self.text = text
    }
}
