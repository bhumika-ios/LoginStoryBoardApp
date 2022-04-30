//
//  UIViewController + Extension.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 30/04/22.
//

import Foundation
import UIKit

extension UIViewController{
    class func instantiateFromStoryboard(_ name: String) -> Self
    {
        return instantiateFromStoryboardHelper(name)
    }
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "\(self.self)") as! T
        return controller
    }
    func popupAlert(title: String, message: String, alertControllerStyle: UIAlertController.Style, acrtionTitles: [String], actionStyles:[UIAlertAction.Style], alertActions: [((UIAlertAction) -> Void)]){
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertControllerStyle)
        for (index, title) in acrtionTitles.enumerated(){
            let action = UIAlertAction(title: title, style: actionStyles[index], handler: alertActions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
