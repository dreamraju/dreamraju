//
//  LanguageController.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/17/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit

class LanguageController: NSObject {
    
    static let sharedInstance = LanguageController()
    
    var languageArray = [Language]()
    
    //serialize JSON file
    
    func fetchLanguages() {
        
        if let path = NSBundle.mainBundle().pathForResource("Languages", ofType: "json") {
            
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                do {
                    
                    let jsonResult: NSDictionary = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments) as! [String : AnyObject]
                    
                    print(jsonResult)
                    
                    let languageDictionaries = jsonResult["results"] as! [[String : AnyObject]]
                    
                    //init language dict
                    
                    for dictionary in languageDictionaries {
                        
                        let language = Language(jsonDictionary: dictionary)
                        
                        languageArray.append(language)
                    }
                    
                } catch {}
            } catch {}
        }
    
    }

}
