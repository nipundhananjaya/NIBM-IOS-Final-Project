

import UIKit
import LocalAuthentication
import Firebase
import Kingfisher

class MyProfileViewController: UIViewController {
    
    
    @IBOutlet weak var MyPhoto: UIImageView!
    @IBOutlet weak var MyName: UILabel!
    @IBOutlet weak var MyAge: UILabel!
    @IBOutlet weak var DateOfBirth: UILabel!
    @IBOutlet weak var MyPhoneNo: UILabel!
    @IBOutlet weak var FingerprintAuth: UIView!
    
    let defaults = UserDefaults.standard
    var isAuthorised:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.handleFaceId()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        handleFaceId()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    func loadUserData(){
        
        Database.database().reference().child("MyAccount").observeSingleEvent(of: .value, with: {( snapshot ) in
            
            if let dictionary = snapshot.value as?  NSDictionary{
                let firstname = dictionary["firstname"] as! String
                let lastname = dictionary["lastname"] as! String
                let profileimageurl = dictionary["profileimageurl"] as! String
                let phonenumber = dictionary["phone number"] as! String
                let age = dictionary["age"] as! Int
                let birthdate = dictionary["birthdate"] as! String
                
                print(firstname)
                
                let url = URL(string:profileimageurl)
                self.MyPhoto.kf.indicatorType = .activity
                let processor = RoundCornerImageProcessor(cornerRadius: 20)
                self.MyPhoto.kf.setImage(with: url , options:[.processor(processor)])
                self.MyName.text = "\(firstname) \(lastname)"
                self.MyAge.text = age.description
                self.MyPhoneNo.text = phonenumber
                self.DateOfBirth.text = birthdate
            }
            else{
                print("No values")
            }
        })
    }
    
    @objc fileprivate func handleFaceId(){
        let context = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "to check the faceid/touchid") { (wasSuccessful, error) in
                if wasSuccessful{
                    DispatchQueue.main.async {
                        
                        self.loadUserData()
                    }
                    
                }
                else{
                    let alert = UIAlertController(title: "Incorrect Credentials", message:"Please Try Again", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                }
            }
            
        }
        else{
            let alert = UIAlertController(title: "Error", message:"FaceID/TouchID Not Configured!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)        }
    }
    
    
    
    func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
