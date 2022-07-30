//
//  GradientView.swift
//  LoginStoryBoardApp
//
//  Created by Bhumika Patel on 30/07/22.
//

import UIKit
@IBDesignable
class GradientView: UIView{
    @IBInspectable var  FirstColor: UIColor = UIColor.clear{
    didSet{
        updateView()
        }
    }
    @IBInspectable var  SecondColor: UIColor = UIColor.clear{
        didSet{
            updateView()
            }
    }
    override class var layerClass: AnyClass{
        get {
            return CAGradientLayer.self
        }
    }
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor, SecondColor.cgColor ]
    }
    
}
//class GradientView: UIViewController{
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [
//            UIColor.systemBlue.cgColor,
//            UIColor.systemTeal.cgColor,
//        ]
//        view.layer.addSublayer(gradientLayer)
//    }
//}
