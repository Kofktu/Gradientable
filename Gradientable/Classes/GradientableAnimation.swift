//
//  GradientableAnimation.swift
//  Gradientable
//
//  Created by kofktu on 2017. 10. 17..
//  Copyright © 2017년 Kofktu. All rights reserved.
//

import Foundation
import UIKit

public struct GradientableAnimation: GradientableAppliable {
    
    private struct Keys {
        static let keyPath = "colors"
        static let gradientableAnimation = "GradientableAnimation"
    }
    
    var from: [UIColor]?
    var to: [UIColor]
    var duration: TimeInterval = 0.4
    
    public init(to: [UIColor],
         duration: TimeInterval = 0.4,
         from: [UIColor]? = nil) {
        self.to = to
        self.from = from
        self.duration = duration
    }
    
    func apply(layer: CAGradientLayer?) {
        layer?.removeAnimation(forKey: Keys.gradientableAnimation)
        
        let animation = CABasicAnimation(keyPath: Keys.keyPath)
        let colorSet = to.map { $0.cgColor }
        let delegate = GradientableDelegate.shared
        delegate.onAnimationFinished = {
            layer?.colors = colorSet
        }
        animation.delegate = delegate
        animation.duration = duration
        animation.fromValue = from?.flatMap { $0.cgColor } ?? layer?.colors
        animation.toValue = colorSet
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        layer?.add(animation, forKey: Keys.gradientableAnimation)
    }
    
}

class GradientableDelegate: NSObject, CAAnimationDelegate {
    static let shared = GradientableDelegate()
    var onAnimationFinished: (() -> Void)?
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            onAnimationFinished?()
        }
    }
}
