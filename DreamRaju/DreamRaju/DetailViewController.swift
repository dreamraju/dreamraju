//
//  DetailViewController.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/17/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var graphViewOne : UIView!
    var graphViewTwo : UIView!
    var graphViewThree : UIView!
    var graphViewFour : UIView!
    var graphViewFive : UIView!
    
    var dramaLabel : UILabel!
    var adultLabel : UILabel!
    var comedyLabel : UILabel!
    var musicLabel : UILabel!
    var violenceLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        
    }
    
    func setUpViews() {
        
        let barWidth = self.view.frame.size.width / 11
        
        //labels
        
        let labelFrameOne = CGRectMake(barWidth, self.view.frame.size.height / 2 + 200, barWidth, 50)
        let labelFrameTwo = CGRectMake(barWidth * 3, self.view.frame.size.height / 2 + 200, barWidth, 50)
        let labelFrameThree = CGRectMake(barWidth * 5, self.view.frame.size.height / 2 + 200, barWidth, 50)
        let labelFrameFour = CGRectMake(barWidth * 7, self.view.frame.size.height / 2 + 200, barWidth, 50)
        let labelFrameFive = CGRectMake(barWidth * 9, self.view.frame.size.height / 2 + 200, barWidth, 50)
        
        let labelColor = UIColor.whiteColor()
        let labelBG = UIColor.clearColor()
        let alignment = NSTextAlignment.Center
        let labelFont = UIFont(name: "Chalkduster", size: 9.0)

        dramaLabel = UILabel(frame: labelFrameOne)
        dramaLabel.textAlignment = alignment
        dramaLabel.font = labelFont
        dramaLabel.text = "Drama"
        dramaLabel.textColor = labelColor
        dramaLabel.backgroundColor = labelBG
        
        adultLabel = UILabel(frame: labelFrameTwo)
        adultLabel.textAlignment = alignment
        adultLabel.font = labelFont
        adultLabel.text = "Adult"
        adultLabel.textColor = labelColor
        adultLabel.backgroundColor = labelBG
        
        comedyLabel = UILabel(frame: labelFrameThree)
        comedyLabel.textAlignment = alignment
        comedyLabel.font = labelFont
        comedyLabel.text = "Comedy"
        comedyLabel.textColor = labelColor
        comedyLabel.backgroundColor = labelBG
        
        musicLabel = UILabel(frame: labelFrameFour)
        musicLabel.textAlignment = alignment
        musicLabel.font = labelFont
        musicLabel.text = "Music"
        musicLabel.textColor = labelColor
        musicLabel.backgroundColor = labelBG
        
        violenceLabel = UILabel(frame: labelFrameFive)
        violenceLabel.textAlignment = alignment
        violenceLabel.font = labelFont
        violenceLabel.text = "Violence"
        violenceLabel.textColor = labelColor
        violenceLabel.backgroundColor = labelBG
        
        view.addSubview(dramaLabel)
        view.addSubview(adultLabel)
        view.addSubview(comedyLabel)
        view.addSubview(musicLabel)
        view.addSubview(violenceLabel)
        
        //graph view
        
        let frameOne = CGRectMake(barWidth, self.view.frame.size.height / 2 + 100, barWidth, 0)
        let frameTwo = CGRectMake(barWidth * 3, self.view.frame.size.height / 2 + 100, barWidth, 0)
        let frameThree = CGRectMake(barWidth * 5, self.view.frame.size.height / 2 + 100, barWidth, 0)
        let frameFour = CGRectMake(barWidth * 7, self.view.frame.size.height / 2 + 100, barWidth, 0)
        let frameFive = CGRectMake(barWidth * 9, self.view.frame.size.height / 2 + 100, barWidth, 0)
        
        graphViewOne = UIView(frame: frameOne)
        graphViewOne.backgroundColor = UIColor.yellowColor()
        graphViewOne.layer.cornerRadius = 10
        graphViewOne.layer.masksToBounds = true
        view.addSubview(graphViewOne)
        
        graphViewTwo = UIView(frame: frameTwo)
        graphViewTwo.backgroundColor = UIColor.redColor()
        graphViewTwo.layer.cornerRadius = 10
        graphViewTwo.layer.masksToBounds = true
        view.addSubview(graphViewTwo)
        
        graphViewThree = UIView(frame: frameThree)
        graphViewThree.backgroundColor = UIColor.blueColor()
        graphViewThree.layer.cornerRadius = 10
        graphViewThree.layer.masksToBounds = true
        view.addSubview(graphViewThree)
        
        graphViewFour = UIView(frame: frameFour)
        graphViewFour.backgroundColor = UIColor.greenColor()
        graphViewFour.layer.cornerRadius = 10
        graphViewFour.layer.masksToBounds = true
        view.addSubview(graphViewFour)
        
        graphViewFive = UIView(frame: frameFive)
        graphViewFive.backgroundColor = UIColor.purpleColor()
        graphViewFive.layer.cornerRadius = 10
        graphViewFive.layer.masksToBounds = true
        view.addSubview(graphViewFive)
        
        //animate 'em
        
        animateViews()
    }
    
    func animateViews() {
        
        UIView.animateWithDuration(1) { 
            
            let barWidth = self.view.frame.size.width / 11
            let animationDistance : CGFloat = -10.0
            
            let frameOne = CGRectMake(barWidth, self.view.frame.size.height / 2 + 100, barWidth, animationDistance * 2.0)
            let frameTwo = CGRectMake(barWidth * 3, self.view.frame.size.height / 2 + 100, barWidth, animationDistance * 4.5)
            let frameThree = CGRectMake(barWidth * 5, self.view.frame.size.height / 2 + 100, barWidth, animationDistance * 14)
            let frameFour = CGRectMake(barWidth * 7, self.view.frame.size.height / 2 + 100, barWidth, animationDistance * 1.5)
            let frameFive = CGRectMake(barWidth * 9, self.view.frame.size.height / 2 + 100, barWidth, animationDistance * 9)
            
            self.graphViewOne.frame = frameOne
            self.graphViewTwo.frame = frameTwo
            self.graphViewThree.frame = frameThree
            self.graphViewFour.frame = frameFour
            self.graphViewFive.frame = frameFive
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
