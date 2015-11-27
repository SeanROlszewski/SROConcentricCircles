//
//  ViewController.swift
//  ConcentricCircles
//
//  Created by Sean Olszewski on 11/26/15.
//  Copyright © 2015 Sean Olszewski. All rights reserved.
//

import UIKit

let shortAnimationDuration = 0.2

class ViewController: UIViewController {
    
    var button:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.center = view.center
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.addTarget(self, action: Selector("buttonWasPressed"), forControlEvents: .TouchUpInside)
        button.addTarget(self, action: Selector("shrinkButton"), forControlEvents: .TouchDown)

        self.view.addSubview(button)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func buttonWasPressed () {
        
        UIView.animateWithDuration(shortAnimationDuration, animations: { () -> Void in
            
            let scaleTransform = CGAffineTransformMakeScale(1.0, 1.0)
            self.button.transform = scaleTransform
            
        }, completion: { (completed) -> Void in
            
            self.drawCircleInView(self.view, frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        })
    }
    
    func shrinkButton() {
        
        UIView.animateWithDuration(shortAnimationDuration, animations: { () -> Void in
            
            let scaleTransform = CGAffineTransformMakeScale(0.5, 0.5)
            self.button.layer.cornerRadius = self.button.frame.height / 2
            self.button.transform = scaleTransform
        
        })
    }
    
    func drawCircleInView(view:UIView, frame:CGRect) {
        
        let circle:UIView = UIView(frame: frame)
        circle.center = view.center
        circle.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
        circle.layer.borderWidth = 1
        circle.layer.cornerRadius = circle.frame.height / 2
        circle.layer.borderColor = UIColor.redColor().CGColor
        view.insertSubview(circle, belowSubview: self.button)
        
        UIView.animateWithDuration(3, animations: { () -> Void in
            
                let scaleTransform = CGAffineTransformMakeScale(8.0, 8.0)
                circle.transform = scaleTransform
                circle.layer.cornerRadius = circle.bounds.size.height / 2
                circle.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.0)

            }, completion:  { (completed) -> Void in
                
                UIView.animateWithDuration(3, animations: { () -> Void in
                    
                    circle.layer.borderColor = UIColor.clearColor().CGColor
                    
                }, completion: { (completed) -> Void in
                        
                    circle.removeFromSuperview()
                        
                })
        })
    }
}
