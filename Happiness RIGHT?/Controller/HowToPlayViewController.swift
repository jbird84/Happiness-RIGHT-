//
//  HowToPlayViewController.swift
//  Happiness RIGHT?
//
//  Created by Kinney Kare on 12/15/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeTheTextView(textView: textViewOne, bgColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
        shapeTheTextView(textView: textView2, bgColor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))
        shapeTheTextView(textView: textView3, bgColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        shapeTheTextView(textView: textView4, bgColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
    }
    
    @IBOutlet weak var textViewOne: UITextView!
    @IBOutlet weak var textView2: UITextView!
    @IBOutlet weak var textView3: UITextView!
    @IBOutlet weak var textView4: UITextView!
    
    
    func shapeTheTextView(textView: UITextView, bgColor: UIColor, borderColor: CGColor) {
        
        textView.backgroundColor = bgColor
        textView.textColor = #colorLiteral(red: 0.8287954694, green: 0.9360667253, blue: 1, alpha: 1)
        textView.textAlignment = .center
        
        
        //Create a shadow for the TextView
        textView.layer.cornerRadius = textView.frame.size.height/2
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = borderColor
        textView.clipsToBounds = true
        textView.layer.shadowOpacity = 0.4
        textView.layer.shadowOffset = CGSize(width: 2, height: 2)
        textView.adjustsFontForContentSizeCategory = true
        
    }
    
}
