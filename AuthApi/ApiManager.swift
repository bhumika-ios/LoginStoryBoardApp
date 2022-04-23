//
//  ApiManager.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 20/04/22.
//

import Foundation
import Alamofire

class ApiManager{
    static let shareInstance = ApiManager()
    
    func callingregisterAPI(register: RegisterModel){
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            switch response.result{
            case.success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    
                }catch{
                    print(error.localizedDescription)
                }
            case.failure(let err):
                print(err.localizedDescription)
            }
            
        }
            
    }
}
