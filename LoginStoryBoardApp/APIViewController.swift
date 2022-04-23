//
//  APIViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 20/04/22.
//

import UIKit

class APIViewController: UITableViewController {

    struct Constants {
        static let userUrl = URL(string: "https://jsonplaceholder.typicode.com/users")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }


}
extension URLSession {
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    func request<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        guard let url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        let task = dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }

            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
                
}
