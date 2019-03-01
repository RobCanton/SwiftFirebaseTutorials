//
//  NewPostViewController.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-09.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation
import UIKit
import Firebase

protocol NewPostVCDelegate {
    func didUploadPost(withID id:String)
}

class NewPostViewController:UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textView:UITextView!
    @IBOutlet weak var placeHolderLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIButton!
    
    var delegate:NewPostVCDelegate?
    
    @IBAction func handlePostButton() {
        
        guard let userProfile = UserService.currentUserProfile else { return }
        // Firebase code here
        
        let postRef = Database.database().reference().child("posts").childByAutoId()
        
        let postObject = [
            "author": [
                "uid": userProfile.uid,
                "username": userProfile.username,
                "photoURL": userProfile.photoURL.absoluteString
            ],
            "text": textView.text,
            "timestamp": [".sv":"timestamp"]
        ] as [String:Any]
        
        postRef.setValue(postObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.delegate?.didUploadPost(withID: ref.key)
                self.dismiss(animated: true, completion: nil)
            } else {
                // Handle the error
            }
        })
    }
    
    @IBAction func handleCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        textView.resignFirstResponder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            super.dismiss(animated: flag, completion: completion)
        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.tintColor = secondaryColor
        
        doneButton.backgroundColor = secondaryColor
        doneButton.layer.cornerRadius = doneButton.bounds.height / 2
        doneButton.clipsToBounds = true
        
        textView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
        
        // Remove the nav shadow underline
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeHolderLabel.isHidden = !textView.text.isEmpty
    }
}

