//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let scores = [75, 43, 103, 87, 12]

var teamScores = 0

for score in scores {
    if score > 50 {
        teamScores += 3
    } else {
        teamScores += 1
    }
}

print(teamScores)


var optionalString: String? =  nil
print(optionalString == nil)


var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

var nickName: String? = nil
var haveName: String? = "Romeo Enso"

let informGreeting = "Hi \(nickName ?? haveName)"


//switch

let vegetable = "red pepper"

switch vegetable {
case "celery":
    print ("Add some raisings and make ants on a log.")
    
case "cucumber", "watercress":
    print ("That would make a good tea sandwich.")
    
case let x where x.hasSuffix("peper"):
    print ("Is it a spicy \(x)?")
    
default:
    print("Everything tastes good in soup.")
}

// loop
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        print ("\(number) > \(largest)")
        if number > largest {
            largest = number
        }
    }
}

print (largest)

//while loop

var n = 2

while n < 100 {
    n *= 2
}

print (n)

var m = 2

/*
 repeat always have while to avoid infinite loop
 */
repeat {
    m *= 2
} while m < 100

print (m)


//range to min..< max
var total = 0

for i in 0..<4 {
    total += i
}

print (total)





