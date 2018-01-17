//: Playground - noun: a place where people can play

import UIKit

// FIZZ BUZZ

func fizzBuzz(n: Int) {
    
    if n % 3 == 0 {
        print ("fizz")
    }
    
    if n % 5 == 0 {
        print ("buzz")
    }
    
    if n % 3 == 0 && n % 5 == 0 {
        print("fizz buzz")
    }
}

fizzBuzz(n: 1)
fizzBuzz(n: 2)
fizzBuzz(n: 3)

//Binary Search

let num = [1,2,4,56,7,8,123,3,51,34]

func findBinarySearch(find searchValue: Int, in collection: [Int]) -> Bool {
    
    var leftIndex = 0 //index
    var rightIndex = collection.count - 1//index
    
    while leftIndex <= rightIndex {
        
        let middleIndex = (leftIndex + rightIndex) / 2
    
        let middleValue = collection[middleIndex]
        
        print ("middleValue: \(middleValue), leftIndex: \(leftIndex), rightIndex: \(rightIndex), collection: \(collection[leftIndex], collection[rightIndex])")
        
        if searchValue == middleValue {
            return true
        }
        
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        
        if searchValue > middleValue {
            leftIndex = middleIndex + 1
        }
    }
    
    return false
}

findBinarySearch(find: 1, in: num)
//findBinarySearch(find: 56, in: num)

//Factorial & Recursion

func factorial(n: Int) -> Int {
    
    var finalValue: Int = 1
    
    for i in 1...n {
        finalValue = finalValue * i
    }
    
    return finalValue
}

print ("Factorial of \(4): \(factorial(n: 5))")

// use recursive if you have a breaking point
// where it reset to calling itself
func recursiveFactorial(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    
    return n * recursiveFactorial(n: n - 1)
}
print ("Factorial of \(5): \(recursiveFactorial(n: 5))")

// find the count of the names
// using dicitionary
let names = ["Romeo", "John", "Romeo", "Rey"]
func mostCommonName(group: [String]) -> [String: Int] {

    var nameDict = [String: Int]()
    
    for item in group {
        if let count = nameDict[item] {
            nameDict[item] = count + 1
        } else {
            nameDict[item] = 1
        }
    }

    return nameDict
}

print(mostCommonName(group: names))

//reverse a string
let string = "The quick brown fox jumps over the red corridor"

func reverseWordsAlternate(sentence: String) -> String {
    let allWords = sentence.split(separator: " ")
    var newSentence = ""
    
    for index in 0...allWords.count - 1 {
        let word = allWords[index]
        if newSentence != "" {
            newSentence += " "
        }
        if index % 2 == 1 {
            let reverseWord = String(word.reversed())
            newSentence += reverseWord.removeVowels()
        } else {
            let subWord = String(word)
            newSentence += subWord.removeVowels()
            
        }
    }
    
    return newSentence
}

// remove the vowels
extension String {
    func removeVowels() -> String {
        var newString = self
        for i in ["a", "e", "i", "u", "o"] {
            newString = newString.replacingOccurrences(of: i, with: "")
        }
        return newString
    }
}

print(reverseWordsAlternate(sentence: string))

//fibbnacci
// 1, 1, 2,3,5, 8
func fibbonacci(of: Int) -> [Int] {
    
    var start = 1
    var next = 1
    
    var fibboSeq = [1, 1]
    
    for _ in 0...of {
        start = fibboSeq[fibboSeq.count - 2]
        next = fibboSeq.last!
        fibboSeq.append(start + next)
    }
    
    return fibboSeq
}

print (fibbonacci(of: 3))

//recursion
func fibRecursion(numStep: Int, first: Int, second: Int) -> [Int] {
    if numStep == 0 {
        return []
    }
    return [first + second] + fibRecursion(numStep: numStep - 1, first: second, second: first + second)
}

print ([0, 1] + fibRecursion(numStep: 5, first: 1, second: 1))


//wrapping arrays
let tracks = ["a", "b", "c", "d", "e"]

var selectedTrack = "d"

func selectTrack(_ tracks: [String], _ find: String) -> [String] {

    var newTracks = [String]()
    var priority = [String]()

    for track in tracks {
        // find the selectedTrack, and check if the newTracks array is > 0 append the remaining list
        if track == find || newTracks.count > 0 {
            newTracks.append(track)
        } else {
            // store the other list in a new storage
            priority.append(track)
        }
    }

    return newTracks + priority
}

print (selectTrack(tracks, selectedTrack))

func prefixTrack(arr: [String], find: String) {
    let index = arr.index { $0 == find }
    let originalTrack = arr.prefix(upTo: index!)
    let currentTrack = arr.suffix(from: index!)
    print (currentTrack + originalTrack)
}

prefixTrack(arr: tracks, find: "c")

//MARK: - High Order Function

//MAP
// [1, 2, 3, 4] -> [2, 4, 6, 8] multiply by 2
let elements = [1, 2, 3, 4]

let mapped = elements.map({ return $0 * 2 })
mapped

//FILTER
let filtered = elements.filter({ return $0 % 2 == 0 })
filtered

// REDUCE
let reduced = elements.reduce(0) { (sum, number) in return sum + number }
reduced






















