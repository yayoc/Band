//
//  Empty.swift
//  Band
//
//  Created by yayoc on 9/16/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Band

struct Empty: ViewState {
    let view: StateView = {
        return UnstableView.loadFromNibNamed(nibNamed: "EmptyView")!
    }()
    var when: (() -> Bool)?
}
