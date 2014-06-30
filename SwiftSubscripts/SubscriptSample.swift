//
//  SubscriptSample.swift
//  SwiftBasicSample
//
//  Created by DehengXu on 14/6/25.
//  Copyright (c) 2014年 DehengXu. All rights reserved.
//

import UIKit

class SubscriptSample {
    
    var teachers = ["age": "33", "birth": "1979"]
    
    var infos :NSDictionary = ["age": 33, "birth": 1979]

    subscript(key :String)-> String {
        get {
            return self.teachers[key]!
        }
        
        set {
            println("key :\(key), newValue :\(newValue)")
            self.teachers[key] = newValue
        }
    }
    
}
