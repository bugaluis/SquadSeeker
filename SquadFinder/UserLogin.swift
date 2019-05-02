//import Foundation
//import Firebase
//
//class UserLogin {
//    
//    @IBOutlet weak var tfEmail: UITextField!
//    @IBOutlet weak var tfPassword: UITextField!
//    
//    
//    @IBOutlet weak var btnCreate: UIButton!
//    @IBOutlet weak var btnLogin: UIButton!
//    
//    
//    
//    @IBAction func doBtnCreate(_ sender: Any) {
//        if let email = tfEmail.text, let password = tfPassword.text {
//            Auth.auth().createUser(withEmail: email, password: password,
//                                   completion: (user, error) in
//                print (user?.email?? "no email")
//                print (Auth.auth().currentUser?.uid ?? "no userid")
//        })
//    }
//}
//
//@IBAction func doBtnLogin(_ sender: Any) {
//    if Auth.auth().currentUser == nil {
//        if let email = tfEmail.text, let password = tfPassword.text {
//            Auth.auth().signIn(withEmail: email, password: password,
//                               completion: { (user, error) in
//                                if error == nil {
//                                    self.btnLogin.setTitle("Logout", for: .normal)
//                                }
//            })
//        }
//    }
//    else{
//        do {
//            try Auth.auth().signOut()
//            self.btnLogn.setTitle(title:"Login", for: .normal)
//        }
//        catch {}
//        
