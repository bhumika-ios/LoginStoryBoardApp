//
//  OAuthManager.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 26/04/22.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

struct Login: Encodable {
    let email: String
    let password: String
}

class OAuthManager{
    static let shareInstance = OAuthManager()
    
    func callingoauthAPI(register: OAuthModel, completionHandler: @escaping (Bool, String) -> ()){
        let headers: HTTPHeaders = [
//            .contentType("application/x-www-form-urlencoded")
            .authorization("Bearer 26|cvtVgeLU5MV1jUdQgeinDtupug8zycLU1NX6ppXN")
            //.contentType("multipart/form-data;")
        ]
        
       // let login = Login(email: email, password: password)

//        AF.request("https://demologin.laraveldeveloper.online/api/login",
//                   method: .post,
//                   parameters: login,
//                   encoder: JSONParameterEncoder.default).response { response in
//            debugPrint(response)
//        }
//
//        AF.request("https://demologin.laraveldeveloper.online/api/v1/users", method: .get, headers: headers).responseJSON{responsetest in
//            debugPrint(responsetest)
//        }
        
//        let parameters = ["title": "foo", "body": "bar", "userId": "1"]
//
        AF.request("https://demologin.laraveldeveloper.online/api/login", method: .post, headers: headers).response{responsetest in
            debugPrint(responsetest)
        }
        
        AF.request(oauth_url, method: .post, parameters: register, headers: headers).response{ response in
            debugPrint(response)
            switch response.result{
            case.success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    print(json)
                    if response.response?.statusCode == 200    {
                        if let parseJSON = json{
                            print(parseJSON)
                            let accessToken = parseJSON["access_token"] as? String
                            print("accessToken:\(accessToken)")
                            let saveAccessToken: Bool = KeychainWrapper.standard.set(accessToken!, forKey: "accessToken")
                            print("The access token save result: \(saveAccessToken)")
//                        if (accessToken?.isEmpty)!
//                        {
//                            self.displayMessage(userMessage: "try again")
//                            return
//                        }

                    }

//                        let test = response
//                        print(test)
                        completionHandler(true, "Open Successfully")
                    }else{
                        completionHandler(false, "try Again")
                    }

                }catch{
                    print(error.localizedDescription)
                    completionHandler(false, "try Again")
                }
            case.failure(let err):
                print(err.localizedDescription)
                completionHandler(false, "try Again")
            }
            
        }
            
    }
}
