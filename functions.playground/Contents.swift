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




