//
//  SignUpTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 16/04/22.
//

import UIKit

class SignUpTableViewController: UITableViewController {
 
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtUsername: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var txtPassword: UILabel!
    @IBOutlet weak var txtConfirmPassword: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgProfile.addGestureRecognizer(tapGesture)
    }
    @objc
    func imageTapped(tapGestureRecognizer: UIGestureRecognizer){
       // print("Image Tapped!")
        openGallery()
    }
    @IBAction func btnSignup(_ sender: UIButton) {
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
