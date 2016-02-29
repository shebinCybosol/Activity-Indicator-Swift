//
//  SHActivityView.swift
//  ActivityIndicatorSwift
//
//  Created by $heb!n Koshy on 2/25/16.
//  Copyright © 2016 $heb!n Koshy. All rights reserved.
//

import UIKit

let pi = 3.14159265359
let dotEnteringDelay = 0.6



/**
* a view that contain spinner on its center
* use only programmatically
* default background color = UIColor(white: 0.2, alpha: 0.5), it wil not work when spinnerStyle = kSHSpinnerSizeSmall || kSHSpinnerSizeTiny
* if you need to CHANGE the POSITION of the spinner you have to change it only after, func showAndStartAnimate() invoked
*/

class SHActivityView: UIView {
    
    
    enum SpinnerSize : Int
    {
        case kSHSpinnerSizeTiny // suitable for frmae size (30, 30)
        case kSHSpinnerSizeSmall // suitable for frame size (50, 50)
        case kSHSpinnerSizeMedium // suitable for frame size (150, 150)
        case kSHSpinnerSizeLarge // suitable for frame size (185, 185)
        case kSHSpinnerSizeVeryLarge // suitable for frame size (220,220)
    }
    
    
    
    
    /**
     * radius of the spinner/rotator will be different in each Spinner Size
     * default = kAVSpinnerSizeTiny
     * if its kSHSpinnerSizeVeryLarge or kSHSpinnerSizeLarge, kSHSpinnerSizeMedium, can able to set two title, one title in center of spinner and another in below the spinner
     */
    var spinnerSize : SpinnerSize?
    
    
    
    
    
    
    /**
     * spinner color
     * defaule = UIColor.whiteColor()
     */
    var spinnerColor : UIColor?
    
    
    
    
    
    
    
    /**
     * disable the user interaction of entire application
     * default = false
     */
    var disableEntireUserInteraction : Bool?
        {
        
        didSet
        {
            if(disableEntireUserInteraction == true)
            {
                UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            }
        }
    }
    
    
    
    
    
    
    
    /**
     * center title
     * default = nil
     * WARNING, it wil not work when spinnerSize = kSHSpinnerSizeSmall || kSHSpinnerSizeTiny
     */
    var centerTitle : String?
    
    
    
    
    
    
    
    
    /**
     * bottom title
     * default = nil
     * WARNING, it wil not work when spinnerSize = kSHSpinnerSizeSmall || kSHSpinnerSizeTiny
     */
    var bottomTitle : String?
    
    
    
    
    
    /**
     * center title color
     * default = UIColor.whiteColor()
     * WARNING, it wil not work when spinnerSize = kSHSpinnerSizeSmall || kSHSpinnerSizeTiny
     */
    var centerTitleColor : UIColor?
    
    
    
    
    
    
    /**
     * bottom title color
     * default = UIColor.whiteColor()
     * WARNING, it wil not work when spinnerSize = kSHSpinnerSizeSmall || kSHSpinnerSizeTiny
     */
    var bottomTitleColor : UIColor?
    
    
    
    
    
    
    
    /**
     * center title font
     * WARNING, it wil not work when spinnerSize = kSHSpinnerSizeSmall || kSHSpinnerSizeTiny
     */
    var centerTitleFont : UIFont?
    
    
    
    
    
    
    
    /**
     * bottom title font
     * WARNING, it wil not work when spinnerSize = kSHSpinnerSizeSmall || kSHSpinnerSizeTiny
     */
    var bottomTitleFont : UIFont?
    
    
    
    
    
    
    
    /**
     * stop the three dot animation
     * WARNING, it wil not work when spinnerSize = kSHSpinnerSizeSmall || kSHSpinnerSizeTiny
     */
    var stopBottomTitleDotAnimation : Bool?
    
    
    
    
    
    
    /**
     * stop animation when showing and dismissing the spinner
     */
    var stopShowingAndDismissingAnimation : Bool?
        
    
    
    
    private var viewActivitySquare : UIView?
    private var viewNotRotate : UIView?
    private var isAnimating : Bool?

    private func DEGREES_TO_RADIANS(degrees : Double) -> CGFloat
    {
        return CGFloat(((pi*degrees) / 180))
    }
    
