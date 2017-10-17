//
//  Gradientable.swift
//  Gradientable
//
//  Created by kofktu on 2017. 10. 17..
//  Copyright © 2017년 Kofktu. All rights reserved.
//

import Foundation
import UIKit

public struct GradientableOptions {
    
    var colors: [UIColor]?
    
    
}

public protocol Gradientable {}
public extension Gradientable where Self: UIView {
    
    public func setupGradientable() {
        UIView.classInit
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = bounds
        layer.addSublayer(gradientLayer!)
    }
    
    public func set(colors: [UIColor], animated: Bool = false, duration: TimeInterval = 2.0) {
        guard let _ = gradientLayer else {
            fatalError("setupGradientable() is required.")
        }
        
        let colorSet = colors.map { $0.cgColor }
        
        if animated {
            let animation = CABasicAnimation(keyPath: "colors")
            
            let delegate = GradientableDelegate.shared
            delegate.onAnimationFinished = { [weak self] in
                self?.gradientLayer?.colors = colorSet
            }
            
            animation.delegate = delegate
            animation.duration = duration
            animation.toValue = colorSet
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false
            gradientLayer?.add(animation, forKey: nil)
        } else {
            gradientLayer?.colors = colors.map { $0.cgColor }
        }
        
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

extension UIView {
    
    struct AssociatedKeys {
        static var gradientLayer = "gradientLayer"
        static var gradientableDelegate = "gradientableDelegate"
    }
    
    var gradientLayer: CAGradientLayer? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.gradientLayer) as? CAGradientLayer }
        set { objc_setAssociatedObject(self, &AssociatedKeys.gradientLayer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
}

