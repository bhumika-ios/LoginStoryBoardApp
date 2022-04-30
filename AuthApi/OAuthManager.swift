//
//  OAuthManager.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 26/04/22.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

class OAuthManager{
    static let shareInstance = OAuthManager()
    
    func callingoauthAPI(register: OAuthModel, completionHandler: @escaping (Bool, String) -> ()){
        let headers: HTTPHeaders = [
            //.contentType("multipart/form-data;")
        ]
        AF.request(oauth_url, method: .post, parameters: register, headers: headers).response{ response in
            debugPrint(response)
            switch response.result{
            case.success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    if response.response?.statusCode == 200    {
                        if let parseJSON = json{
                            let accessToken = parseJSON["token_type"] as? String
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