    func showAndStartAnimate()
    {
        if (isAnimating == true)
        {
            print("WARNING already animation started")
            return;
        }
        else
        {
            isAnimating = true
        }
        self.alpha = 0.0;
        if (self.backgroundColor == nil && spinnerSize != .kSHSpinnerSizeTiny && spinnerSize != .kSHSpinnerSizeSmall)
        {
            self.backgroundColor = UIColor(white: 0.2, alpha: 0.5)
        }
        else
        {
            if ( self.backgroundColor?.isEqual(UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) == true || self.backgroundColor?.isEqual(UIColor.whiteColor()) == true )
            {
                print("WARNING background color is white, so you cannot see the spinner")
            }
        }
        
        if(disableEntireUserInteraction == true)
        {
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        }
        viewNotRotate = self
        viewActivitySquare = UIView.init()
        var frameViewActivitySquare : CGRect?
        if (spinnerSize == .kSHSpinnerSizeTiny)
        {
            frameViewActivitySquare = CGRectMake(0, 0, 30, 30)
            self.frame = frameViewActivitySquare!
        }
        else if (spinnerSize == .kSHSpinnerSizeSmall)
        {
            frameViewActivitySquare = CGRectMake(0, 0, 50, 50)
            self.frame = frameViewActivitySquare!
        }
        else if (spinnerSize == .kSHSpinnerSizeMedium || spinnerSize == .kSHSpinnerSizeLarge || spinnerSize == .kSHSpinnerSizeVeryLarge)
        {
            var labelCenter : UILabel?
            var labelBottom : UILabel?
            if (spinnerSize == .kSHSpinnerSizeMedium)
            {
                frameViewActivitySquare = CGRectMake(0, 0, 82, 82)
                viewNotRotate?.frame = CGRectMake(0, 0, 150, 150)
            }
            else if (spinnerSize == .kSHSpinnerSizeLarge)
            {
                frameViewActivitySquare = CGRectMake(0, 0, 120, 120)
                viewNotRotate?.frame = CGRectMake(0, 0, 185, 185)
            }
            else if (spinnerSize == .kSHSpinnerSizeVeryLarge)
            {
                frameViewActivitySquare = CGRectMake(0, 0, 150, 150)
                viewNotRotate?.frame = CGRectMake(0, 0, 220, 220)
            }
            if (centerTitle != nil)
            {
                labelCenter = UILabel(frame:CGRectMake((viewNotRotate?.frame.size.width)!/4, ((viewNotRotate?.frame.size.height)!/2)-15,(viewNotRotate?.frame.size.width)!-(2*((viewNotRotate?.frame.size.width)!/4)),30))
                if (centerTitleFont != nil)
                {
                    labelCenter?.font = centerTitleFont
                }
                labelCenter?.text = centerTitle
                if (centerTitleColor != nil)
                {
                    labelCenter?.textColor = centerTitleColor
                }
                else
                {
                    labelCenter?.textColor = UIColor.whiteColor()
                }
                labelCenter?.textAlignment = .Center
                labelCenter?.backgroundColor = UIColor.clearColor()
                labelCenter?.adjustsFontSizeToFitWidth = true
                viewNotRotate?.addSubview(labelCenter!)
            }
            
            if (bottomTitle != nil)
            {
                var widthLabelDot = 0.0
                if (stopBottomTitleDotAnimation == nil || stopBottomTitleDotAnimation == false)
                {
                    widthLabelDot = 20
                }
                labelBottom = UILabel.init()
                if (bottomTitleFont != nil)
                {
                    labelBottom?.font = bottomTitleFont
                }
                labelBottom?.backgroundColor = UIColor.clearColor()
                labelBottom?.text = bottomTitle
                labelBottom?.adjustsFontSizeToFitWidth = true
                let sizeWithFont = bottomTitle!.sizeWithAttributes([NSFontAttributeName: UIFont.systemFontOfSize(UIFont.systemFontSize())])
                if (sizeWithFont.width < viewNotRotate?.frame.size.width)
                {
                    let width = CGFloat((viewNotRotate?.frame.size.width)! - sizeWithFont.width)
                    labelBottom?.frame = CGRectMake((width/2)-((CGFloat(widthLabelDot))/2), (viewNotRotate?.frame.size.height)! - 35, sizeWithFont.width, 30)
                }
                else
                {
                    if (stopBottomTitleDotAnimation == nil || stopBottomTitleDotAnimation == false)
                    {
                        print("WARNING bottom title is too lengthy so Dot animation not possible");
                        stopBottomTitleDotAnimation = true
                    }
                    labelBottom?.frame = CGRectMake(0, (viewNotRotate?.frame.size.height)! - 35, (viewNotRotate?.frame.size.width)!, 30)
                    labelBottom?.textAlignment = .Center
                }
                if (bottomTitleColor != nil)
                {
                    labelBottom?.textColor = bottomTitleColor
                }
                else
                {
                    labelBottom?.textColor = UIColor.whiteColor()
                }
                viewNotRotate?.addSubview(labelBottom!)
                
                if(stopBottomTitleDotAnimation == nil || stopBottomTitleDotAnimation == false)
                {
                    let labelDot = UILabel(frame:CGRectMake(labelBottom!.frame.origin.x + labelBottom!.frame.size.width + 1, labelBottom!.frame.origin.y, CGFloat(widthLabelDot),labelBottom!.frame.size.height))
                    if (bottomTitleFont != nil)
                    {
                        labelDot.font = bottomTitleFont
                    }
                    labelDot.backgroundColor = UIColor.clearColor()
                    labelDot.adjustsFontSizeToFitWidth = true
                    if(bottomTitleColor != nil)
                    {
                        labelDot.textColor = bottomTitleColor
                    }
                    else
                    {
                        labelDot.textColor = UIColor.whiteColor()
                    }
                    viewNotRotate?.addSubview(labelDot)
                    self.performSelector(Selector("firstDot:"), withObject: labelDot, afterDelay: dotEnteringDelay)
                    
                }
            }
        }
        viewActivitySquare?.frame = frameViewActivitySquare!
        self.addSubview(viewActivitySquare!)
        
        let lowerPath = UIBezierPath(arcCenter: (viewActivitySquare?.center)!, radius: (viewActivitySquare?.frame.size.width)!/2.2, startAngle: DEGREES_TO_RADIANS(-5), endAngle: DEGREES_TO_RADIANS(200), clockwise: true)
        let lowerShape = self.createShapeLayer(lowerPath)
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = CGRectMake(0, 0, (viewActivitySquare?.frame.size.width)!, (viewActivitySquare?.frame.size.height)!)
        var colorSpinner = spinnerColor
        
        if (colorSpinner == nil)
        {
            colorSpinner = UIColor.whiteColor()
        }
        gradientLayer.colors = NSArray(objects: (colorSpinner?.CGColor)!,UIColor.whiteColor().colorWithAlphaComponent(0.0).CGColor,UIColor.whiteColor().colorWithAlphaComponent(0.0).CGColor,UIColor.clearColor().CGColor) as! [CGColorRef]
        gradientLayer.startPoint = CGPointMake(0.5, 0.8)
        gradientLayer.endPoint = CGPointMake(2.0, 0.5)
        gradientLayer.mask = lowerShape
        viewActivitySquare?.layer.addSublayer(gradientLayer)
        
        let upperPath = UIBezierPath(arcCenter: (viewActivitySquare?.center)!, radius: (viewActivitySquare?.frame.size.width)!/2.2, startAngle: DEGREES_TO_RADIANS(200), endAngle: DEGREES_TO_RADIANS(300), clockwise: true)
        let upperShape = self.createShapeLayer(upperPath)
        if (spinnerColor != nil)
        {
            upperShape.strokeColor = spinnerColor?.CGColor
        }
        else
        {
            upperShape.strokeColor = UIColor.whiteColor().CGColor
        }
        viewActivitySquare?.layer.addSublayer(upperShape)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("rotationAnimation"), name: UIApplicationWillEnterForegroundNotification, object: nil)
        self.rotationAnimation()
        viewActivitySquare?.center = CGPointMake((viewNotRotate?.frame.size.width)!/2, (viewNotRotate?.frame.size.height)!/2)
        
