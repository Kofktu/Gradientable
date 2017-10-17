//
//  GradientableButton.swift
//  Gradientable
//
//  Created by kofktu on 2017. 10. 17..
//  Copyright © 2017년 Kofktu. All rights reserved.
//

import Foundation
import UIKit

open class GradientableButton: UIButton, Gradientable {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientable()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setupGradientable()
    }

    
}
