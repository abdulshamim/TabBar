//
//  BookingViewController.swift
//  TruckyCP
//
//  Created by Abdul Shamim on 2/12/18.
//  Copyright © 2018 Abdul Shamim. All rights reserved.
//

import UIKit

protocol BookingViewControllerDelegate {
    func bookingBackButtnPressed(vc: BookingViewController)
}

class BookingViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {

    @IBOutlet weak var firstView: iCarousel!
    @IBOutlet weak var firstSelectedView: UIView!
    
    var bookingViewControllerDelegate: BookingViewControllerDelegate?
    
    override func awakeFromNib() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstView.delegate = self
        firstView.dataSource = self
        firstView.type = .linear
        firstView.scrollToItem(at: 1, animated: true)
       // firstView.isScrollEnabled = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        bookingViewControllerDelegate?.bookingBackButtnPressed(vc: self)
    }
    

    func numberOfItems(in carousel: iCarousel) -> Int {
        return 3
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 110, height: 110))
        view.backgroundColor = .red
        view.layer.cornerRadius = 55
        view.layer.masksToBounds = true
        
        let button = UIButton()
        button.frame = view.frame
        button.center = view.center
        button.setTitle("\(index)", for: .normal)
        button.tag = index
        button.addTarget(self, action: #selector(BookingViewController.buttonSelected), for: .touchUpInside)
        view.addSubview(button)
        return view
    }
    
    @objc func buttonSelected(sender: UIButton) {
       print("\(sender.tag)")
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing {
            return value * 1.5
        }
        return value
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: firstView)
        print("\(location)")
        let animateView = UIView()
        animateView.frame = CGRect(origin: location!, size: firstSelectedView.bounds.size)
        animateView.backgroundColor = .red
        animateView.layer.cornerRadius = animateView.bounds.height/2
        animateView.layer.masksToBounds = true
        animateView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
         UIView.animate(withDuration: 0.7, animations: {
            animateView.center = self.firstSelectedView.center
            //self.firstSelectedView.center = location!
            self.firstSelectedView.addSubview(animateView)
            animateView.transform = CGAffineTransform.identity
         })
    }
}









