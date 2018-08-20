//
//  ViewController.swift
//  EagleEye
//
//  Created by Phuong Tran on 8/19/18.
//  Copyright © 2018 Phuong Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue: Int = 50
    var score: Int = 0
    var round: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    // Every time player submits, new round starts
    func startNewRound(){
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        round = round + 1
    }
    
    // When player wants to start over
    func startNewGame(){
        round = 0
        score = 0
    }
    
    @IBAction func startOver(){
        startNewGame()
        startNewRound()
        updateLabel()
    }
    
    func updateLabel(){
        targetLabel.text = String(targetValue) // Convert target value to string, then set it to target label
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabel()
        /*
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAction(){
        let differences = abs(targetValue - currentValue)
        var points = 100 - differences // The lower differences, the higher points
        
        
        let title: String
        if differences == 0{
            title = "You have Eagle Eyes!"
            points = points + 100
        }
        else if differences < 5 {
            title = "It was close!"
            points = points + 50
        }
        else if differences < 10 {
            title = "Please check you eyes"
        }
        else{
            title = "You are BLIND!"
        }
        score = score + points // Total points
        
        let message = "The value of the sider is: \(currentValue)\n" + "The target value is: \(targetValue)\n" + "You scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Lmao", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        // Start new round after player submit value so that new random target value can be generate
        startNewRound()
        updateLabel()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        //print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
}

