//
//  UserLoginVC.swift
//  SquadFinder
//
//  Created by Luis Burga Mideros (s5109289) on 07/05/2019.
//  Copyright © 2019 George Wilshaw (s5060140). All rights reserved.
//

import UIKit
import Firebase

class UserLoginVC: UIViewController {




}







//    func goToCreateUserVC() {
//        performSegue(withIdentifier: "SignUp", sender: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SignUp" {
//            if let destination = segue.destination as? UserVC {
//                if userUid != nil {
//                    destination.userUid = userUid
//                }
//                if emailField.text != nil {
//                    destination.emailField = emailField.text
//                }
//                if passwordField.text != nil {
//                    destination.passwordField = passwordField.text
//                }
//            }
//            @IBAction func signInTapped(_ sender: Any){
//                if let email = emailField.text, let password = passwordField.text {
//                    FirebaseApp.Auth()?.signIn(withEmail: email, password: passworsd, completion:
//                        { (user,error) in
//                            if error == nil {
//                                if let user = user {
//                                    self.userUid = user.uid
//                                    self.goToCreateUserVC()
//                                }
//                            } else {
//                                self.goToCreateUserVC()
//                            }
//                    });
//                }
//}