        UIView.animateWithDuration((stopShowingAndDismissingAnimation == true) ? 0.0 : 0.5) { () -> Void in
            self.alpha = 1.0
        }
        
    }
    
    private func createShapeLayer(path : UIBezierPath) -> CAShapeLayer
    {
        let shape = CAShapeLayer.init()
        shape.path = path.CGPath
        if (spinnerSize == .kSHSpinnerSizeSmall)
        {
            shape.lineWidth = 4.0
        }
        else if (spinnerSize == .kSHSpinnerSizeMedium)
        {
            shape.lineWidth = 8.0
        }
        else if (spinnerSize == .kSHSpinnerSizeLarge)
        {
            shape.lineWidth = 10.0
        }
        else if (spinnerSize == .kSHSpinnerSizeVeryLarge)
        {
            shape.lineWidth = 12.0
        }
        shape.lineCap = kCALineCapRound
        shape.fillColor = UIColor.clearColor().CGColor
        shape.strokeColor = UIColor(white: 1.0, alpha: 1.0).CGColor
        return shape
    }

    
    @objc private func rotationAnimation()
    {
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = NSNumber(float: 0.0)
        rotate.toValue = NSNumber(float: 6.2)
        rotate.repeatCount = Float(CGFloat.max)        
        rotate.duration = 1.5
        viewActivitySquare?.layer .addAnimation(rotate, forKey: "rotateRepeatedly")
        
    }
    
    @objc private func firstDot(label:UILabel)
    {
        label.text = "."
        self.performSelector(Selector("secondDot:"), withObject: label, afterDelay: dotEnteringDelay)
    }
    
    @objc private func secondDot(label:UILabel)
    {
        label.text = ".."
        self.performSelector(Selector("thirdDot:"), withObject: label, afterDelay: dotEnteringDelay)
    }
    
    @objc private func thirdDot(label:UILabel)
    {
        label.text = "..."
        self.performSelector(Selector("removeAllDots:"), withObject: label, afterDelay : dotEnteringDelay)
    }
    
    @objc private func removeAllDots(label:UILabel)
    {
        label.text = ""
        self.performSelector(Selector("firstDot:"), withObject: label, afterDelay: dotEnteringDelay)
    }
    
    func dismissAndStopAnimation()
    {
        UIView.animateWithDuration((stopShowingAndDismissingAnimation == true) ? 0.0 : 0.5, animations: { () -> Void in
            self.alpha = 0.0
        }) { (finished) -> Void in
            if (finished == true)
            {
                self.isAnimating = false
                for view : UIView in self.subviews
                {
                    view.removeFromSuperview()
                }
                
                if (self.disableEntireUserInteraction == true)
                {
                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
                }
                NSNotificationCenter.defaultCenter().removeObserver(self, name: UIApplicationWillEnterForegroundNotification, object: nil)
                
            }
        }
    }

}
