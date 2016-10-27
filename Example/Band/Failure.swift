//
//  Failure.swift
//  Band
//
//  Created by yayoc on 10/26/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Band

struct Failure: ViewState {
    var view: StateView {
        get {
            let failureView = FailureView.loadFromNibNamed(nibNamed: "FailureView") as! FailureView
            if let model = model {
                failureView.viewModel = FailureViewModel(message: model.localizedDescription)
            }
            return failureView
        }
    }
    public var when: (() -> Bool)?
    public var model: Error? = nil
}

