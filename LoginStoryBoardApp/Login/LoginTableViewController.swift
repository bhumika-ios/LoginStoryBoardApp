//
//  LoginTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 15/04/22.
//

import UIKit
import SwiftKeychainWrapper

class LoginTableViewController: UITableViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    
 
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        
       // Validation()
        DataBase()
    }
    

  
        
    @IBAction func btnForgotPassClicked(_ sender: UIButton) {
        if let forgotVC = self.storyboard?.instantiateViewController(identifier: "ForgotPasswordTableViewController") as? ForgotPasswordTableViewController{
            self.navigationController?.pushViewController(forgotVC, animated: true)
        }
    }
    
    

    
    @IBAction func btnSignUpClicked(_ sender: UIButton) {

        if let signupVC = self.storyboard?.instantiateViewController(identifier: "SignUpTableViewController") as? SignUpTableViewController{
            self.navigationController?.pushViewController(signupVC, animated: true)
        }
    }
}
    
extension LoginTableViewController {
    fileprivate func Validation() {
        if let email = txtEmail.text, let password = txtPassword.text {
            if !email.validateEmail(){
                openAlert(title: "Alert", message: "Please valid Email address..", alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
                    print("oky clicked!")
                }])
            } else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Please valid Password..", alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
                    print("oky clicked!")
                }])
            }else {
                
            }
        }else {
            openAlert(title: "Alert", message: "Please add Details..", alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
                print("oky clicked!")
            }])
        }
    }
    func DataBase(){
        guard let username = self.txtEmail.text else { return }
        guard let password = self.txtPassword.text else { return }
        let register = OAuthModel(username: username, password: password)
        OAuthManager.shareInstance.callingoauthAPI(register: register) {
        //OAuthManager.shareInstance.callingregisterAPI(register: register) {
            (isSuccess, str) in
            if isSuccess{
//                self.openAlert(title: "Alert", message: str, alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
//                    print("oky clicked!")
//                }])
                if let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeTableViewController") as? HomeTableViewController{
                    homeVC.strName = username
                    self.navigationController?.pushViewController(homeVC, animated: true)
                }
//                if let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeTableViewController") as? HomeTableViewController{
//                    homeVC.strName = username
//                    self.navigationController?.pushViewController(homeVC, animated: true)
//                }
                
            }else{
                self.openAlert(title: "Alert", message: str, alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
                    print("oky clicked!")
            }])
          }
        }
    }
}







//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UIScreen.main.bounds.height
//    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let tableViewHeight = self.tableView.frame.height
//        let contentHeight = self.tableView.contentSize.height
//
//        let centeringInset = (tableViewHeight - contentHeight) / 2.0
//        let topInset = max(centeringInset, 0.0)
//
//        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
//    }
