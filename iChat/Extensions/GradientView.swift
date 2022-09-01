//
//  GradientView.swift
//  iChat
//
//  Created by Djinsolobzik on 24.08.2022.
//

import UIKit

class GradientView: UIView {
    
    //MARK: - Private Properties
    
    private let gradientLayer = CAGradientLayer()
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradientColor(startColor: startColor, endColor: endColor)
        }
    }
    
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradientColor(startColor: startColor, endColor: endColor)
        }
    }
    
    enum Point {
        case leading
        case topLeading
        case top
        case trailingTop
        case trailing
        case trailingBottom
        case bottom
        case leadingBottom
        case center
        
        var point: CGPoint {
            switch self{
                
            case .leading:
                return CGPoint(x: 0, y: 0.5)
            case .topLeading:
                return CGPoint(x: 0, y: 0)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .trailingTop:
                return CGPoint(x: 1, y: 0)
            case .trailing:
                return CGPoint(x: 1, y: 0.5)
            case .trailingBottom:
                return CGPoint(x: 1, y: 1)
            case .bottom:
                return CGPoint(x: 0.5, y: 1)
            case .leadingBottom:
                return CGPoint(x: 0, y: 1)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    init(from: Point, to: Point, startColor: UIColor?, endColor: UIColor?) {
        self.init()
        setupGradient(from: from, to: to, startColor: startColor, endColor: endColor)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient(from: .trailingTop, to: .leadingBottom, startColor: startColor, endColor: endColor)
    }
    
    //MARK: - Private Methods
    
    private func setupGradient(from: Point, to: Point, startColor: UIColor?, endColor: UIColor?) {
        self.layer.addSublayer(gradientLayer)
        setupGradientColor(startColor: startColor, endColor: endColor)
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
    }
    
    private func setupGradientColor(startColor: UIColor?, endColor: UIColor?) {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    
}
