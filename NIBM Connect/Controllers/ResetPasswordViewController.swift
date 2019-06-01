//
//  ResetPasswordViewController.swift
//  NIBM Connect
//
//  Created by Tharindu Randunu on 5/26/19.
//  Copyright © 2019 NIBM. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    private lazy var currentUser: User? = {
        return Auth.auth().currentUser
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
  
    @IBAction func ResetPassword(_ sender: UIButton) {
        
//        self.loadingView.alpha = CGFloat(1.0)
        
        if (email.text?.isEmpty)!{
//            self.loadingView.alpha = CGFloat(0.0)
            let alert = UIAlertController(title: "Error", message:"Enter Email!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        else if (currentUser?.email != email.text){
//            self.loadingView.alpha = CGFloat(0.0)
            let alert = UIAlertController(title: "Error", message:"Enter Valid Email!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        else{
            //reset password
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
//                        self.loadingView.alpha = CGFloat(0.0)
                        let alert = UIAlertController(title: "Success", message:"Password Reset Success!", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .cancel, handler: {action in self.passwordRestDone()})
                        alert.addAction(action)
                        self.present(alert, animated: true)
                    }
                }
            })
        }
        
    }
    
    
    //Password reset Ok Handler function
    func passwordRestDone(){
        print("Clicked")
        self.navigationController?.popViewController(animated: true)
    }

}

