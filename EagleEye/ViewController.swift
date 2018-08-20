//
//  ViewController.swift
//  EagleEye
//
//  Created by Phuong Tran on 8/19/18.
//  Copyright © 2018 Phuong Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAction(){
        let alert = UIAlertController(title: "Hi There", message: "testing Things", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Lmao", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}

