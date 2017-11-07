//: Playground - noun: a place where people can play

import UIKit


let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for (animalname, legCount) in numberOfLegs {
    print ("\(animalname) has \(legCount) legs")
}

for index in 1...5 {
    print ("\(index) times 5 in \(index * 5)")
}

let base = 3
let power = 10
var answer = 1

// full range
for _ in 1...power {
    answer *= base
}

print ("\(base) to the power of \(power) of is \(answer)")

let minutes = 60
//half open range
for tickMark in 0..<minutes {
    print (minutes)
}

let minuteInterval = 5
// show evert 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print (tickMark)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print (tickMark)
}

//while loop
//snake ladder
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02

board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0

while square < finalSquare {
    diceRoll += 1
    
    if diceRoll == 7 { diceRoll = 1 }

    square += diceRoll
    
    if square < board.count {
        square += board[square]
    }
}

print ("Game Over")

let end = 3
var start = 0
//do-while in other language
repeat {
    print ("My name is Romeo Enso")
    start += 1
} while start < end

// repeat-while snake ladder game
//repeat {
//    square += board[square]
//    
//    diceRoll += 1
//    
//    if diceRoll == 7 { diceRoll = 1 }
//    
//    square += diceRoll
//} while square < finalSquare

//if

var temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
    print ("It's ver cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print ("It's really warm. Don't forget your sunscreen.")
} else {
    print ("It's not that cold. Wear a t-shirt")
}

//switch
let someCharacter: Character = "A"

switch someCharacter {
    case "a", "A":
        print ("The first letter in the alphabet")
        print ("A-a")
    
    case "z":
        print ("The last letter in the alphabet")
    
    default:
        print ("Some other character")
}

let approximateCount = 62
let countedThings = "moons orbiting saturn"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozen"
case 100..<1000:
    naturalCount = "hundred"
default:
    naturalCount = "many"
}

print ("There are \(naturalCount) \(countedThings)")


//tuple switch
let somePoint = (1, 1)

switch somePoint {
case (0, 0):
    print ("\(somePoint) is at the origin")
case (_, 0):
    //accept a wildcard of the first
    print ("\(somePoint) is at the x-axis")
case (0, _):
    print ("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    
    //tuple with range values
    print ("\(somePoint) is inisde the box")
    
default:
    print ("\(somePoint) is outside the box")
}

//switch

//takes the case as an value
// where compares the value in the case statement

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print ("\(x), \(y) is on the line x==y")
case let (x, y) where x == -y:
    print ("\(x), \(y) is on the line x == -y")
case let (x,y):
    print ("\(x), \(y) is just some arbitrary point")
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

//continue switch
//loop through a string
for char in puzzleInput.characters {
    if charactersToRemove.contains(char) {
        continue
    } else {
        puzzleOutput.append(char)
    }
}

print (puzzleOutput)

//fallthrough
let integerTODescribe = 5
var description = "The number \(integerTODescribe) is "
switch integerTODescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number, and also"
    fallthrough//used to include the default case
default:
    description += " an integer"
}

print (description)

//gameLoop: while square != finalSquare {
//    diceRoll += 1
//    if diceRoll == 7 { diceRoll = 1 }
//    
//    switch square + diceRoll {
//    case finalSquare:
//        break gameLoop
//    
//    
//    case let newSquare where newSquare > finalSquare:
//        continue gameLoop
//    
//    default:
//        square += diceRoll
//        square += board[square]
//    }
//}
//
//print ("Game Over!")


//guard
//it lets you check if the variable is available
//same as if statement is neat
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print ("Hello \(name)!")
    
    guard let location = person["location"] else {
        print ("I hope the weather is nice near you.")
        return
    }
    print ("I hope the weather is nice in \(location)")
}

greet(person: ["name": "Romeo"])
greet(person: ["name": "Romeo", "location":  "Ilo-Ilo"])

