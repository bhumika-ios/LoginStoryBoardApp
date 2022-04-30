//
//  DashboardViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 30/04/22.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    var strName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = strName


        // Do any additional setup after loading the view.
    }
   

    
    @IBAction func btnLogOutTapped(_ sender: UIBarButtonItem) {
        TokenService.tokenInstance.removeToken()
        self.navigationController?.popToRootViewController(animated: true)
    
    }
}

extension DashboardViewController{
    static func shareInstance() -> DashboardViewController{
        return DashboardViewController.instantiateFromStoryboard("Dashboard")
    }
}
