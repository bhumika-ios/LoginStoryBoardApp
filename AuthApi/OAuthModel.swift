//
//  OAuthModel.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 26/04/22.
//

import Foundation

//struct OAuthModel: Encodable{
////    let grant_type = "password"
////    let client_id = "2"
////    let client_secret = "w4M3YEKamG4A1pvzXs9zPfoopE6I1babZemgkFh3"
////    let scope = "*"
//    let username: String
//    let password: String
//}

struct OAuthModel: Encodable {
    let email: String
    let password: String
}
