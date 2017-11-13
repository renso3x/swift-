//: Playground - noun: a place where people can play

import UIKit

// SuperClass
class Vehicle {
    
    var currentSpeed = 0.0
    
    var numberOfWheels = 0
    
    var description: String {
        
        return "traveling at \(currentSpeed) miles per hour"
        
    }
    
    func makeNoise() {
        
        
    }
    
}

let someVehicle = Vehicle ()

print ("Vehicle: \(someVehicle.description)")
//sub classing
// Inherit from Vehicle Class
class Bicycle: Vehicle {
    
    var hasBasket = false
}


let bicycle = Bicycle()

bicycle.hasBasket = true

bicycle.currentSpeed = 15.0

print ("Bicycle: \(bicycle.currentSpeed)")

// subclass of bicycle
// inhertis the properties and methods from bicycle and vehicle
class Tandem: Bicycle {
    
    var currentPassenger = 0
    
}

let tandem = Tandem()

tandem.currentPassenger = 10

tandem.hasBasket = true

tandem.currentSpeed = 22.0

print ("Tandem: \(tandem.description)")


//ovveriding methods
class Tran: Vehicle {
    
    override func makeNoise() {
        print ("Choo Choo")
    }
}

let train = Tran()

train.makeNoise()

// override property

class Car: Vehicle {
    
    var gear = 1
    
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()

car.currentSpeed = 25.0

car.gear = 3

print ("Car: \(car.description)")


class AutomaticCar: Car {
    
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()

automatic.currentSpeed = 35.0

print ("AutomaticCar: \(automatic.description)")

struct Fahrenheit {
    
    var temperature = 32.0
    
    init () {
        
    }
}

var f = Fahrenheit()
print ("Default temp is \(f.temperature) Fahrenheit")


// optional value

class SurveyQuestion {
    let text: String
    var response: String?
    
    init (text: String) {
        self.text = text
    }
    
    func ask() {
        print (text)
    }
    
    func answer() {
        print (response)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")

cheeseQuestion.ask()

cheeseQuestion.response = "Yes, I do like cheese"

cheeseQuestion.answer()

let beetQuesion = SurveyQuestion(text: "How about beets?")

beetQuesion.ask()

beetQuesion.response = "I also like beets. (But not with cheese)"

beetQuesion.answer()


struct Size {
    var width = 0.0, height = 0.0
}
//struct has automatic init()
let twoByTwo = Size(width: 2.0, height: 2.0)


class ATV: Vehicle {
    
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let atv = ATV()

print (atv.numberOfWheels)


class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unamed")
    }
    
}

let namedMeat = Food(name: "Bacon")


class RecipeIngrideient: Food {
    var quantity: Int

    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}


















