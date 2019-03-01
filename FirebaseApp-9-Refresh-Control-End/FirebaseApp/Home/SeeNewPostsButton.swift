//
//  SeeNewPostsButton.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2019-02-22.
//  Copyright © 2019 Robert Canton. All rights reserved.
//

import Foundation
import UIKit

class SeeNewPostsButton:UIView {
    
    var button:UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        button = UIButton()
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        
        button.setTitle("See New Posts", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 16)
        button.backgroundColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0)
        
        button.sizeToFit()
        
        button.layer.cornerRadius = 16.0
        
        addShadow()
    }
    
    func addShadow() {
        self.clipsToBounds = false
        self.layer.shadowColor = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1.0).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
    }
    
    
    
}
