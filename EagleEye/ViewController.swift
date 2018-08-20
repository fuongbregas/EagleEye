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
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAction(){
        let message = "The value of the sider is: \(currentValue)\n" + "The target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Lmao", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        //print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
}

