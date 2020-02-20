//
//  StartScreenViewController.swift
//  Happiness RIGHT?
//
//  Created by Kinney Kare on 12/10/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func startButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "PlayGame", sender: self)
        
    }
    
}
