//
//  NSObjectProtocolExtension.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/12.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import Foundation

// NSObjectProtocolの拡張
extension NSObjectProtocol {

    // クラス名を返す変数"className"を返す
    static var className: String {
        return String(describing: self)
    }
}
