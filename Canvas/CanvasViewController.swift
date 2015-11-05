//
//  CanvasViewController.swift
//  Canvas
//
//  Created by Cody Evol on 11/5/15.
//  Copyright © 2015 Cody Evol. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var trayView: UIView!
    
    var trayOriginalCenter: CGPoint!
    var faceOriginalCenter: CGPoint!
    var newlyCreatedFaceOrigin: CGPoint!
    var newlyCreatedFace: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        panGestureRecognizer.delegate = self;
//        scaleGestureRecognizer.delegate = self;
//        rotationGestureReconizer.delegate = self;
    }
    
//    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
//        return true
//    }
    
    
    @IBAction func facePan(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
            let imageView = sender.view as! UIImageView!
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            faceOriginalCenter = newlyCreatedFace.center
            newlyCreatedFace.userInteractionEnabled = true
            
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "OnCustomPan:")
            
            newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
            let scaleGestureRecognizer = UIPinchGestureRecognizer(target: self, action: "OnCustomPinch:")
            
            newlyCreatedFace.addGestureRecognizer(scaleGestureRecognizer)
            
            let rotationGestureReconizer = UIRotationGestureRecognizer(target: self, action: "OnCustomRotation:")
            
            newlyCreatedFace.addGestureRecognizer(rotationGestureReconizer)
        }
        
        if sender.state == UIGestureRecognizerState.Changed {
            newlyCreatedFace.center = CGPoint(x: faceOriginalCenter.x  + translation.x, y: faceOriginalCenter.y + translation.y)
        }
        
        if sender.state == UIGestureRecognizerState.Ended {
            
        }
        
    }
    
    func OnCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        let face = panGestureRecognizer.view
        let location = panGestureRecognizer.locationInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
        }
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            face!.center = location
        }
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
        }
    }
    
    func OnCustomPinch(scaleGestureRecognizer: UIPinchGestureRecognizer) {
        let scale = scaleGestureRecognizer.scale
        newlyCreatedFace.transform = CGAffineTransformMakeScale(scale, scale)
    }
    
    
    func OnCustomRotation(rotationGestureReconizer: UIRotationGestureRecognizer) {
        let rotation = rotationGestureReconizer.rotation
        newlyCreatedFace.transform = CGAffineTransformMakeRotation(rotation)
    }
    
    
    @IBAction func onTrayPanGesture(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        
        let velocity = sender.velocityInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            trayOriginalCenter = trayView.center
        }
        
        if sender.state == UIGestureRecognizerState.Changed {

            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        }
        
        if sender.state == UIGestureRecognizerState.Ended {
            
            
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
