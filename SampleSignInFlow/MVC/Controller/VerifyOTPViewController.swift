//
//  VerifyOTPViewController.swift
//  SampleSignInFlow
//
//  Created by Shivam Patel on 13/06/22.
//

import UIKit

class VerifyOTPViewController: UIViewController {

    
    @IBOutlet weak var OTPTextField: UITextField!
    
    var email:String? = ""
    var response:UserResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    
    @IBAction func tappedVerifyButton(_ sender: Any) {
        if let response = response, let email = email {
            APIHelper.shareInstance.onPostToAPIOTPVerify(email: email, otp: self.OTPTextField.text ?? "", response: response)
        }
    }
}
