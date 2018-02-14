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
    @IBOutlet weak var fifhtSelectedView: UIView!
    
    
    var touchCount = 0
    
    var firstPoint = CGPoint()
    var secondPoint = CGPoint()
    var thirdPoint = CGPoint()
    var fourthPoint = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
        self.firstPoint  = self.firstSelectedView.center
        self.secondPoint = self.secondSelectedView.center
        self.thirdPoint  = self.thirdSelectedView.center
        self.fourthPoint = self.fourthSelectedView.center
        
        self.firstSelectedView.center  = self.fifhtSelectedView.center
        self.secondSelectedView.center = self.fifhtSelectedView.center
        self.thirdSelectedView.center  = self.fifhtSelectedView.center
        self.fourthSelectedView.center = self.fifhtSelectedView.center
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func makeRound(of view: UIView) {
        view.layer.cornerRadius  = self.firstSelectedView.bounds.height/2
        view.layer.masksToBounds = true
        view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
    }
    
    private func initialTransform() {
        if self.touchCount == 1 {
            self.firstSelectedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        } else if self.touchCount == 2 {
            self.secondSelectedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        } else if self.touchCount == 3 {
            self.thirdSelectedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        } else if self.touchCount == 4 {
            self.fourthSelectedView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchCount += 1
        self.initialTransform()
        UIView.animate(withDuration: 0.9, animations: {
            if self.touchCount == 1 {
                self.makeRound(of: self.firstSelectedView)
                self.firstSelectedView.center = self.firstPoint
            } else if self.touchCount == 2 {
                self.makeRound(of: self.secondSelectedView)
                self.secondSelectedView.center = self.secondPoint
            } else if self.touchCount == 3 {
                self.makeRound(of: self.thirdSelectedView)
                self.thirdSelectedView.center = self.thirdPoint
            } else if self.touchCount == 4 {
                self.makeRound(of: self.fourthSelectedView)
                self.fourthSelectedView.center = self.fourthPoint
            }
        })
    }
    
}
