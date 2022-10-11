//
//  SignUpViewController.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-15.
//



//██████╗░███████╗██████╗░██████╗░███████╗░█████╗░░█████╗░████████╗███████╗██████╗░
//██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██╔══██╗
//██║░░██║█████╗░░██████╔╝██████╔╝█████╗░░██║░░╚═╝███████║░░░██║░░░█████╗░░██║░░██║
//██║░░██║██╔══╝░░██╔═══╝░██╔══██╗██╔══╝░░██║░░██╗██╔══██║░░░██║░░░██╔══╝░░██║░░██║
//██████╔╝███████╗██║░░░░░██║░░██║███████╗╚█████╔╝██║░░██║░░░██║░░░███████╗██████╔╝
//╚═════╝░╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚══════╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░



//import UIKit
//import FirebaseAuth
//
//class SignUpViewController: UIViewController {
//
//    @IBOutlet weak var signUpButton: UIButton!
//    @IBOutlet weak var emailField: UITextField!
//    @IBOutlet weak var passwordField: UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func signUpHandler (_ sender: Any) {
//
//        guard let theUsername = emailField.text, !theUsername.isEmpty,
//              let thePassword = passwordField.text, !thePassword.isEmpty else {
//            print("!!! ERROR: Missing field data for username, and or, password !!!")
//            return
//        }
//        print("Logged in attempt for: \n \(theUsername) && \(thePassword)")
//        FirebaseAuth.Auth.auth().createUser(withEmail: theUsername, password: thePassword, completion: {result, error in
//
//            guard error == nil else {
//                print("Account Creation Failed!")
//                return
//            }
//            print("You have created an account!")
//        })
//    }
//}
