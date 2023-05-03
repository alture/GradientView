//
//  GradientView.swift
//  Gradient
//
//  Created by Alisher on 03.05.2023.
//

import UIKit

final class GradientView: UIView {
    private var startColor: UIColor = .systemBlue {
        didSet {
            setNeedsLayout()
        }
    }
    
    private var endColor: UIColor = .systemRed {
        didSet {
            setNeedsLayout()
        }
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 15
        view.clipsToBounds = view.layer.cornerRadius > 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setShadow()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setGradientColor(startColor, endColor)
    }
    
    private func setupView() {
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setGradientColor(_ startColor: UIColor, _ endColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0, 0.6, 1]
        gradient.frame = bounds
        
        contentView.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .init(width: 0, height: 10)
    }
}
