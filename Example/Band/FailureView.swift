//
//  FailureView.swift
//  Band
//
//  Created by yayoc on 10/26/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Band

class FailureView: StateView, HasViewModel {
    typealias T = FailureViewModel
    var viewModel: FailureViewModel? {
        didSet {
            messageLabel.text = viewModel?.message
        }
    }
    @IBOutlet weak var messageLabel: UILabel!
}


struct FailureViewModel {
    let message: String
}
