//
//  ViewController.swift
//  SampleSignInFlow
//
//  Created by Shivam Patel on 13/06/22.
//

import UIKit

class SignInUserViewController: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func tappedOnContinueButton(_ sender: Any) {
        
        APIHelper.shareInstance.onPostToAPIEmailVerify(email: emailTF.text ?? "") {
            (response:UserResponse) in
            let responseResult = response.results
            if responseResult.isLogin {
                //Move to second Screen along with device token
                DispatchQueue.main.async {
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "VerifyOTPViewController") as? VerifyOTPViewController {
                        vc.email = self.emailTF.text
                        vc.response = response
                        self.present(vc, animated: true, completion: nil)
                    }
                }
                
            }
            
        }
        
    }
}

