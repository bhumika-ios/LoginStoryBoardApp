//
//  ForgotPasswordTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 18/04/22.
//

import UIKit

class ForgotPasswordTableViewController: UITableViewController {
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func btnSendOTPClicked(_ sender: UIButton) {
            emailValidation()
            if let sendVC = self.storyboard?.instantiateViewController(identifier: "OTPScreenTableTableViewController") as? OTPScreenTableTableViewController{
            self.navigationController?.pushViewController(sendVC, animated: true)
        }
        
    }
    @IBAction func btnBackClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func emailValidation(){
        if let email = txtEmail.text{
            if !email.validateEmail(){
                openAlert(title: "Alert", message: "Enter valid email", alertStyle: .alert, actionTitles: ["ok"], actionStyles: [.default], actions: [{_ in }])
            }
        }
    }
}


