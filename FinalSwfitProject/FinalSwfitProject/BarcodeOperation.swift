//
//  BarcodeOperation.swift
//  FinalSwfitProject
//
//  Created by i219pc11 on 5/26/16.
//  Copyright © 2016 iug. All rights reserved.
//

import UIKit

class BarcodeOperation {
    
    
    private var urlPath:String?
    private var method:String?
    private var inputURL:String?
    
    
    
    init()
    {
        let shopId = returnShopId()
        self.urlPath = "http://localhost/API-SWIFT/scripts/Barcode.php";
        self.method = "POST"
        self.inputURL = "shopid=\(shopId)"
        //print("shop id is \(inputURL)")
        
    }
    
    
    func fetchProductDetails(barcodeNumber:String)
    {
        let completeURL:String? = "\(inputURL!)&barcodeid=\(barcodeNumber)"
        
        let url = NSURL(string: self.urlPath!);
        let request = NSMutableURLRequest(URL:url!)
        request.HTTPMethod = self.method!
        request.HTTPBody = completeURL!.dataUsingEncoding(NSUTF8StringEncoding)
        
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
    
    private func returnShopId() -> String
    {
        
        let directory = NSTemporaryDirectory()
        let temporaryPath = NSURL(fileURLWithPath: directory)
        let temporaryFile = temporaryPath.URLByAppendingPathComponent(Constant.FILE_NAME)
        //let path = NSBundle.mainBundle().pathForResource("userInfo", ofType: "plist")
        let file  = NSDictionary(contentsOfURL: temporaryFile)
        return "\(file!["shopID"]!)"
        
    }

    private func NSNotificationMessage(content:NSObject)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("barcode",object: content)
    }


}
