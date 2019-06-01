

import UIKit
import Firebase

class signInViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//Sign in button Click event
    
    @IBAction func signInUser(_ sender: UIButton) {
    
        //self.loadingView.alpha = CGFloat(1.0)
        if (email.text?.isEmpty)!{
            //self.loadingView.alpha = CGFloat(0.0)
            let alert = UIAlertController(title: "Error", message:"Please Enter Valid Email!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
            return
        }
        else if (password.text?.isEmpty)!{
            //self.loadingView.alpha = CGFloat(0.0)
            let alert = UIAlertController(title: "Error", message:"Please Enter Valid Password!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        else{
            
            Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!) { [weak self] user, error in
                guard let strongSelf = self else { return }
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    //self?.loadingView.alpha = CGFloat(0.0)
                    strongSelf.present(alert, animated: true, completion: nil)
                } else {
                    strongSelf.dismiss(animated: true, completion: nil)
                    
                    print("logged in")
                    print(user?.user.uid)
                    
                    
                    //End
                    
                    //Open next UI
                    //strongSelf.loadingView.alpha = CGFloat(0.0)
                    let storyboard = UIStoryboard(name: "Home", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "Home") as! TabBarViewController
                    strongSelf.present(controller, animated: true, completion: nil)
                    //End
                }
            }
        }
    }
//End of the Sign in button event
}

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init()
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
