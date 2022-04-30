//
//  HomeTableViewController.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 28/04/22.
//

import UIKit

class HomeTableViewController: UITableViewController {

    @IBOutlet weak var lblName: UILabel!
    var strName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = strName

      
    }
    @IBAction func btnLogOutclicked(_ sender: UIButton) {
        TokenService.tokenInstance.removeToken()
        self.navigationController?.popToRootViewController(animated: true)
    }
    //    @IBAction func btnBack2Clicked(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
//    }
    
   
}
//extension HomeTableViewController{
//    static func shareInstance() -> HomeTableViewController{
//        return HomeTableViewController
//    }
//}
