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
        
        gradientableView.set(options: GradientableOptions(colors: [.yellow, .cyan]))
        gradientableView.set(animation: GradientableAnimation(to: [.yellow, .red], duration: 5.0))
        
        let options = GradientableOptions(colors: [.red, .blue])
        gradientableButton.set(options: options)
        gradientableCustomView.set(options: options)
        
        perform(#selector(colorAnimation), with: nil, afterDelay: 2.0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientableButton.layer.cornerRadius = gradientableButton.frame.height / 2.0
        gradientableCustomView.layer.cornerRadius = gradientableCustomView.frame.height / 2.0
    }
    
    // MARK: - Private
    @objc func colorAnimation() {
        let animation = GradientableAnimation(to: [.blue, .yellow])
        gradientableButton.set(animation: animation)
        gradientableCustomView.set(animation: animation)
        
        perform(#selector(changeLocation), with: nil, afterDelay: 2.0)
    }
    
    @objc func changeLocation() {
        let options = GradientableOptions(locations: [0.2, 0.7])
        gradientableButton.set(options: options)
        gradientableCustomView.set(options: options)
        
        perform(#selector(changeDirection), with: nil, afterDelay: 2.0)
    }

    @objc func changeDirection() {
        let options = GradientableOptions(direction: .topLeftToBottomRight)
        gradientableButton.set(options: options)
        gradientableCustomView.set(options: options)
    }
}


class View: GradientableView {
}

class Button: GradientableButton {
}

class CustomView: UIView, Gradientable {
}
