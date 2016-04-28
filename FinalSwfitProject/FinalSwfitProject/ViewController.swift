//
//  ViewController.swift
//  FinalSwfitProject
//
//  Created by i219pc11 on 4/24/16.
//  Copyright © 2016 iug. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareButtonDesign()
       
    // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchBackground(sender: UITapGestureRecognizer) {
        phoneNumber.resignFirstResponder()
        password.resignFirstResponder()
    }
    @IBAction func CancelAction(sender: UIButton) {
        phoneNumber.text = ""
        password.text = ""
        
    }
    private func prepareButtonDesign()
    {
        cancelButton.layer.cornerRadius = 5.0
        signinButton.layer.cornerRadius = 5.0
        let buttonTextColor = signinButton.titleLabel?.textColor;
        
        signinButton.layer.borderColor = buttonTextColor?.CGColor
        signinButton.layer.borderWidth = 2
        

        
    }
    

}

