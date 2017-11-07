//: Playground - noun: a place where people can play

import UIKit

// ===== ARRAY ======
var someInts = [Int]()

print ("someInts is of type [Int] with \(someInts.count)")

someInts.append(3)

someInts = []


var shoppingList = ["Egg", "Milk"]

if shoppingList.isEmpty {
    print ("Shopping is empty")
} else {
    print ("Shopping list is not empty.")
}

//adding to array
shoppingList.append("Flour")
//alternative
shoppingList += ["Baking powder"]

shoppingList[0] = "Eggs"

shoppingList.insert("Maple syrup", at: 0)
print (shoppingList)

shoppingList.remove(at: 0)
print(shoppingList)

shoppingList.removeLast()
print(shoppingList)


for list in shoppingList {
    print (list)
}

for (index, value) in shoppingList.enumerated() {
    print ("Item \(index): \(value)")
}



// ===== SET =====
var letters = Set<Character>()
print ("letters is of type Set<Character> with \(letters.count) items")

letters.insert("a")
print (letters)

var favoriteGenres: Set<String> = ["Hard Rock", "Hip Hop", "Love Songs"]
favoriteGenres.insert("Classical")
print (favoriteGenres)
favoriteGenres.remove("Love Songs")
print (favoriteGenres)
favoriteGenres.remove("Not")//returns nil if not in set

if let removedGenre = favoriteGenres.remove("Hard Rock") {
    print ("\(removedGenre) I'm over it.")
} else {
    print ("I never much cared for that.")
}

if favoriteGenres.contains("Love Songs") {
    print ("I get up on the good foot.")
} else {
    print ("I'ts been deleted recently.")
}

for genre in favoriteGenres {
    print ("\(genre)")
}

print (favoriteGenres.sorted()) //sort set


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumber: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumber).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumber).sorted()


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)


// ===== DICTIONARIES =====
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]


var cityNames = ["CEB": "CEBU", "BHL": "BOHOL"]
cityNames["MNL"] = "MANILA"

print (cityNames)

if let oldValue = cityNames.updateValue("BOHOOOL", forKey: "BHL") {
    print ("The old value is \(oldValue)")
    print (cityNames["BHL"]!)
}

if let checkIfILOILO = cityNames["ILO"] {
    print ("The names of city \(checkIfILOILO)")
} else {
    print ("No records found.")
}

cityNames["BHL"] = "BOHOL"
cityNames["BHL"] = nil

print (cityNames)

cityNames.removeValue(forKey: "CEB")
print (cityNames)


if let removedValue = cityNames["CEB"] {
    print ("The removed city names is \(removedValue)")
} else {
    print ("The city name dict does not contain for CEB")
}

for (code, vals) in cityNames {
    print ("\(code) = \(vals)")
}

for code in cityNames.keys {
    print (code)
}

for vals in cityNames.values {
    print (vals)
}
