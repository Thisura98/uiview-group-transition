# UIView Group Transitions

<img src="https://raw.githubusercontent.com/Thisura98/uiview-group-transition/main/resources/demo.gif" width="300" alt="Demo GIF">

### Demo

```swift
UIView.groupTransition(
    with: [label, aButton, ...],    // Add all your views here
    duration: 0.3,
    delay: 0.0,
    type: .fade,                    // .fade, .moveIn, .push, .reveal
    subtype: nil,
    timing: .easeInOut              // .linear, .easeIn, .easeOut, .easeInOut
) {
    // Your animations go here...
    self.label.text = "Hello World"
    self.aButton.setImage(UIImage(named: "cat"), for: .normal)
} completion: { completed in
    print("Animation completed!")
}
```

The `groupTransition` method allows you to add the same transition animation to multiple views specified in an Array. You don't have to write multiple `UIView.transition` blocks instead.

### How to use

1. Clone project
```
git clone https://github.com/Thisura98/uiview-group-transition.git
```

2. Open uiview-group-transition/transitiontest

3. Copy `UIView+Transition.swift` file in to your project

4. Use as a `UIView` extension (see demo above)