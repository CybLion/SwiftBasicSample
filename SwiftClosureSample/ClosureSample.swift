//
//  ClosureSample.swift
//  SwiftBasicSample
//
//  Created by NicholasXu on 14/6/16.
//  Copyright (c) 2014年 DehengXu. All rights reserved.
//

import Foundation

class ClosureSample {
    
    func max(value1: Int, value2: Int)->Int {
        
        { (a: Int, b: Int)->Int in return (a > b ? a : b) }
        
//        return value1 > value2 ? value1 : value2
    }
    
    func volumn(x: Float, y: Float, z: Float)->Float {
        return x * y * z;
    }
 
    func area(width: Float, height: Float)->Float {
        return width * height;
    }
}

