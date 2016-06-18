//
//  MoviesViewController.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/17/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //eventually subclass
    var movieArray : [[String : AnyObject]] = [[:]]
    
    var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        print(movieArray)
        
        setUpTableView()
    }
    
    func setUpTableView() {
        
        tableView = UITableView(frame: view.bounds, style: .Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.registerClass(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let movieDict = movieArray[indexPath.row]
        
        let imageString = String(movieDict["imageString"]!)
        
        let image = UIImage(named: imageString)
        
        let name = movieDict["name"] as! String
        
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell") as! MovieTableViewCell
        
        cell.movieImageView.image = image
        cell.nameLabel.text = name
        
        return cell
        
    }
    
    //DEL
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let movieDict = movieArray[indexPath.row]
        
//        let image = UIImage(named: String(movieDict["imageString"]))
        let name = movieDict["name"] as! String
        
//        let detailVC = DetailViewController()
        
        let tabBarViewController = TabBarViewController()
        tabBarViewController.setTitleString(name)
        
        self.navigationController?.pushViewController(tabBarViewController, animated: true)
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 200
        
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
