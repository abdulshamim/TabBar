//
//  HomeViewController.swift
//  TruckyCP
//
//  Created by Abdul Shamim on 2/9/18.
//  Copyright © 2018 Abdul Shamim. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController, UITabBarControllerDelegate {

    var secondItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //selectedIndex = 1
        delegate = self
         
        let secondItemImageView = self.tabBar.subviews[1]
        self.secondItemImageView = secondItemImageView.subviews.first as! UIImageView
        self.secondItemImageView.contentMode = .center
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 2 {
            self.secondItemImageView.transform = CGAffineTransform.identity
           // UIView.animateKeyframes(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, options: <#T##UIViewKeyframeAnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
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
