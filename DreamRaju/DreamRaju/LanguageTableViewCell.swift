//
//  LanguageTableViewCell.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/17/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    
    var cellColor : UIColor?
    var characterImageView : UIImageView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = cellColor
        
        characterImageView = UIImageView()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(characterImageView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        let viewsDictionary : [String : AnyObject] = ["charImage" : characterImageView]
        
        let imageViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-160-[charImage]-160-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let imageViewVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-40-[charImage]-40-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        contentView.addConstraints(imageViewHConstraints)
        contentView.addConstraints(imageViewVConstraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
