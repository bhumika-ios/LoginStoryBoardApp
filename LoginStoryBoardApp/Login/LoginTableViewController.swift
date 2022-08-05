//
//  LoginTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 15/04/22.
//

import UIKit
import SwiftKeychainWrapper


class LoginTableViewController: UITableViewController {
    
    var iconClick = false
    let imageicon = UIImageView()
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    let button = UIButton(type: .custom)
    
    
    @IBOutlet var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // second code
//        imageicon.image = UIImage(named: "closedeye")
//
//        let contentView = UIView()
//        contentView.addSubview(imageicon)
//
//        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "closedeye")!.size.width, height: UIImage(named: "closedeye")!.size.height)
//        imageicon.frame = CGRect(x: -10, y: 0,width: UIImage(named: "closedeye")!.size.width, height: UIImage(named: "closedeye")!.size.height)
//
//        txtPassword.rightView = contentView
//        txtPassword.rightViewMode = .always
//
//        let tapGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
//        imageicon.isUserInteractionEnabled = true
//        imageicon.addGestureRecognizer(tapGestureRecognizer)
        
        
        //firstcode
        txtPassword.rightViewMode = .unlessEditing

        button.setImage(UIImage(named: "closedeye4"), for: .normal)

       // button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -24, bottom: 5, right: 15)
        //button.frame = CGRect(x: 0, y: 0, width: UIImage(named: "closedeye")!.size.width, height: UIImage(named: "closedeye")!.size.height)
        button.frame =  CGRect(x: CGFloat(txtPassword.frame.size.width - 25), y: CGFloat(5), width: CGFloat(15), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.btnPasswordVisibilityClicked), for: .touchUpInside)
        txtPassword.rightView = button
        txtPassword.rightViewMode = .always
        
        
        let colorTop = UIColor(red: 0.87, green: 0.37, blue: 0.54, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.97, green: 0.73, blue: 0.59, alpha: 1.00).cgColor
       
        let newLayer = CAGradientLayer()
        newLayer.frame = self.bgView.bounds
        newLayer.colors = [ colorTop, colorBottom ]
        
        
        self.bgView.layer.insertSublayer(newLayer, at: 0)
    }
    // secondcode
//    @objc func imageTapped(tapGestureRecognizer: UIGestureRecognizer){
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
//
//        if iconClick{
//            iconClick = false
//            tappedImage.image = UIImage(named: "openeye")
//            txtPassword.isSecureTextEntry = false
//
//        } else{
//            iconClick = true
//            tappedImage.image = UIImage(named: "closedeye")
//            txtPassword.isSecureTextEntry = true
//        }
//    }
    // firstcode
    @IBAction func btnPasswordVisibilityClicked(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.txtPassword.isSecureTextEntry = false
            button.setImage(UIImage(named: "openeye1"), for: .normal)
           // button.frame =  CGRect(x: CGFloat(txtPassword.frame.size.width - 0), y: CGFloat(0), width: CGFloat(0), height: CGFloat(0 ))
        }else{
            self.txtPassword.isSecureTextEntry = true
            button.setImage(UIImage(named: "closedeye4"), for: .normal)
           // button.frame =  CGRect(x: CGFloat(txtPassword.frame.size.width - 0), y: CGFloat(0), width: CGFloat(0), height: CGFloat(0))
        }
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
        let register = OAuthModel(email: username, password: password)
        OAuthManager.shareInstance.callingoauthAPI(register: register) {
        //OAuthManager.shareInstance.callingregisterAPI(register: register) {
            (isSuccess, str) in
            if isSuccess{
                
                let dashboardVC = DashboardViewController.shareInstance()
                dashboardVC.strName = username
                self.navigationController?.pushViewController(dashboardVC, animated: true)
//                self.openAlert(title: "Alert", message: str, alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
//                    print("oky clicked!")
//                }])
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
