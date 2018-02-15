//
//  HomeViewController.swift
//  TruckyCP
//
//  Created by Abdul Shamim on 2/9/18.
//  Copyright © 2018 Abdul Shamim. All rights reserved.
//

import UIKit

protocol HomeControllerDelegate {
    func bookingButtonPressed(vc: HomeViewController)
}

extension UIView {
    
    func screenshot() -> UIImage {
        return UIGraphicsImageRenderer(size: bounds.size).image { _ in
            drawHierarchy(in: CGRect(origin: .zero, size: bounds.size), afterScreenUpdates: true)
        }
    }
    
}

class HomeViewController: UITabBarController, UITabBarControllerDelegate {

    var secondItemImageView: UIImageView!
    var homeControllerDelegate: HomeControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedIndex = 1
        delegate = self
         
        let secondItemImageView = self.tabBar.subviews[1]
        self.secondItemImageView = secondItemImageView.subviews.first as! UIImageView
        self.secondItemImageView.contentMode = .center
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 2 {
            homeControllerDelegate?.bookingButtonPressed(vc: self)
            self.secondItemImageView.transform = CGAffineTransform.identity
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: { () -> Void in
                let scale = CGAffineTransform.init(scaleX: 2, y: 2)
                self.secondItemImageView.transform = scale
            }, completion: { (completed) in
                if completed {
                    UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: { () -> Void in
                       self.secondItemImageView.transform = CGAffineTransform.identity
                    })
                    
                }
            })
        } else {
            self.secondItemImageView.transform = CGAffineTransform.identity
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if selectedViewController == nil || viewController == selectedViewController {
            return false
        }
        
        let fromView = selectedViewController!.view
        let toView = viewController.view
        
        UIView.transition(from: fromView!, to: toView!, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        
        return true
    }

}
