//
//  TokenService.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 30/04/22.
//

import UIKit

class TokenService{
    static let tokenInstance = TokenService()
    let userDefault = UserDefaults.standard
    
    func saveToken(token: String){
        userDefault.set(token, forKey: Tokenkey.userLogin)
    }
    func getToken() -> String{
       // userDefault.string(forKey: Tokenkey.userLogin)
        if let token = userDefault.object(forKey: Tokenkey.userLogin) as? String{
            return token
        }else{
            return ""
        }
        
    }
    func checkForLogin() -> Bool{
        if getToken() == ""{
            return false
        }else{
            return true
        }
    }
    func removeToken(){
        userDefault.removeObject(forKey: Tokenkey.userLogin)
    }
}
