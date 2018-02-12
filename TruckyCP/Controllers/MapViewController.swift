//
//  MapViewController.swift
//  TruckyCP
//
//  Created by Abdul Shamim on 2/11/18.
//  Copyright © 2018 Abdul Shamim. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, HomeControllerDelegate, BookingViewControllerDelegate {

    @IBOutlet weak var containerView: UIView!
    
    //let homeVc = HomeViewController()
    let bookingVC = BookingViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // homeVc.homeControllerDelegate = self
        bookingVC.bookingViewControllerDelegate = self
    }

    func bookingButtonPressed(vc: HomeViewController) {
        self.containerView.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func bookingBackButtnPressed(vc: BookingViewController){
        self.containerView.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
}
