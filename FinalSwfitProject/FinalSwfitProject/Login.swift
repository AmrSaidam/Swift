//
//  Login.swift
//  FinalSwfitProject
//
//  Created by i219pc11 on 4/28/16.
//  Copyright © 2016 iug. All rights reserved.
//

import UIKit

class Login
{
    private var urlPath:String?
    private var phoneNumber:String?
    private var password:String?
    private var method:String?
    private var inputURL:String?
    
    
    init(phoneNumber : String , password :String)
    {
        self.phoneNumber = phoneNumber;
        self.password = password;
        self.urlPath = "http://localhost/API-SWIFT/scripts/userSignIn.php";
        self.method = "POST"
        self.inputURL = "userMobileNumber=\(phoneNumber)&userPassword=\(password)"
    }

    func login()-> Bool
    {
        let url = NSURL(string: self.urlPath!);
        let request = NSMutableURLRequest(URL:url!)
        request.HTTPMethod = self.method!
        request.HTTPBody = inputURL!.dataUsingEncoding(NSUTF8StringEncoding)
        
        
        
        return false;
    }
    
    
    
    
  

}
