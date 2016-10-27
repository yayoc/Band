//
//  BandViewController.swift
//  Pods
//
//  Created by yayoc on 9/16/16.
//
//

import Foundation

/// `BandViewControllerDelegate` protocol represents managing views.
/// Need to implement follwoing items.
/// var statuses: [ViewStatus]

public protocol BandViewControllerDelegate: class {
    var states: [ViewState] { get }
    subscript(state: String) -> ViewState? { get }
}

// MARK: - BandViewControllerDelegate

extension BandViewControllerDelegate {
    
    // Access the manager for getting view associated with the status as an argument.
    public subscript(state: String) -> ViewState? {
        get {
            guard let state = states.filter({ $0.state == state }).first else {
                return nil
            }
            return state
        }
    }
}

// MARK: - BandViewControllerDelegate where Self: UIViewController

public extension BandViewControllerDelegate where Self: UIViewController {
    
    /// This method will show the view which is associated with the state specified by the parameter.
    /// New view will adjust the screen size by using autresizingMask.
    /// Before showing new view, this method will remove all of StateView from superview.
    
    func show(_ state: String) {
        self.hideAll()
        if let newState: ViewState = self[state] {
            let newView = newState.view
            newView.translatesAutoresizingMaskIntoConstraints = true
            self.view.addSubview(newView)
            newView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
            newView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleRightMargin, UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin]
        }
    }
   
    /// This method will remove all of StateView which is stacked on superview.
    
    func hideAll() {
        self.view.subviews.filter { $0 is StateView }.forEach({ $0.removeFromSuperview() })
    }
    
    /// This method will update the views which has been registerd all of states when *when* block return true.
    
    func updateViewIfNeeded() {
        self.hideAll()
        for state in self.states {
            guard let when = state.when else {
               continue
            }
            if (when()) {
                show(state.state)
                break
            }
        }
    }
    
    /// This method will update the views if *when* block of the ViewState return true.
    
    func updateViewIfNeeded(_ states: [String]) {
        self.hideAll()
        for stateString in states {
            if let state: ViewState = self[stateString] {
                guard let when = state.when else {
                    continue
                }
                if (when()) {
                    show(state.state)
                    break
                }
            }
        }
    }
}



