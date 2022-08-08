//
//  SignUpTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 16/04/22.
//

import UIKit

class SignUpTableViewController: UITableViewController {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    let button = UIButton(type: .custom)
    let button1 = UIButton(type: .custom)
    
    
    @IBOutlet var bgView2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // password
        
        txtPassword.rightViewMode = .unlessEditing

        button.setImage(UIImage(named: "closedeye4"), for: .normal)

       // button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -24, bottom: 5, right: 15)
        //button.frame = CGRect(x: 0, y: 0, width: UIImage(named: "closedeye")!.size.width, height: UIImage(named: "closedeye")!.size.height)
        button.frame =  CGRect(x: CGFloat(txtPassword.frame.size.width - 25), y: CGFloat(5), width: CGFloat(15), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.btnPasswordVisibilityClicked), for: .touchUpInside)
        txtPassword.rightView = button
        txtPassword.rightViewMode = .always
        
        // confirmpassword
        
        button1.setImage(UIImage(named: "closedeye4"), for: .normal)

       // button.imageEdgeInsets = UIEdgeInsets(top: 5, left: -24, bottom: 5, right: 15)
        //button.frame = CGRect(x: 0, y: 0, width: UIImage(named: "closedeye")!.size.width, height: UIImage(named: "closedeye")!.size.height)
        button1.frame =  CGRect(x: CGFloat(txtPassword.frame.size.width - 25), y: CGFloat(5), width: CGFloat(15), height: CGFloat(25))
        button1.addTarget(self, action: #selector(self.btnConfirmPasswordVisibilityClicked), for: .touchUpInside)
        txtConfirmPassword.rightView = button1
        txtConfirmPassword.rightViewMode = .always
        
        let colorTop = UIColor(red: 0.87, green: 0.37, blue: 0.54, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.97, green: 0.73, blue: 0.59, alpha: 1.00).cgColor
       
        let newLayer = CAGradientLayer()
        newLayer.frame = self.bgView2.bounds
        newLayer.colors = [ colorTop, colorBottom ]
        
        
        self.bgView2.layer.insertSublayer(newLayer, at: 0)
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgProfile.addGestureRecognizer(tapGesture)
    }
    // password
    
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
    
    //confirmpassword
    
    @IBAction func btnConfirmPasswordVisibilityClicked(_ sender: Any) {
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        if (sender as! UIButton).isSelected {
            self.txtConfirmPassword.isSecureTextEntry = false
            button1.setImage(UIImage(named: "openeye1"), for: .normal)
           // button.frame =  CGRect(x: CGFloat(txtPassword.frame.size.width - 0), y: CGFloat(0), width: CGFloat(0), height: CGFloat(0 ))
        }else{
            self.txtConfirmPassword.isSecureTextEntry = true
            button1.setImage(UIImage(named: "closedeye4"), for: .normal)
           // button.frame =  CGRect(x: CGFloat(txtPassword.frame.size.width - 0), y: CGFloat(0), width: CGFloat(0), height: CGFloat(0))
        }
    }
    
    @objc
    func imageTapped(tapGestureRecognizer: UIGestureRecognizer){
       // print("Image Tapped!")
        openGallery()
    }
    @IBAction func btnSignup(_ sender: UIButton) {
        
        let imgSystem = UIImage(systemName: "person.crop.circle.badge.plus")
        
        if imgProfile.image?.pngData() != imgSystem?.pngData() {
            if
                let username = txtUsername.text ,
                let email = txtEmail.text,
                let password = txtPassword.text,
                let conPassword = txtConfirmPassword.text{
                if !email.validateEmail(){
                    openAlert(title: "Alert", message: "Please valid Email address..", alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
                        print("oky clicked!")
                    }])
                } else if username == ""{
                    openAlert(title: "Alert", message: "Please valid username address..", alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
                                            print("oky clicked!")
                                        }])
                   
                }  else if !password.validatePassword(){
                    print("password is not valid")
                }else{
                    if conPassword == ""{
                        print("please confirm password")
                    }else{
                        if password == conPassword{
                            print("navigation code")
                        }else{
                            print("password does not match")
                        }
                    }
                }
            }else{
                print("please check detail")
            }
               
       
         }else{
           print("please select profile pic")
      }
        DataBase()
        
  }
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
       
    }
}

extension SignUpTableViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func  openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .savedPhotosAlbum
            present(picker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[.originalImage] as? UIImage{
            imgProfile.image = img
        }
        dismiss(animated: true)
    }
}
extension SignUpTableViewController{
    
    func DataBase(){
        guard let username = self.txtUsername.text else { return }
        guard let email = self.txtEmail.text else { return }
        guard let password = self.txtPassword.text else { return }
        let register = RegisterModel(username: username, email: email, password: password)
        ApiManager.shareInstance.callingregisterAPI(register: register) {
            (isSuccess, str) in
            if isSuccess{
                self.openAlert(title: "Alert", message: str, alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
                    print("oky clicked!")
                }])
            }else{
                self.openAlert(title: "Alert", message: str, alertStyle: .alert, actionTitles: ["oky"], actionStyles: [.default], actions: [{ _ in
                    print("oky clicked!")
            }])
          }
        }
    }
}
