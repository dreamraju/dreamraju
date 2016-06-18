//
//  Language.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/17/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit

class Language: NSObject {
    
//    static let kLanguageNameKey = "name"
    static let kColorKey = "hexColor"
    static let kCharacterKey = "characterImageString"
    static let kMoviesKey = "movies"
    
//    var language: String?
    var hexColor: String?
    var characterImageString: String?
    var movies: [[String: AnyObject]] = [[:]]

    init(jsonDictionary : [String : AnyObject]) {
        
//        self.language = jsonDictionary[Language.kLanguageNameKey] as? String
        self.hexColor = jsonDictionary[Language.kColorKey] as? String
        self.characterImageString = jsonDictionary[Language.kCharacterKey] as? String
        self.movies = jsonDictionary[Language.kMoviesKey] as! [[String: AnyObject]]
    }

}
