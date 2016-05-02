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

    func login()
    {
    
        
        let url = NSURL(string: self.urlPath!);
        let request = NSMutableURLRequest(URL:url!)
        request.HTTPMethod = self.method!
        request.HTTPBody = inputURL!.dataUsingEncoding(NSUTF8StringEncoding)
    
        var userDetails:NSDictionary? = NSDictionary()
        
        print("Hello")
        NSURLSession.sharedSession().dataTaskWithRequest(request){ (data :NSData?, response: NSURLResponse?,error: NSError?) in
            
           
            dispatch_async(dispatch_get_main_queue()){
               
                
                if error != nil
                {
                    print(error?.description)
                       ///self.NSNotificationMessage(Constant.ERROR_MESSAGE)
                }
                
                
                do{
               let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)as? NSDictionary
                    
                    
                    
                    userDetails! = ["userId" : "\(json!["EID"] as? String)" ,
                                    "userName" : "\(json!["FirstName"] as? String) \(json!["LastName"])" ,
                                    "shopID" : "\(json!["Shop_ID"] as? String)" ,
                                    "status" : "\(json!["status"] as? String )",
                                    "mobile" : "\(json!["Mobile"]as? String)"]
                    
                    
                   
                    
                    
                    
                    self.saveTempInfoInPlistFile(userDetails!)

                    self.NSNotificationMessage()
                    
                
                }catch
                {
                    print(error)
                   
                  //  self.NSNotificationMessage(Constant.ERROR_MESSAGE)
                    
                }
                
                }

        
        }.resume()
        
        
        
    }
    
    
    private func saveTempInfoInPlistFile(dictionary : NSDictionary)
    {
    
        let tempDirectory = NSTemporaryDirectory()
        let tempPath = NSURL(fileURLWithPath: tempDirectory)
        let tempURL = tempPath.URLByAppendingPathComponent("userInfo.pilst")
        dictionary.writeToURL(tempURL, atomically: true)
        
    }
    
    
    private func NSNotificationMessage()
    {
        NSNotificationCenter.defaultCenter().postNotificationName("login",object: nil)
    }

}
