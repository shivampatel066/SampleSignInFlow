//
//  APIHelper.swift
//  SampleSignInFlow
//
//  Created by Shivam Patel on 13/06/22.
//

import Foundation

typealias CompletionHandler = (UserResponse)->()

class APIHelper{
    
    static let shareInstance = APIHelper()
    
    private init() {}
    
    func onPostToAPIEmailVerify(email:String,handler:@escaping CompletionHandler) {
        let parameters: [String: Any] = [
            "email": "mayank@getbasis.co"
        ]
        
        guard let url = URL(string: "https://hiring.getbasis.co/candidate/users/email") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //Method
        
        //body
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        //header
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                if let jsonResponse = try? JSONDecoder().decode(UserResponse.self, from: data) {
                    handler(jsonResponse)
                }
            } 
        }.resume()
    }
    
    func onPostToAPIOTPVerify(email:String,otp:String,response:UserResponse) {
        let parameters: [String: Any] = [
            "email": "mayank@getbasis.co",
            "token": 1651480806787,
            "verificationCode":112233
        ]
        
        guard let url = URL(string: "https://hiring.getbasis.co/candidate/users/email/verify") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //Method
        
        //body
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        //header
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                if let jsonResponse = try? JSONSerialization.jsonObject(with: data) {
                    
                }
            } catch  {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


