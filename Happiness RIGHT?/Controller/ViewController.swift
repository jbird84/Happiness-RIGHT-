//
//  ViewController.swift
//  Happiness RIGHT?
//
//  Created by Kinney Kare on 12/10/19.
//  Copyright © 2019 Kinney Kare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var happinessLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var fiveDollarBillOne: UIImageView!
    @IBOutlet weak var fiveDollarBillTwo: UIImageView!
    @IBOutlet weak var fiveDollarBillThree: UIImageView!
    @IBOutlet weak var fiveDollarBillFour: UIImageView!
    @IBOutlet weak var fiveDollarBillFive: UIImageView!
    @IBOutlet weak var fiveDollarBillSix: UIImageView!
    @IBOutlet weak var fiveDollarBillSeven: UIImageView!
    
    
    
    
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var score = 0
    var fiveDollarBillArray = [UIImageView]()
    let endOfGame: String = "Time Ended"
    var highScore = 0
    let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
    
    
    override func viewDidLoad() {
        
        //this will check to see if there is a highscore and present it if so
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        fiveDollarBillArray =
            [fiveDollarBillOne, fiveDollarBillTwo, fiveDollarBillThree, fiveDollarBillFour, fiveDollarBillFive, fiveDollarBillSix, fiveDollarBillSeven]
        counter = 15
        timerLabel.text = "Time: \(counter)"
        happinessLabel.text = "Happiness: \(score)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideFiveDollarBills), userInfo: nil, repeats: true)
        
        //this allows each UIImageView to be tapped.
        fiveDollarBillOne.isUserInteractionEnabled = true
        fiveDollarBillTwo.isUserInteractionEnabled = true
        fiveDollarBillThree.isUserInteractionEnabled = true
        fiveDollarBillFour.isUserInteractionEnabled = true
        fiveDollarBillFive.isUserInteractionEnabled = true
        fiveDollarBillSix.isUserInteractionEnabled = true
        fiveDollarBillSeven.isUserInteractionEnabled = true
        
        //sets-up the tap-gesture
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(decreaseHappiness))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(decreaseHappiness))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(decreaseHappiness))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(decreaseHappiness))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(decreaseHappiness))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(decreaseHappiness))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(decreaseHappiness))
        
        //this sets each tap-gesture to a UIImageView
        fiveDollarBillOne.addGestureRecognizer(recognizer1)
        fiveDollarBillTwo.addGestureRecognizer(recognizer2)
        fiveDollarBillThree.addGestureRecognizer(recognizer3)
        fiveDollarBillFour.addGestureRecognizer(recognizer4)
        fiveDollarBillFive.addGestureRecognizer(recognizer5)
        fiveDollarBillSix.addGestureRecognizer(recognizer6)
        fiveDollarBillSeven.addGestureRecognizer(recognizer7)
        
        //this hides ALL UIImageViews when view loads
        hideFiveDollarBills()
    }
    
    
    //This func sets up the alert at the end of the game giving the user to chance to play again.
    func lifeOverAlert() {
        
        let alert = UIAlertController(title: "Life Is Over", message: "How happy are you now with all this money?" , preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Play Again!", style: .default, handler: { (action) in
            self.performSegue(withIdentifier: "Restart", sender: self)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //This func counts down from 15 and shows the number on the timerLabel.
    @objc func timerFunction() {
        
        timerLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter <= -1 {
            timer.invalidate()
            timerLabel.text = endOfGame
            lifeOverAlert()
            for image in fiveDollarBillArray {
                image.isHidden = true
            }
            
            //HighScore
            if self.score < self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                
                //this will save the highscore to user defaults
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
        }
    }
    
    
    //this func goes through the fiveDollarBillArray and sets each UIImageView to .isHidden this prevents the user from being able to access them.
    @objc func hideFiveDollarBills() {
        for image in fiveDollarBillArray {
            image.isHidden = true
        }
        if counter < 1 {
            hideTimer.invalidate()
            fiveDollarBillArray.randomElement()?.isHidden = true
        }
        fiveDollarBillArray.randomElement()?.isHidden = false
    }
    
    
    //this func decreases your happiness by 5 (because the money is $5) and shows on the happinessLabel
    @objc func decreaseHappiness() {
        score -= 5
        happinessLabel.text = "Happiness: \(score)"
    }
}

