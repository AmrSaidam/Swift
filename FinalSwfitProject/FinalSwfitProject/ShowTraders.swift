//
//  ShowTraders.swift
//  FinalSwfitProject
//
//  Created by i219pc11 on 5/4/16.
//  Copyright © 2016 iug. All rights reserved.
//

import UIKit

class ShowTraders{
    
    private var urlPath:String?
    private var method:String?
    private var inputURL:String?
    
    
    
    init()
    {
        let userID = returnUserId()
        self.urlPath = "http://localhost/API-SWIFT/scripts/listOfTrader.php";
        self.method = "POST"
        self.inputURL = "uid=\(userID)"
        
    }

    
    
    func fetchAllTraders()
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
                    self.NSNotificationMessage(Constant.ERROR_MESSAGE)
                }
                
                
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)as? NSDictionary
                    
                    
                    
                    
                    //print("\(json!)")
                    if "\(json!["status"]!)" == "200" {
                        
                     
                        userDetails! = json! as NSDictionary
                        let temp  = userDetails! as! NSMutableDictionary
                        temp.removeObjectForKey("status")
                        self.NSNotificationMessage(userDetails!)
                        
                        
                    }else
                    {
                        self.NSNotificationMessage(Constant.WRONG_VALIDATION)
                    }
                    
                    
                    
                    
                }catch
                {
                    
                    self.NSNotificationMessage(Constant.ERROR_MESSAGE)
                    
                    
                    
                }
                
            }
            
            
            }.resume()
        
        

        
    }
    
    
    private func returnUserId() -> String
    {
        
        let directory = NSTemporaryDirectory()
        let temporaryPath = NSURL(fileURLWithPath: directory)
        let temporaryFile = temporaryPath.URLByAppendingPathComponent(Constant.FILE_NAME)
        //let path = NSBundle.mainBundle().pathForResource("userInfo", ofType: "plist")
        let file  = NSDictionary(contentsOfURL: temporaryFile)
        return "\(file!["userId"]!)"
        
    }

    
    private func NSNotificationMessage(content:NSObject)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("traders",object: content)
    }
}
