//
//  DashboardViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 30/04/22.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet var homeBg: UIView!
    @IBOutlet weak var lblName: UILabel!
    var strName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorTop = UIColor(red: 0.87, green: 0.37, blue: 0.54, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.97, green: 0.73, blue: 0.59, alpha: 1.00).cgColor
       
        let newLayer = CAGradientLayer()
        newLayer.frame = self.homeBg.bounds
        newLayer.colors = [ colorTop, colorBottom ]
        
        
        self.homeBg.layer.insertSublayer(newLayer, at: 0)
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
