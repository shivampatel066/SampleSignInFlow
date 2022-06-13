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
        if let text = emailTF.text {
            APIHelper.shareInstance.onPostToAPI(email: text) {
                (response:UserResponse) in
                if let response = response.results {
                    if response.isLogin {
                        //Move to second Screen along with device token
                    }
                }
            }
        }
    }
}

