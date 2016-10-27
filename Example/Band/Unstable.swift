//
//  Unstable.swift
//  Band
//
//  Created by yayoc on 9/16/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Band

struct Unstable: ViewState {
    let view: StateView = {
        return UnstableView.loadFromNibNamed(nibNamed: "UnstableView")!
    }()
    public var when: (() -> Bool)?
}

