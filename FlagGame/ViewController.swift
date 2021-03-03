//
//  ViewController.swift
//  FlagGame
//
//  Created by Ravi Singh on 23/05/20.
//  Copyright © 2020 Ravi Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        askQuestion()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func askQuestion (action: UIAlertAction! = nil) {
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
    }
    
    
      
    @IBAction func tappedButton(_ sender: UIButton) {
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
          
        } else {
            title = "Wrong"
            score -= 1
            
        }
        getAlert()
    }
    
    func getAlert() {
        let alert = UIAlertController.init(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
           
        alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: askQuestion))
        present(alert, animated: true)
    }
    
   
    
    
    


}

