//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Cody Evol on 11/5/15.
//  Copyright © 2015 Cody Evol. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    
    @IBOutlet weak var trayView: UIView!
    
    var trayOriginalCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTrayPanGesture(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        
        let velocity = sender.velocityInView(view)
        
        
        
        
        if sender.state == UIGestureRecognizerState.Began {
            trayOriginalCenter = trayView.center
        }
        
        if sender.state == UIGestureRecognizerState.Changed {
            
            print("trayview.center.y: \(trayView.center.y)")
            print("trayOriginalCenter: \(trayOriginalCenter.y)")
            
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
            
        }
        
        if sender.state == UIGestureRecognizerState.Ended {
            
            print(velocity.y)
            
            if velocity.y > 0 {
              
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: [], animations: { () -> Void in
                    
                    self.trayView.center.y = 637.0

                    }, completion: { (Bool) -> Void in
                })
                
            } else {
                
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: [], animations: { () -> Void in
                    
                    self.trayView.center.y = 456.0
                    
                    }, completion: { (Bool) -> Void in
                })
            }
            
        }
        
        
    }

}
