//
//  SubscriptSample.swift
//  SwiftBasicSample
//
//  Created by DehengXu on 14/6/25.
//  Copyright (c) 2014年 DehengXu. All rights reserved.
//

import UIKit

class SubscriptSample {
    
    var car = ["name":"BMW", "wheel": "Michealen", "date": "1979"]

    subscript(key :String)-> String {
        get {
            return self.car[key]!
        }
        
        set(inputValue) {
            println("key :\(key), newValue :\(inputValue)")
            self.car[key] = inputValue
        }
    }
    
}
