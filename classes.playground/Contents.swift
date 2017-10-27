//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Shape {
    var numberOfSides = 0
    let name = "Sample"
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
    func objName() -> String {
        return "Shape name \(name)"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
shape.objName()


class NamedShape {
    
    var numberOfSides: Int = 0
    var name: String
    
    init (name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


class Square: NamedShape {
    var sideLength: Double
    
    init(_ sideLength: Double, _ name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(7, "My Test Square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radius: Double
    
    init(_ radius: Double, _ name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return (radius*2.0) * 3.14159265358979
    }
    
    override func simpleDescription() -> String {
        return "A circle has radius of \(radius)"
    }
}

let c = Circle(5.0, "Baby Circle")
c.area()
c.simpleDescription()


class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        
        super.init(name: name)
        
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        set (myVal) {
            sideLength = myVal / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(size, name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10.00, name: "another test shape")
print (triangleAndSquare.square.sideLength)
print (triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(50.00, "larger square")
print (triangleAndSquare.triangle.sideLength)

// check if value is an instance of square
let optionalSquare: Square? = Square(2.5, "optional square")
// check if sideLength has value
let sideLength = optionalSquare?.sideLength




