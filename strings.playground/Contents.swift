//: Playground - noun: a place where people can play

import UIKit

let greetings = "Greeting"
greetings[greetings.startIndex]
greetings[greetings.index(greetings.startIndex, offsetBy: 3)]


//for index in greetings.indices {
//    print ("\(greetings[index])", terminator: "|")
//}


var welcome = "hello"

welcome.insert("!", at: welcome.endIndex)
//welcome.insert(contentsOf: " there", at: welcome.index(welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))

//let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex

//let hello = "Hello, World"
//let index = hello.index(of: ", ") ?? hello.endIndex
//let beginning = hello[..<index]
//print (beginning)



let compareNow = "I am comparing this String"
let newCompaing = "I am comparing this String"

if compareNow == newCompaing {
    print ("This strings are equal")
}


let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1Scene = 0

for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1Scene += 1
    }
}

print (act1Scene)


var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    }
    if scene.hasSuffix("cell") {
        cellCount += 1
    }
}

print ("\(mansionCount) scenes; \(cellCount) scenes")






