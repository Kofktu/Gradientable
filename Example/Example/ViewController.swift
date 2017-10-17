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

    @IBOutlet weak var gradientableView: GradientableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gradientableView.set(colors: [.red, .blue])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.gradientableView.set(colors: [.blue, .yellow], animated: true)
        }
    }

}


class GradientableView: UIView, Gradientable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGradientable()
    }
    
}
