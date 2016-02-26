//
//  HomeViewController.swift
//  ActivityIndicatorSwift
//
//  Created by $heb!n Koshy on 2/25/16.
//  Copyright © 2016 $heb!n Koshy. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    var viewActivityTiny : SHActivityView?
    var viewActivitySmall : SHActivityView?
    var viewActivityMedium : SHActivityView?
    var viewActivityLarge : SHActivityView?
    var viewActivityVeryLarge : SHActivityView?
    
    @IBOutlet weak var viewOuter: UIView!
    @IBOutlet weak var viewSample: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewActivitySmall = SHActivityView.init()
        viewActivitySmall?.spinnerSize = .kSHSpinnerSizeSmall
        viewActivitySmall?.spinnerColor = UIColor.blueColor()
        self.viewOuter.addSubview(viewActivitySmall!)
        viewActivitySmall?.showAndStartAnimate()
        
        
        
        
        viewActivityMedium = SHActivityView.init()
        viewActivityMedium?.layer.cornerRadius = 10.0
        viewActivityMedium?.centerTitle = "75 %"
        viewActivityMedium?.bottomTitle = "Loading"
        viewActivityMedium?.spinnerSize = .kSHSpinnerSizeMedium
        self.viewOuter.addSubview(viewActivityMedium!)
        viewActivityMedium?.showAndStartAnimate()
        viewActivityMedium?.frame = CGRectMake((viewActivitySmall?.frame.origin.x)! + (viewActivitySmall?.frame.size.width)! + 20, 20, (viewActivityMedium?.frame.size.width)!, (viewActivityMedium?.frame.size.height)!)
        
        
        
        
        viewActivityLarge = SHActivityView.init()
        viewActivityLarge?.backgroundColor = UIColor.brownColor()
        viewActivityLarge?.spinnerSize = .kSHSpinnerSizeLarge
        viewActivityLarge?.centerTitle = "100 %"
        viewActivityLarge?.bottomTitle = "Loading"
        viewActivityLarge?.centerTitleColor = UIColor.greenColor()
        viewActivityLarge?.bottomTitleColor = UIColor.blackColor()
        viewActivityLarge?.centerTitleFont = UIFont(name: "Didot-Italic", size: 19)
        viewActivityLarge?.bottomTitleFont = UIFont(name: "Georgia-Bold", size: 22)
        viewActivityLarge?.stopBottomTitleDotAnimation = true
        viewActivityLarge?.stopShowingAndDismissingAnimation = true
        self.viewOuter.addSubview(viewActivityLarge!)
        viewActivityLarge?.showAndStartAnimate()
        viewActivityLarge?.frame = CGRectMake((viewActivityMedium?.frame.origin.x)!, (viewActivityMedium?.frame.origin.y)! + (viewActivityMedium?.frame.size.height)!, (viewActivityLarge?.frame.size.width)!, (viewActivityLarge?.frame.size.height)!)
        
        
        
        
        /**

        USUALLY USED FOR iPads

        viewActivityVeryLarge = SHActivityView.init()
        viewActivityVeryLarge?.stopShowingAndDismissingAnimation = false
        viewActivityVeryLarge?.spinnerSize = .kSHSpinnerSizeVeryLarge
        viewActivityVeryLarge?.centerTitle = "100 %"
        viewActivityVeryLarge?.bottomTitle = "Please wait"
        viewActivityVeryLarge?.layer.cornerRadius = 10.0
        viewActivityVeryLarge?.showAndStartAnimate()
        self.viewOuter.addSubview(viewActivityVeryLarge!)
        viewActivityVeryLarge?.frame = CGRectMake(350, 150, (viewActivityVeryLarge?.frame.size.width)!, (viewActivityVeryLarge?.frame.size.height)!)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        viewActivityTiny = SHActivityView.init()
        viewActivityTiny?.spinnerColor = UIColor.blackColor()
        viewActivityTiny!.spinnerSize = .kSHSpinnerSizeTiny
        self.viewSample.addSubview(viewActivityTiny!)
        viewActivityTiny!.showAndStartAnimate()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("deviceRotated"), name: UIApplicationDidChangeStatusBarOrientationNotification, object: nil)
        self.makeSpinnerTinyOnCenter()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIApplicationDidChangeStatusBarOrientationNotification, object: nil)
    }
    
    func makeSpinnerTinyOnCenter()
    {
        viewActivityTiny?.center = CGPointMake(self.viewSample.frame.size.width/2, self.viewSample.frame.size.height/2)
    }
    
    func deviceRotated()
    {
        self.performSelector(Selector("makeSpinnerTinyOnCenter"), withObject: nil, afterDelay: 0.1)
    }

    
    @IBAction func buttonStartAction(sender: AnyObject)
    {
        viewActivityTiny?.showAndStartAnimate()
        self.makeSpinnerTinyOnCenter()
        
        viewActivitySmall?.showAndStartAnimate()
        
        viewActivityMedium?.showAndStartAnimate()
        viewActivityMedium?.frame = CGRectMake((viewActivitySmall?.frame.origin.x)! + (viewActivitySmall?.frame.size.width)! + 20, 20, (viewActivityMedium?.frame.size.width)!, (viewActivityMedium?.frame.size.height)!)
        
        viewActivityLarge?.showAndStartAnimate()
        viewActivityLarge?.frame = CGRectMake((viewActivityMedium?.frame.origin.x)!, (viewActivityMedium?.frame.origin.y)! + (viewActivityMedium?.frame.size.height)!, (viewActivityLarge?.frame.size.width)!, (viewActivityLarge?.frame.size.height)!)
        
        viewActivityVeryLarge?.showAndStartAnimate()
        viewActivityVeryLarge?.frame = CGRectMake(350, 150, (viewActivityVeryLarge?.frame.size.width)!, (viewActivityVeryLarge?.frame.size.height)!)
        
    }

    @IBAction func buttonStopAction(sender: AnyObject)
    {
        viewActivityTiny?.dismissAndStopAnimation()
        viewActivitySmall?.dismissAndStopAnimation()
        viewActivityMedium?.dismissAndStopAnimation()
        viewActivityLarge?.dismissAndStopAnimation()
        viewActivityVeryLarge?.dismissAndStopAnimation()
    }
}
