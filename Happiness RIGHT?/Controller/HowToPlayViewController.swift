//
//  HowToPlayViewController.swift
//  Happiness RIGHT?
//
//  Created by Kinney Kare on 12/15/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController {
    
    @IBOutlet weak var textViewOne: UITextView!
    @IBOutlet weak var textView2: UITextView!
    @IBOutlet weak var textView3: UITextView!
    @IBOutlet weak var textView4: UITextView!
    
    let setupTextView = HRTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextView.configure(textView: textViewOne, bgColor: .systemPurple, borderColor: #colorLiteral(red: 0.203851225, green: 0.01464015615, blue: 0.7196509265, alpha: 1))
        setupTextView.configure(textView: textView2, bgColor: .systemBlue, borderColor: #colorLiteral(red: 0.1263605635, green: 0.001103540331, blue: 0.7170249048, alpha: 1))
        setupTextView.configure(textView: textView3, bgColor: .systemGreen, borderColor: #colorLiteral(red: 0.07156096814, green: 0.3263007614, blue: 0.09400672382, alpha: 1))
        setupTextView.configure(textView: textView4, bgColor: .systemRed, borderColor: #colorLiteral(red: 0.3235445749, green: 0.02745861958, blue: 0.05172072196, alpha: 1))
        
    }
    
    
}
