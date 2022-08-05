//
//  ForgotPasswordTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 18/04/22.
//

import UIKit

class ForgotPasswordTableViewController: UITableViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet var forgetBg: UIView!
    @IBOutlet var BgViewforget: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorTop = UIColor(red: 0.87, green: 0.37, blue: 0.54, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.97, green: 0.73, blue: 0.59, alpha: 1.00).cgColor
       
        let newLayer = CAGradientLayer()
        newLayer.frame = self.BgViewforget.bounds
        newLayer.colors = [ colorTop, colorBottom ]
        
        
        self.BgViewforget.layer.insertSublayer(newLayer, at: 0)
            
       
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


