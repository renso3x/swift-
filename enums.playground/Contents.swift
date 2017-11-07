//: Playground - noun: a place where people can play

import UIKit

enum CompassPoint {
    
    case north
    
    case south
    
    case east
    
    case west
}

print (CompassPoint.north)


var directionToHead = CompassPoint.west

print (directionToHead)

directionToHead = .east

switch directionToHead {
case .west:
    print ("West side")
    
case .east:
    print ("You are in the PH.")
    
default:
    print ("engks")
}

enum Barcode {
    
    case upc (Int, Int, Int, Int)
    
    case qrCode(String)
    
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("1QAZ2WSX3EDC")

switch productBarcode {
    
case .upc(let numberSystem, let manufacturer, let product, let check):
    print ("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    
case .qrCode(let productCode):
    print ("QR Code: \(productCode)")
    
}

enum ASCIIControlCharacter: Character {
    
    case tab = "\t"
    
    case lineFeed = "\n"
    
    case carriageReturn = "\r"
}

enum Num: Int {

    case zero

    case one
}

print (Num.zero.rawValue)


enum Planet: Int {
    case mercury = 1, venu, earth, mars, jupiter, saturn, uranus, neptune
}

print (Planet.mercury.rawValue)

let positionToFind = 11
//intializer might fail if no case is found
// better to control flow it to check if it has a case
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    
    case .earth:
        print ("Mostly harmless")
    
    default:
        print ("Not a safe place for humans")
    
    }
} else {
    print ("There isn't a planet at position \(positionToFind)")
}

//recursive enums
// (5 + 4) * 2
enum ArithmeticExpression {
    case number(Int)
    
    indirect case addition(ArithMeticExpression, ArithMeticExpression)
    
    indirect case multiplication(ArithMeticExpression, ArithMeticExpression)
    
}

indirect enum ArithMeticExpression {
    case number(Int)
    
    case addition(ArithMeticExpression, ArithMeticExpression)
    
    case multiplication(ArithMeticExpression, ArithMeticExpression)
}

let five = ArithMeticExpression.number(5)
let four = ArithMeticExpression.number(4)
let sum = ArithMeticExpression.addition(five, four)
let product = ArithMeticExpression.multiplication(sum, ArithMeticExpression.number(2))


func evaluate(_ express: ArithMeticExpression) -> Int {
    switch express {
        
    case let .number(value):
        return value
        
    case let .addition(left, right):
            // you can access the values when you assigned
        return evaluate(left) + evaluate(right)
        
    case let .multiplication (left, right):
        return evaluate(left) * evaluate(right)
        
    }
}

print (evaluate(sum))
print (evaluate(product))





