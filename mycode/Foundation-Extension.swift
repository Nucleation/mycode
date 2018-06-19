//
//  Foundation-Extension.swift
//  mycode
//
//  Created by zhishen－mac on 2018/6/19.
//  Copyright © 2018年 zhishen－mac. All rights reserved.
//

import Foundation
//MARK: Array
//数组添加removeObjectInArray方法
extension Array where Element: Equatable {
    mutating func removeObject(object:Element){
        if let index = self.index(of: object) {
            self.remove(at: index)
        }
    }
    mutating func removeObjectInArray(array:[Element]){
        for object in array{
            self.removeObject(object: object)
        }
    }
}
//MARK: Int
extension Int
{
    func hexedString() -> String
    {
        return NSString(format:"%02x", self) as String
    }
}
//MARK: NSData
extension NSData
{
    func hexedString() -> String
    {
        var string = String()
        let unsafePointer = bytes.assumingMemoryBound(to: UInt8.self)
        for i in UnsafeBufferPointer<UInt8>(start:unsafePointer, count: length)
        {
            string += Int(i).hexedString()
        }
        return string
    }
    func MD5() -> NSData
    {
        let result = NSMutableData(length: Int(CC_MD5_DIGEST_LENGTH))!
        let unsafePointer = result.mutableBytes.assumingMemoryBound(to: UInt8.self)
        CC_MD5(bytes, CC_LONG(length), UnsafeMutablePointer<UInt8>(unsafePointer))
        return NSData(data: result as Data)
    }
}
