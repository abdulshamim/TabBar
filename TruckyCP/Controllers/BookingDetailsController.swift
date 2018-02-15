//
//  BookingDetailsController.swift
//  TruckyCP
//
//  Created by Abdul Shamim on 2/11/18.
//  Copyright © 2018 Abdul Shamim. All rights reserved.
//

import UIKit

class BookingDetailsController: UIViewController {
    
    @IBOutlet weak var firstSelectedView: UIView!
    @IBOutlet weak var secondSelectedView: UIView!
    @IBOutlet weak var thirdSelectedView: UIView!
    @IBOutlet weak var fourthSelectedView: UIView!
   
    @IBOutlet weak var imageView: UIImageView!
    
    var touchCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius  = imageView.bounds.height/2
        imageView.layer.masksToBounds = true
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.firstSelectedView.backgroundColor  = .clear
        self.secondSelectedView.backgroundColor = .clear
        self.thirdSelectedView.backgroundColor  = .clear
        self.fourthSelectedView.backgroundColor = .clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func firstButton(_ sender: UIButton) {
        print("\(sender.center.y)")
        let view = UIView()
        view.frame = CGRect(x: sender.center.x, y: sender.center.y, width: 80, height: 80)
        view.backgroundColor = .red
        view.layer.cornerRadius  = view.bounds.height/2
        view.layer.masksToBounds = true
        view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.9, animations: {
            view.center = self.firstSelectedView.center
            view.transform = CGAffineTransform.identity
            self.view.addSubview(view)
        })
    }
    
    @IBAction func buttonSecond(_ sender: UIButton) {
        let view = UIImageView()
        view.frame = imageView.frame
        view.backgroundColor = .red
        view.layer.cornerRadius  = view.bounds.height/2
        view.layer.masksToBounds = true
        view.image = imageView.screenshot()
        UIView.animate(withDuration: 0.8, animations: {
            self.touchCount += 1
            if self.touchCount == 1 {
                view.center = self.firstSelectedView.center
            } else if self.touchCount == 2 {
                view.center = self.secondSelectedView.center
            } else if self.touchCount == 3 {
                view.center = self.thirdSelectedView.center
            } else if self.touchCount == 4 {
                view.center = self.fourthSelectedView.center
            }
            
            view.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.view.addSubview(view)
        })
    }
    
    
    
}








