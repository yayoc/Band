
/// `ViewStatus` protocol represents an association between status and view.
/// the status property will be decided automatically as the struct name.
/// Need to implement an custom view for this protocol.


public protocol ViewState {
    var view: StateView { get }
    static var state: String { get }
    var state: String { get }
}

/// return whether the two view states are equl.
///
/// - parameter lhs: The left-hand side value to compare

/// - returns: `true` if the two value are equel, `false` otherwise.

public func == (lhs: ViewState, rhs: ViewState) -> Bool {
    return lhs.state == rhs.state
}

// MARK: - ViewStatus

extension ViewState {
    public static var state: String {
        get {
            return String(reflecting: type(of: self)).components(separatedBy: ".")[1]
        }
    }
    
    public var state: String {
        get {
            return String(reflecting: type(of: self)).components(separatedBy: ".")[1]
        }
    }
}

/// `StateView` class represents specific the view for View State protocol.
/// This class will be used to distinguish between UIView and StateView when removing the view from the superview.

open class StateView: UIView { }

// MARK: - StateView

public extension StateView {
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> StateView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? StateView
    }
}
