//
//  OTPScreenTableTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 18/04/22.
//

import UIKit

class OTPScreenTableTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var txtVeyfyCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtVeyfyCode.delegate = self

    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = "1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }

    @IBAction func btnBackOTPClicked(_ sender: UIButton) {
   
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnVeryfyClicked(_ sender: UIButton) {
    
        if let veryfy = txtVeyfyCode.text{
            if !veryfy.validateVeryfy(){
                openAlert(title: "Alert", message: "Please valid Number", alertStyle: .alert, actionTitles: ["ok"], actionStyles: [.default], actions: [{_ in }])
            } else {
                openAlert(title: "Alert", message: "Successful", alertStyle: .alert, actionTitles: ["ok"], actionStyles: [.default], actions: [{_ in }])
            }
            
        }
    }
}
