//
//  UserResponse.swift
//  SampleSignInFlow
//
//  Created by Shivam Patel on 13/06/22.
//

import Foundation

struct UserResponse: Decodable {
    let results:Results
}

struct Results: Decodable {
    let isLogin: Bool
    let token: Int
}
