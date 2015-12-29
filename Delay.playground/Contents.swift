//: Playground - noun: a place where people can play

import Foundation
typealias Task=(cancle:Bool)->()
func delay(time:NSTimeInterval,task:()->())->Task?{
    func dispatch_later(block:()->()){
        dispatch_after(dispatch_time (DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC))), dispatch_get_main_queue(),block)
    }
    var closure:dispatch_block_t? = task
    var result:Task?
    let delaydClosure:Task={
        cancel in
        if let internalClosure = closure{
            if(cancel == false){
                dispatch_async(dispatch_get_main_queue(), internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    result = delaydClosure
    dispatch_later { () -> () in
        if let delaydClosure = result{
            delaydClosure(cancle: false)
        }
    }
    return result
}
func cancel(task:Task?){
    task?(cancle: true)
}
delay(2, task: {print("2 second print")})