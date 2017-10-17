//
//  Gradientable.swift
//  Gradientable
//
//  Created by kofktu on 2017. 10. 17..
//  Copyright © 2017년 Kofktu. All rights reserved.
//

import Foundation
import UIKit

protocol GradientableAppliable {
    func apply(layer: CAGradientLayer?)
}

public protocol Gradientable {}
public extension Gradientable where Self: UIView {
    
    public func setupGradientable() {
        UIView.classInit
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = bounds
        layer.addSublayer(gradientLayer!)
    }
    
    public func set(options: GradientableOptions) {
        guard let _ = gradientLayer else {
            fatalError("setupGradientable() is required.")
        }
        
        options.apply(layer: gradientLayer)
    }
    
    public func set(animation: GradientableAnimation) {
        guard let _ = gradientLayer else {
            fatalError("setupGradientable() is required.")
        }
        
        animation.apply(layer: gradientLayer)
    }
    
}

extension UIView {
    
    struct AssociatedKeys {
        static var gradientLayer = "gradientLayer"
    }
    
    var gradientLayer: CAGradientLayer? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.gradientLayer) as? CAGradientLayer }
        set { objc_setAssociatedObject(self, &AssociatedKeys.gradientLayer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
}

