//
//  ViewController.swift
//  Gradient
//
//  Created by Alisher on 03.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var gradientView: GradientView = {
        let view = GradientView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gradientView)
        
        NSLayoutConstraint.activate([
            gradientView.heightAnchor.constraint(equalToConstant: 120),
            gradientView.widthAnchor.constraint(equalToConstant: 120),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.backgroundColor = .white
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        gradientView.updateGradient()
    }
}

