//
//  CardViewVC.swift
//  TrumpCards
//
//  Created by Mike Sabens on 11/16/16.
//  Copyright © 2016 TheNewThirty. All rights reserved.
//

import UIKit

class CardViewVC: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    
    var cardsArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.layer.cornerRadius = 10
        popupView.layer.masksToBounds = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        
        //create images and add them to the empty array we created above using a for loop. x in 0...2 means it will create 3 images icon0.png, icon1.png, and icon2.png and then append them into the array.
        for x in 0...5 {
            let image = UIImage(named: "card\(x).png")
            let imageView = (UIImageView(image: image))
            cardsArray.append(imageView)
            
            
            
            //logic for placing the icons in the scroll view
            
            var newX: CGFloat = 0.0
            
            
            newX = scroll.frame.size.width / 2 + scroll.frame.size.width * CGFloat(x)
            
            contentWidth += newX
            
            scroll.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 175, y: (scroll.frame.size.height / 2) - 250, width: 350, height: 500)
            
            
        }
        
        //show more than one image on the screen at a time
        scroll.clipsToBounds = false
        
        //this is where we're going to make the scrollview actually scroll
        scroll.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
    }
    
    @IBOutlet weak var centerViewContstraint: NSLayoutConstraint!
    
    @IBAction func seriouslyButtonPressed(_ sender: AnyObject) {
        centerViewContstraint.constant = 0
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundButton.alpha = 0.85
            
        })
        
    }
    
    @IBAction func gotitButtonPressed(_ sender: AnyObject) {
        centerViewContstraint.constant = -350
        
        UIView.animate(withDuration: 0.1, animations: {
            
            self.view.layoutIfNeeded()
            self.backgroundButton.alpha = 0
            
        })
        
        
    }
    
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var backgroundButton: UIButton!
    

}

