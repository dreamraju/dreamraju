//
//  ViewController.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/17/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView : UITableView!
    
    var selectedIndexPath: NSIndexPath? = nil
    
    var currentLocation : CLLocationCoordinate2D?
    
    override func viewWillAppear(animated: Bool) {
        
        LocationFunctions.sharedLocation.locationWithComplete { (currentLocation) in
            
            print(currentLocation)
            self.currentLocation = currentLocation
        }
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        tableView.reloadData()
        
        selectedIndexPath = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LanguageController.sharedInstance.fetchLanguages()
        
        setUpTableView()
    }
    
    func setUpTableView() {
        
        let tvFrame = CGRectMake(0, -20, view.frame.size.width, view.frame.size.height + 20)
        
        tableView = UITableView(frame: tvFrame, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.registerClass(LanguageTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    //DS
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return LanguageController.sharedInstance.languageArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let language = LanguageController.sharedInstance.languageArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! LanguageTableViewCell
        
        cell.characterImageView.image = UIImage(named: language.characterImageString!)
        cell.backgroundColor = colorWithHexString(language.hexColor!)
        
        return cell
    }
    
    //DEL
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch selectedIndexPath {
        case nil:
            selectedIndexPath = indexPath
        default:
            if selectedIndexPath! == indexPath {
                selectedIndexPath = nil
            } else {
                selectedIndexPath = indexPath
            }
        }
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: true)
        
        self.performSelector(#selector(ViewController.callPushWithLanguage), withObject: nil, afterDelay: 1)
    }
    
    func callPushWithLanguage() {
        
        let indexPath = selectedIndexPath
        
        let language = LanguageController.sharedInstance.languageArray[indexPath!.row]
        
        self.pushWithLanguage(language)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let cellHeightStart = view.frame.size.height / 5
        
        let smallHeight: CGFloat = cellHeightStart
        let expandedHeight: CGFloat = self.view.frame.size.height
        
        let ip = indexPath
        if selectedIndexPath != nil {
            
            if ip == selectedIndexPath! {
                return expandedHeight
            } else {
                return smallHeight
            }
        } else {
            return smallHeight
        }
    }
    
    //convert hex string to color (perhaps move to separate class)
    
    func colorWithHexString(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        
        //hex string to int
        let hexint = Int(self.intFromHexString(hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        

        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        
        var hexInt: UInt32 = 0
        
        //scanner
        let scanner: NSScanner = NSScanner(string: hexStr)
        
        //we don't have this char. but just in case
        scanner.charactersToBeSkipped = NSCharacterSet(charactersInString: "#")
        
        //self explanatory
        scanner.scanHexInt(&hexInt)
        
        return hexInt
    }
    
    //push to next VC 
    
    func pushWithLanguage(language: Language) {
        
        //push with location too
        
        print(language)
        
        let moviesVC = MoviesViewController()
        moviesVC.movieArray = language.movies
                
        self.navigationController?.pushViewController(moviesVC, animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

