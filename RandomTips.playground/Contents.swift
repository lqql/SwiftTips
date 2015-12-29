//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
func randomInRange(range:Range<Int>)-> Int{
    let count = UInt32(range.endIndex - range.startIndex)
    return Int(arc4random_uniform(count))+range.startIndex
}
print(randomInRange(1...6))
