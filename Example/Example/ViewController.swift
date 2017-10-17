//
//  ViewController.swift
//  Example
//
//  Created by kofktu on 2017. 10. 17..
//  Copyright © 2017년 Kofktu. All rights reserved.
//

import UIKit
import Gradientable

class ViewController: UIViewController {

    @IBOutlet weak var gradientableView: View!
    @IBOutlet weak var gradientableButton: Button!
    @IBOutlet weak var gradientableCustomView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let options = GradientableOptions(colors: [.red, .blue])
        gradientableView.set(options: options)
        gradientableButton.set(options: options)
        gradientableCustomView.set(options: options)
        
        perform(#selector(colorAnimation), with: nil, afterDelay: 2.0)
    }
    
    // MARK: - Private
    @objc func colorAnimation() {
        let animation = GradientableAnimation(to: [.blue, .yellow])
        gradientableView.set(animation: animation)
        gradientableButton.set(animation: animation)
        gradientableCustomView.set(animation: animation)
        
        perform(#selector(changeLocation), with: nil, afterDelay: 2.0)
    }
    
    @objc func changeLocation() {
        let options = GradientableOptions(locations: [0.2, 0.7])
        gradientableView.set(options: options)
        gradientableButton.set(options: options)
        gradientableCustomView.set(options: options)
        
        perform(#selector(changeDirection), with: nil, afterDelay: 2.0)
    }

    @objc func changeDirection() {
        let options = GradientableOptions(direction: .topLeftToBottomRight)
        gradientableView.set(options: options)
        gradientableButton.set(options: options)
        gradientableCustomView.set(options: options)
    }
}


class View: GradientableView {
}

class Button: GradientableButton {
}

class CustomView: UIView, Gradientable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGradientable()
    }
    
}
