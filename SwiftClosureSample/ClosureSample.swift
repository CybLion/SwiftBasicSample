//
//  ClosureSample.swift
//  SwiftBasicSample
//
//  Created by NicholasXu on 14/6/16.
//  Copyright (c) 2014年 DehengXu. All rights reserved.
//

import Foundation

class ClosureSample {
    var country = ["China", "USA", "Japan", "Russia", "Korea"];
    
    let constValue = 5;
    
    func max(value1: Int, value2: Int)->Int {
        return value1 > value2 ? value1 : value2
    }
    
    func volumn(x: Float, y: Float, z: Float)->Float {
        return x * y * z;
    }
 
    func area(width: Float, height: Float)->Float {
        return width * height;
    }
    
    // 正常的闭包调用
    func normalClosure() {
        
        println("排序前: \(country)")
        
        var sorted = sort(country,
            {(str1: String, str2: String)->Bool in return str1 < str2}//这里是单行的闭包定义，return 语句可以省略
        )
        
        println("排序后: \(country)")
    }
    
    
    func clousureExpression() {
        
    }

    // 闭包缩写参数
    func shorthandClosure() {
        
        println("排序前: \(country)")
        
        var sorted = sort(country,
            {$0 < $1}//这里是缩写参数的闭包表达式
        )
        
        println("排序后: \(country)")

    }
    
    func operatorFunction() {
        println("排序前: \(country)")
        
        var sorted = sort(country,
             < 
        )
        
        println("排序后: \(country)")
    }
    
    func mySort(closure:(str1: String, str2: String)->()) {
        sort(country, {(str1, str2) in return str1 < str2});
    }
    
    // 尾闭包的实现方式
    func tailingClosure() {
        println("排序前: \(country)")
        
        var sorted = sort(country){
            (str1: String, str2: String)->Bool in return str1 < str2
        }//这里是单行的闭包定义，return 语句可以省略
        
        
        println("排序后: \(country)")
        
//        var sorted = mySort{
//        
//        }

    }

    func tailingClosureFunction(closure:()->()) {
        
    }
    
    func captureValue() {
        
    }
    
    // 将函数闭包作为值返回
    func incrementValue(incrementValue value:Int) -> () -> Int {
        var returnValue = 0

        func increment() -> Int {
            returnValue += value
            return returnValue
        }

        return increment
    }
    

    func referenceClosure() {
        let incrementByTen = self.incrementValue(incrementValue: 10)
        var t = incrementByTen()
        t = incrementByTen()
        
        println("t :\(t)");
        let incrementByFive = self.incrementValue(incrementValue: 5)
        t = incrementByFive()
        println("t :\(t)");

    }
    
    
}

