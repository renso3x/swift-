//: Playground - noun: a place where people can play

import UIKit

var names = ["ed", "jack", "frank", "debbie"]

var reveresedNames = names.sorted(by: { (_ s1: String, _ s2: String) -> Bool in
    return s1 > s2
})

print (reveresedNames)

let digitNames = [
    0: "Zero",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}

print (strings)

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0

    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print (incrementByTen())

var completionHandlers: [() -> Void] = []
func someFuncWithEscapingClosure(completionHandler: @escaping() -> Void) {
    completionHandlers.append(completionHandler)
}

func someFuncWithNoneEscapingClosure(closure: () -> Void) {
    closure()
}

class SomeClasss {
    var x = 10
    func doSomething() {
        someFuncWithEscapingClosure {
            self.x = 100
        }
        someFuncWithNoneEscapingClosure {
            x = 200
        }
    }
}

let instance = SomeClasss()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print (instance.x)

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print (customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print (customersInLine.count)

print ("Now Service \(customerProvider())!")

print (customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print ("Now service \(customerProvider())")
}

serve(customer: { customersInLine.remove(at: 0) })

func serve(customer customerProvider: @autoclosure () -> String) {
    print ("Now service \(customerProvider())")
}

serve(customer: { customersInLine.remove(at: 0) })

var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print ("Collected \(customerProviders.count) closures.")

for customerProvider in customerProviders {
    print ("Now serving \(customerProvider())!")
}


func someFunctionThatTakesAClosure(closure: () -> Void) {
    //function body
}

someFunctionThatTakesAClosure (closure: {
    //closure body
})

someFunctionThatTakesAClosure() {
    // trailing closure
}

// inline someFunctionThatTakesAClosure { $0 > $1 }
