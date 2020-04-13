//
//  BehaviorRelayExtesion.swift
//  TestApp
//
//  Created by Kim Jong Hyun on 2020/04/12.
//  Copyright © 2020 Kim Jong Hyun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// RxのBehaviorRelay機能拡張
public extension BehaviorRelay where Element: RangeReplaceableCollection {
    // Elementの追加
    func insert(_ subElement: Element.Element, at index: Element.Index) {
        var newValue = value
        newValue.insert(subElement, at: index)
        accept(newValue)
    }

    // Elementの追加
    func insert(contentsOf newSubelements: Element, at index: Element.Index) {
        var newValue = value
        newValue.insert(contentsOf: newSubelements, at: index)
        accept(newValue)
    }

    // Elementの削除
    func remove(at index: Element.Index) {
        var newValue = value
        newValue.remove(at: index)
        accept(newValue)
    }
}
