# WrongTransitionCoordinator_Bug
A sample project for an iOS 11 UIKit bug

Important: this bug only occurs on iOS 11 devices and when the project is build with Xcode 8

Reproduction:
1. Push the button
2. Pop the ViewController with left edge swipe gesture
3. Push the button again

Sometimes it is necessary to do it multipe times
