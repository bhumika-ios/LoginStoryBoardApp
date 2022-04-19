//
//  OTPScreenTableTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 18/04/22.
//

import UIKit

class OTPScreenTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnBackOTPClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
