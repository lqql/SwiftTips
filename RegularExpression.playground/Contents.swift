//: Playground - noun: a place where people can play

import Foundation
struct RegexHelper {
    let regex:NSRegularExpression?
    init(_ pattern:String) throws {
        regex = try NSRegularExpression(pattern: pattern, options: .CaseInsensitive)
    }
    func match(input:String)->Bool{
        if let matches = regex?.matchesInString(input,options:NSMatchingOptions(),range: NSMakeRange(0,input.characters.count)){
            return matches.count > 0
        }else{
            return false
        }
    }
}
let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
let matcher = try RegexHelper(mailPattern)
let maybeMailAddress = "lqql@mail.google.com"
if matcher.match(maybeMailAddress){
    print("邮箱地址正确")
}
infix operator =^ {
    associativity none
    precedence 130
}
func =^(lhs:String,rhs:String)throws ->Bool {
    return try RegexHelper(rhs).match(lhs)
}
if try "lqql@mail.google.com" =^ "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"{
    print("it's an email address")
}



