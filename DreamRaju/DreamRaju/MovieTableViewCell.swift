//
//  MovieTableViewCell.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/17/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var nameLabel : UILabel!
    var movieImageView : UIImageView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //change eventually
        self.backgroundColor = UIColor.whiteColor()
        
        nameLabel = UILabel()
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.font = UIFont(name: "Arial-Hebrew", size: 20)
        nameLabel.backgroundColor = UIColor.clearColor()
        
        movieImageView = UIImageView()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(movieImageView)
        contentView.addSubview(nameLabel)
        
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        
        let viewsDictionary : [String : AnyObject] = ["movieImage" : movieImageView, "label" : nameLabel]
        
        //text variable
        
        let zeroString = 0
        
        let imageViewHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-\(zeroString)-[movieImage]-\(zeroString)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let imageViewVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[movieImage]-80-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let labelHConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[label]-50-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        let labelVConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-130-[label]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        contentView.addConstraints(imageViewHConstraints)
        contentView.addConstraints(imageViewVConstraints)
        contentView.addConstraints(labelHConstraints)
        contentView.addConstraints(labelVConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
