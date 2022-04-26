//
//  OAuthManager.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 26/04/22.
//

import Foundation
import Alamofire

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
                    let json = try
                    JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200	{
                        let test = response
                        print(test)
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
