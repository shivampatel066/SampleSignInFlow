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
    
    func onPostToAPI(email:String,handler:@escaping CompletionHandler) {
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
            } catch  {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


