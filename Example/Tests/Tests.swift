import UIKit
import XCTest
import Band

class Tests: XCTestCase {
    
    var states: [ViewState] = []
    struct Unstable: ViewState {
            var view: StateView = {
                return UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            }() as! StateView
        }
    override func setUp() {
        super.setUp()
        states = [Unstable()]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatViewStateAreEqual() {
        let viewState1 = Unstable()
        let viewState2 = Unstable()
        XCTAssertTrue(viewState1 == viewState2, "")
    }
}
