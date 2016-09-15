//
//  Loading.swift
//  Band
//
//  Created by yayoc on 9/16/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Band

struct Loading: ViewState {
    public var view: StateView = {
        return LoadingView.loadFromNibNamed(nibNamed: "LoadingView")!
    }()
}
