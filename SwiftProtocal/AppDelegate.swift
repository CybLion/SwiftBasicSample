//
//  AppDelegate.swift
//  SwiftProtocal
//
//  Created by tongbin on 14-7-8.
//  Copyright (c) 2014年 DehengXu. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        
        var pro:PrintProtacal?
        pro  = PrintProtacal()
//        pro!.protocalString = ""
        PrintProtacal.someTypeMethod()
        let randomDou =  pro!.random()
        pro!.lightSwitch.toggle()
        
        
        var protocalType =  Dice (sides: 6, generator: RandomNumber())
        for _ in  1...5 {
            println("random dice roll is \(protocalType.roll())")
        }
        
        
        //抛骰子
        let tracker = DiceGameTracker()
        let game = SnakesAndLadders()
        game.delegate = tracker
        game.play()
        //扩展类里面
       println(  game.asText() )//一共多少个方框格子
        
        //扩展类里面
        let dl1 = Dice(sides: 12, generator: RandomNumber())
        
        println(dl1.asText())
        
        //集合中的协议
        let tempThings:[TextRepresentable] = [game,dl1]
        for thing in tempThings {
            println("array protocal \(thing.asText())")
        }
        
        // 检查协议的一致性
        let objects : [AnyObject] = [ Circle(radius: 12.0), Country(area:243_234),  Animal(legs:4)]
        for object in objects {
            if let objectWithArea = object as? HasArea{
                println("The Area is \(objectWithArea.area)")
            }else{
                println("No Area")
            }
        }
        
        
        
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

