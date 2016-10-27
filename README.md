# Band

Band enables UIViewController to present placeholder views based on the state.

[![CI Status](http://img.shields.io/travis/yayoc/Band.svg?style=flat)](https://travis-ci.org/yayoc/Band)
[![Version](https://img.shields.io/cocoapods/v/Band.svg?style=flat)](http://cocoapods.org/pods/Band)
[![License](https://img.shields.io/cocoapods/l/Band.svg?style=flat)](http://cocoapods.org/pods/Band)
[![Platform](https://img.shields.io/cocoapods/p/Band.svg?style=flat)](http://cocoapods.org/pods/Band)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Swift 3.0

## Installation

Band is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Band"
```

## Usage

adopt BandViewControllerDelegate protcol to your ViewController.

```
class ViewController: UIViewController, BandViewControllerDelegate {
    // ...
}
```

register *ViewState* you need to show on the ViewController into *states* property. 

```
lazy var states: [ViewState] = {
    return [Loading(), Empty(), Unstable()]
}()
```

Show Specific ViewState by calling *show* method.

```
self.show(Loading.state)
```

Specific the condition to present the view associated with the state.

```
lazy var states: [ViewState] = {
    let empty = Empty(when: { () -> Bool in
        return self.isEmpty()
    })
    let unstable = Unstable(when: { () -> Bool in
        return !Reachability.isConnectedToNetwork()
    })
    return [Loading(), empty, unstable]
}()

```

Present a placeholder view if the state is satisfied the condition specificed at the *when* block.

```
self.updateViewIfNeeded([Unstable.state, Empty.state, Failure.state])
```

## Author

yayoc, n.yayoshi+github@gmail.com

## License

Band is available under the MIT license. See the LICENSE file for more info.
