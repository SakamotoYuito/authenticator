//
//  Totp.swift
//  Authentication
//
//  Created by 坂本唯斗 on 2023/02/19.
//

//import Base32
//import CryptoSwift
//
//// Base32に変換
//guard let key = base32Decode("XXXXXXXXXXXXXXXX") else { return }
//
//// 1. 現在時刻からカウンターを生成
//let unixTime = Int(Date().timeIntervalSince1970)
//let timeSteps = unixTime / 30
//// 8byteのデータに変換
//let counter = withUnsafeBytes(of: timeSteps.bigEndian, Array.init)
//
//// 2. HMAC-SHA-1でハッシュを生成
//let hash = try! HMAC(key: key, variant: .sha1).authenticate(counter)
//
//// 3. hashの下位4bitを整数に変換
//let offset = Int(hash.last! & 0b00001111)
//
//// 4. hashのoffset番目のバイトから4バイト取得
//var slicedHash = Array(hash[offset ... offset + 3])
//
//// 5. 4byteの上位1bitを取り除いたデータを数値にする
//slicedHash[0] = slicedHash[0] & 0b01111111
//let num = Data(slicedHash).withUnsafeBytes { $0.load(as: UInt32.self).bigEndian }
//
//// 6. 下位6桁を取得
//let totp = String(num).suffix(6)
//
//print(totp)
