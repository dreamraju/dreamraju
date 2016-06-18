//
//  TabBarViewController.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/18/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let detailViewController = DetailViewController()
    let detailViewControllerTwo = DetailViewControllerTwo()
    
    func setTitleString(string: String) {
        
        self.title = string
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.whiteColor()
        tabBar.barTintColor = UIColor.darkGrayColor()
        
        detailViewController.tabBarItem = UITabBarItem(title: "Item One", image: UIImage(named: "Dot"), tag: 0)
        detailViewControllerTwo.tabBarItem = UITabBarItem(title: "Item Two", image:  UIImage(named:  "Dot"), tag: 1)

        self.viewControllers = [detailViewControllerTwo, detailViewController]
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
