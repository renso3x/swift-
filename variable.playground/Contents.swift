//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var myVar = 56

let myConstant = 4

let implicitInteger = 70

let implicitDouble = 70.0

let explicitDouble: Double = 70

let explicitFLoat: Float = 30.01

let label = "The Temp \(explicitFLoat + Float(explicitDouble))"

var shoppingList = ["catfish", "water", "tulips"]

shoppingList[1] = "bottle of water"

shoppingList

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]

occupations["Jayne"] = "Public Relations"
occupations["Malcolm"] = "Crew"

occupations

var names = [String]()
names.append("romeo")

var students = [Int: String]()
students[1] = "Romeo"


let scores = [75, 43, 103, 87, 12]

var teamScore = 0

for score in scores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print (teamScore)


