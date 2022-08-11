//
//  LoginViewController.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-06-22.
//

import UIKit
import FirebaseAuth
import SwiftUI

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginHandler(_ sender: Any) {
        guard let theUsername = username.text, !theUsername.isEmpty,
              let thePassword = password.text, !thePassword.isEmpty else {
            print("!!! ERROR: Missing field data for username, and or, password !!!")
            return
        }
        print("Logged in attempt for: \n \(theUsername) && \(thePassword)")
        
        // Get auth
        // Attempt sign in
            // If fail offer acc create acc
        
        FirebaseAuth.Auth.auth().signIn(withEmail: theUsername, password: thePassword, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                print("Login Fail")
                strongSelf.showAccountCreation(email: theUsername, password: thePassword );
                return
            }
            print("You have signed in!")
            
            //let nextViewController = MainViewController()
            
            //self.performSegue(withIdentifier: "loginMainSegue", sender: nil)
            //self.present(nextViewController, animated: true, completion: nil)
        })
    }
    
    func showAccountCreation(email : String, password: String){
        let alert = UIAlertController(title: "Create Account?", message: "Would you like to create and account for \(email)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self]result, error in
                
                guard let strongSelf = self else {
                    return
                }
                
                guard error == nil else {
                    print("Account Creation Failed!")
                    return
                }
                print("You have signed in!")
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {_ in
            
        }))
    }
}
