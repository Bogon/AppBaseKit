//
//  DispatchQueue+OnceExtension.swift
//  perpetualCalendar
//
//  Created by mac on 2019/4/3.
//  Copyright © 2019 hellogeek.com. All rights reserved.
//

import Foundation

// stolen from Kingfisher: https://github.com/onevcat/Kingfisher/blob/master/Sources/ThreadHelper.swift

public func dispatch_async_safely_to_main_queue(_ block: @escaping ()->()) {
    dispatch_async_safely_to_queue(DispatchQueue.main, block)
}

// This methd will dispatch the `block` to a specified `queue`.
// If the `queue` is the main queue, and current thread is main thread, the block
// will be invoked immediately instead of being dispatched.
public func dispatch_async_safely_to_queue(_ queue: DispatchQueue, _ block: @escaping ()->()) {
    if queue === DispatchQueue.main && Thread.isMainThread {
        block()
    } else {
        queue.async {
            block()
        }
    }
}

/// Print log
public func printLog<T>(_ message: T,
                 file: String = #file,
                 method: String = #function,
                 line: Int = #line)
{
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}


// MARK: - 只执行一次
extension DispatchQueue {
    static var `default`: DispatchQueue { return DispatchQueue.global(qos: .`default`) }
    static var userInteractive: DispatchQueue { return DispatchQueue.global(qos: .userInteractive) }
    static var userInitiated: DispatchQueue { return DispatchQueue.global(qos: .userInitiated) }
    static var utility: DispatchQueue { return DispatchQueue.global(qos: .utility) }
    static var background: DispatchQueue { return DispatchQueue.global(qos: .background) }
    
    func after(_ delay: TimeInterval, execute closure: @escaping () -> Void) {
        asyncAfter(deadline: .now() + delay, execute: closure)
    }
    
    private static var _onceTracker = [String]()
    public class func once(_ token: String, block:()->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}
