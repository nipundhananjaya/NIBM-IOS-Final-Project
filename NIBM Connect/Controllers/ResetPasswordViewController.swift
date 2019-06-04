

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    private lazy var currentUser: User? = {
        return Auth.auth().currentUser
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
  
    @IBAction func ResetPassword(_ sender: UIButton) {
        
        
        if (email.text?.isEmpty)!{
            let alert = UIAlertController(title: "Error", message:"Enter Email!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        else if (currentUser?.email != email.text){
            let alert = UIAlertController(title: "Error", message:"Enter Valid Email!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        else{
            let resetEmail = self.email.text!
            Auth.auth().sendPasswordReset(withEmail: resetEmail, completion: { (error) in
                //Make sure you execute the following code on the main queue
                DispatchQueue.main.async {
                    //Use "if let" to access the error, if it is non-nil
                    if let error = error {
//                        self.loadingView.alpha = CGFloat(0.0)
                        let alert = UIAlertController(title: "Error", message:"Password Reset Unsuccess!", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true)
                        return
                    } else {
                        let alert = UIAlertController(title: "Success", message:"Password Reset Success!", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .cancel, handler: {action in self.passwordRestDone()})
                        alert.addAction(action)
                        self.present(alert, animated: true)
                    }
                }
            })
        }
        
    }
    
    
    func passwordRestDone(){
        print("Clicked")
        self.navigationController?.popViewController(animated: true)
    }

}

