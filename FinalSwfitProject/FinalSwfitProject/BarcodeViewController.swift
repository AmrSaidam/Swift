//
//  BarcodeViewController.swift
//  FinalSwfitProject
//
//  Created by i219pc11 on 5/3/16.
//  Copyright © 2016 iug. All rights reserved.
//

import UIKit

class BarcodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logoutAction(sender: AnyObject) {
        
        if Logout.logout() == true
        {
            let login = self.storyboard!.instantiateViewControllerWithIdentifier("LoginViewController") as? ViewController
            self.presentViewController(login!, animated: true, completion: nil)
        }else
        {
            PrintMessage.alertMessages(self, title: "Warnning", message: "Something went wrong during logout, please try again")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
