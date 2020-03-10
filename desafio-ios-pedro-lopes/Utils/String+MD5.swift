//
//  String+MD5.swift
//  desafio-ios-pedro-lopes
//
//  Created by Pedro Lopes on 09/03/20.
//  Copyright © 2020 Pedro Lopes. All rights reserved.
//
import Foundation
import CommonCrypto
 
extension String{
    
    func md5Hash () -> String {
        if let strData = self.data(using: String.Encoding.utf8) {
            var digest = [UInt8](repeating: 0, count:Int(CC_MD5_DIGEST_LENGTH))
     
            _ = strData.withUnsafeBytes {
                CC_MD5($0.baseAddress, UInt32(strData.count), &digest)
            }
            var md5String = ""

            for byte in digest {
                md5String += String(format:"%02x", UInt8(byte))
            }
            return md5String
        }
        return ""
    }
}
