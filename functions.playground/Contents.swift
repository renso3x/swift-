//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// _ in front of arg you can pass with no key in args

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}

greet("Romeo", on: "Friday")

//return a tuple
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])

print (statistics.min)
print (statistics.max)
print (statistics.sum)
// access the tuple return by its index
print (statistics.0)
print (statistics.1)
print (statistics.2)

// Closures
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}

let fifteen = returnFifteen()

print (fifteen)

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int)-> Bool) -> Bool {
    
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]

hasAnyMatches(list: numbers, condition: lessThanTen)

print("-----")
numbers.map({ (number: Int) -> Int in
    var result = 3 * number
    if number % 2 == 1 {
        result = 0
    }
    print (result)
    return result
})

let mappedNumbers = numbers.map({ number in 3 * number })
print (mappedNumbers)

let sortedNumbers = numbers.sorted{ $0 < $1 }
print (sortedNumbers)

func greetAgain(person: String, isGreeted: Bool) -> String {
    if isGreeted {
        return "Hello again \(person)!"
    } else {
        return "Hello \(person)!"
    }
    
}

print (greetAgain(person: "Romeo", isGreeted: false))
print (greetAgain(person: "Richard", isGreeted: true))


func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

//optional return function
// check if args is supplied
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (min: currentMin, max: currentMax)
}

if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print ("The min is \(bounds.min) and max is \(bounds.max)")
}

//let outBound = minMax(array: [])
//print (outBound)

// from is referring to hometown
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad to visit from \(hometown)"
}

print (greet(person: "Romeo", from: "Bohol"))

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for n in numbers {
        total += n
    }
    return total/Double(numbers.count)
}

arithmeticMean(1,2,3,4,5)
arithmeticMean(3, 7.24, 18.22)

func adder (_ a: Int, _ b: Int) -> Int {
    return a + b
}
//assigning func as types
let addition: (Int, Int) -> Int = adder

print ("The addition func \(addition(3, 5))")

// function as an argument
func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print ("Result: \(mathFunc(a, b))")
}

printMathResult(adder, 10, 3)


//nested function
// return a function
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentVal = 3
//refers the first argument
let moveNearerToZero = chooseStepFunction(backward: currentVal > 0)

while currentVal != 0 {
    print ("\(currentVal)...")
    //the next passed args is the int value
    currentVal = moveNearerToZero(currentVal)
}
print ("zero!")


