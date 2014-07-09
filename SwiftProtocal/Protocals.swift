//
//  Protocals.swift
//  SwiftBasicSample
//
//  Created by tongbin on 14-7-8.
//  Copyright (c) 2014年 DehengXu. All rights reserved.
//

import Foundation



protocol SomeProtocal{
 
    class func someTypeMethod()
}

protocol randomItemProtocal{
     func random() -> Double
}


protocol TogglableProtocal{
    mutating func toggle()//搬动开关的动作
}

enum Switch:TogglableProtocal{
    case Off,On
    mutating func toggle(){
        switch self{
        case Off:
            
            self = On
            println("Switch change from off to on")
        case On :
            
            self = Off
            println("Switch change from on to off")

        }
        
    }
}


class PrintProtacal: SomeProtocal , randomItemProtocal {
 
    var protocalString = "hello"
     func random() -> Double {
        println("random  is \(protocalString)")
        return 0.000
    }
    
    class func someTypeMethod() {
        println("someTypeMethod  is class  ")
     }
    var lightSwitch  = Switch.Off
   
}

/*
    产生随机数
*/
class RandomNumber:randomItemProtocal{
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double{
        lastRandom = ((lastRandom*a + c)%m)
        return lastRandom / m
    }
}

//协议作为类型 //骰子
class Dice{
    let sides: Int
    let generator : randomItemProtocal//协议为类型
    init(sides:Int , generator:randomItemProtocal){
        self.sides = sides
        self.generator = generator
    }
    func roll() ->Int{//投骰子
        return Int (generator.random() * Double(sides))+1
    }
}


protocol DiceGame{
    var dice: Dice{ get }
    func play()
}

protocol DicGameDelegate{//追踪游戏过程
    func gameDidStart(game:DiceGame)//协议为类型
    func game(game:DiceGame,didStartNewTurnWithDictDiceRoll diceRoll:Int)
    func gameDidEnd(game:DiceGame)
}

class SnakesAndLadders : DiceGame {
    let finalSquare = 25//25个格子
    let dice = Dice(sides: 6, generator: RandomNumber())
    var square = 0
    var board: [Int]
    init(){//梯子 快速攀爬
        board = [Int](count:finalSquare + 1 ,repeatedValue: 0)//全是0 的数组
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
     }
    var delegate:DicGameDelegate?
    
    func play(){
        square = 0
        delegate?.gameDidStart(self)
        gameLoop:while square != finalSquare {
        
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDictDiceRoll: diceRoll)//投了骰子
            
            switch square + diceRoll {
                case  finalSquare :
                    break gameLoop
            case let newSquare where newSquare > finalSquare:
                    continue gameLoop
            default :
                square += diceRoll
                square += board[square]
                
            }
        }
        delegate?.gameDidEnd(self)
    }
    
}

class DiceGameTracker:DicGameDelegate{

    var numberOfTurn = 0
    func gameDidStart(game: DiceGame){
        numberOfTurn = 0
        if game is SnakesAndLadders{
            println("start a new game of Snakes and Ladders")
        }
        println("The game is using a \(game.dice.sides) - sided dice")
        
    }
    func game(game: DiceGame, didStartNewTurnWithDictDiceRoll diceRoll: Int){
        ++numberOfTurn
        println("Rolled a \(diceRoll)")//一次抛骰子的抛了几点
    }
    func gameDidEnd(game: DiceGame){
        println("The game lasted for \(numberOfTurn) turns")
    }
}


