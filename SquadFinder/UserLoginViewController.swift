import UIKit
import MapKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    @IBOutlet weak var titleMain: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    var userUid: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func goToCreateUserVC() {
        performSegue(withIdentifier: "SignUp", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUp" {
            if let destination = segue.destination as? UserVC {
                if userUid != nil {
                    destination.userUid = userUid
                    }
                if emailTextField != nil {
                    destination.emailTextField = emailTextField.text
                }
                if passwordTextField != nil {
                    destination.passwordTextField = passwordTextField.text
                }
            }
        }
    }
        
    @IBAction func login(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            FirebaseApp.Auth()?.signIn(withEmail: email, password: password, completion:
                { (user,error) in
                    if error == nil {
                        if let user = user {
                            self.userUid = user.uid
                            self.goToCreateUserVC()
                        }
                    } else {
                        self.goToCreateUserVC()
                    }
            });
        }
    
    
    
    
    
    }
    
    
    
    
    
    
}
