//
//  MyBookingsController.swift
//  TruckyCP
//
//  Created by Abdul Shamim on 2/11/18.
//  Copyright © 2018 Abdul Shamim. All rights reserved.
//

import UIKit


class MyBookingsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
  
    @IBAction func moveToBookingDetails(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "BookingDetailsController") as? BookingDetailsController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
