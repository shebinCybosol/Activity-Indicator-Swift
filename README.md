# Activity-Indicator-Swift
Activity Indicator HUD

same in objective - C   https://github.com/shebinkoshy/UIControllsRepo

How to use???

copy the file SHActivityView.swift into your project

        var viewActivitySmall : SHActivityView? 


        viewActivitySmall = SHActivityView.init()
        viewActivitySmall?.spinnerSize = .kSHSpinnerSizeSmall
        viewActivitySmall?.spinnerColor = UIColor.blueColor()
        self.viewOuter.addSubview(viewActivitySmall!)
        viewActivitySmall?.showAndStartAnimate()
        viewActivitySmall?.center =  CGPointMake((self.viewOuter?.frame.size.width)!/2, (self.viewOuter?.frame.size.height)!/2)
        
        
        
        viewActivityTiny?.dismissAndStopAnimation() // to dismiss the view
        
        
Advantages

-> Able to set colors for spinner

-> Available in different sizes like tiny, small, medium, large, very large

-> Able to set Title (center and bottom) for medium, large, very large sizes
