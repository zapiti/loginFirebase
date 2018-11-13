//
//  MainController.swift
//  loginFirebase
//
//  Created by Nathan Ranghel on 21/10/18.
//  Copyright © 2018 Nathan Ranghel. All rights reserved.
//

import Foundation
import Firebase

class MainController: UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        if Auth.auth().currentUser != nil {
            // User is signed in.
            // ...
          Auth.auth().addStateDidChangeListener { (auth, user) in
            print("UserID = \(user?.uid as Any)")
        }
            
        } else {
            // No user is signed in.
            // ...
            
            handleLogout()
        }
        
 
    }



@objc func handleLogout() {
    
    do {
        try Auth.auth().signOut()
    } catch let logoutError {
        print(logoutError)
    }
    
    let loginController = LoginController()
 
    present(loginController, animated: true, completion: nil)
}

}
