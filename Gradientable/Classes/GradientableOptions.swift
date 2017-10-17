//
//  GradientableOptions.swift
//  Gradientable
//
//  Created by kofktu on 2017. 10. 17..
//  Copyright © 2017년 Kofktu. All rights reserved.
//

import Foundation
import UIKit

public enum GradientableOptionsDirection {
    case top
    case bottom
    case left
    case right
    case topLeftToBottomRight
    case topRightToBottomLeft
    case bottomLeftToTopRight
    case bottomRightToTopLeft
    case custom(CGPoint, CGPoint) // startPoint, endPoint (0.0 ~ 1.0)
}

public struct GradientableOptions: GradientableAppliable {
    
    var colors: [UIColor]?
    var locations: [NSNumber]?
    var direction: GradientableOptionsDirection?
    
    public init(colors: [UIColor]? = nil,
                locations: [NSNumber]? = nil,
                direction: GradientableOptionsDirection? = nil) {
        self.colors = colors
        self.locations = locations
        self.direction = direction
    }
    
    func apply(layer: CAGradientLayer?) {
        layer?.colors = colors?.flatMap { $0.cgColor } ?? layer?.colors
        layer?.locations = locations ?? layer?.locations
        applyDirection(layer: layer)
    }

    // MARK: - Private
    private func applyDirection(layer: CAGradientLayer?) {
        guard let direction = direction else {
            return
        }
        
        switch direction {
        case .top:
            layer?.startPoint = CGPoint(x: 0.5, y: 1.0)
            layer?.endPoint = CGPoint(x: 0.5, y: 0.0)
        case .bottom:
            layer?.startPoint = CGPoint(x: 0.5, y: 0.0)
            layer?.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .left:
            layer?.startPoint = CGPoint(x: 1.0, y: 0.5)
            layer?.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .right:
            layer?.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer?.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .topLeftToBottomRight:
            layer?.startPoint = CGPoint(x: 0.0, y: 0.0)
            layer?.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .topRightToBottomLeft:
            layer?.startPoint = CGPoint(x: 1.0, y: 0.0)
            layer?.endPoint = CGPoint(x: 0.0, y: 1.0)
        case .bottomLeftToTopRight:
            layer?.startPoint = CGPoint(x: 0.0, y: 1.0)
            layer?.endPoint = CGPoint(x: 1.0, y: 0.0)
        case .bottomRightToTopLeft:
            layer?.startPoint = CGPoint(x: 1.0, y: 1.0)
            layer?.endPoint = CGPoint(x: 0.0, y: 0.0)
        case .custom(let startPoint, let endPoint):
            layer?.startPoint = startPoint
            layer?.endPoint = endPoint
        }
    }
    
}
