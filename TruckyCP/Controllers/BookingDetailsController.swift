//
//  BookingDetailsController.swift
//  TruckyCP
//
//  Created by Abdul Shamim on 2/11/18.
//  Copyright © 2018 Abdul Shamim. All rights reserved.
//

import UIKit

class BookingDetailsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
