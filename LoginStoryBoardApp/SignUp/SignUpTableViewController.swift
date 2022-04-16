//
//  SignUpTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 16/04/22.
//

import UIKit

class SignUpTableViewController: UITableViewController {
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
       
    }
}
