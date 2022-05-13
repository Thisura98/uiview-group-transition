//
//  UIView+Transition.swift
//  transitiontest
//
//  Created by Thisura Dodangoda on 2022-05-13.
//

import Foundation
import UIKit

fileprivate class AnimDelegate: NSObject, CAAnimationDelegate{
    private var completion: ((Bool) -> Void)!
    private var didFire: Bool = false
    
    init(_ completion: ((Bool) -> Void)?){
        self.completion = completion
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard !didFire else { return }
        didFire = true
        print("running animation delegate")
        completion?(flag)
    }
}

extension UIView{
    
    enum GroupTransitionCurve: Int{
        case linear, easeIn, easeOut, easeInOut
        
        fileprivate func asTimingFunction() -> CAMediaTimingFunction{
            let names: [CAMediaTimingFunctionName] = [
                .linear,
                .easeIn,
                .easeOut,
                .easeInEaseOut,
            ]
            
            return CAMediaTimingFunction(name: names[self.rawValue])
        }
    }
    
    class func groupTransition(
        with views: [UIView],
        duration: TimeInterval,
        delay: TimeInterval = 0.0,
        type: CATransitionType = .fade,
        subtype: CATransitionSubtype? = nil,
        timing: GroupTransitionCurve = .easeInOut,
        animations: (() -> Void)?,
        completion: ((Bool) -> Void)? = nil
    ){
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            let transition = CATransition()
            transition.duration = duration
            transition.delegate = AnimDelegate(completion)
            transition.type = type
            transition.subtype = subtype
            transition.timingFunction = timing.asTimingFunction()
            
            for v in views{
                v.layer.add(transition, forKey: "transition")
            }
            
            animations?()
        }
    }
}
