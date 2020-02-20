//
//  HRTextView.swift
//  Happiness RIGHT?
//
//  Created by Kinney Kare on 2/19/20.
//  Copyright © 2020 Kinney Kare. All rights reserved.
//

import UIKit

class HRTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(textView: UITextView, bgColor: UIColor, borderColor: CGColor) {
    
    textView.backgroundColor = bgColor
    textView.textColor = #colorLiteral(red: 0.8287954694, green: 0.9360667253, blue: 1, alpha: 1)
    textView.textAlignment = .center
    
    
    //Create a shadow for the TextView
    textView.layer.cornerRadius = textView.frame.size.height/2
    textView.layer.borderWidth = 5
    textView.layer.cornerRadius = 10
    textView.layer.borderColor = borderColor
    textView.clipsToBounds = true
    textView.layer.shadowOpacity = 0.4
    textView.layer.shadowOffset = CGSize(width: 2, height: 2)
    textView.adjustsFontForContentSizeCategory = true
    }
}
