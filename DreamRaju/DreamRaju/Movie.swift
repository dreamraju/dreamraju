//
//  Movie.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/17/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit

class Movie: NSObject {

    static let kNameKey = "name"
    static let kImageStringKey = "imageString"
    
    var name: String?
    var imageString: String?
    
    init(jsonDictionary : [String : AnyObject]) {
        
        self.name = jsonDictionary[Movie.kNameKey] as? String
        self.imageString = jsonDictionary[Movie.kImageStringKey] as? String
    }

}
