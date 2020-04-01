//
//  ViewController.swift
//  JSONTest
//
//  Created by Seyed Ali Shahrokhi on 1/13/1399 AP.
//  Copyright © 1399 Seyed Ali Shahrokhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       let url = URL(string: "http://192.168.64.3")!
           
               let task = URLSession.shared.dataTask(with: url) { (data, response, erorr) in
                  
                            do {
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    let studentArray = jsonDictionary["student"] as? [[String:Any]]
                                
                                for item in studentArray! {
                                    
                                    print("Name = \(item["fname"] as! String ) lastName = \(item["lname"] as! String ) age  = \(item["age"]! )")
                    }
                                
                    
                                
                    
                    
                }catch {
                    print("Error")
                }

                
               }

                task.resume()
}

}
