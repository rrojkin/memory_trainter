//
//  NeumorphDesign.swift
//  MemoryTrainer
//
//  Created by Antony Razhnou on 12/9/23.
//

import Foundation
import UIKit

class NeumView: UIView {
    
    var cornerRadius: CGFloat = 15
    
    lazy var darkShadow: CALayer = {
        let darkShadow = CALayer()
        darkShadow.shadowRadius = 10
        darkShadow.shadowOpacity = 1
        darkShadow.shadowOffset = CGSize(width: 10, height: 10)
        darkShadow.cornerRadius = cornerRadius
        return darkShadow
    }()
    
    lazy var lightShadow: CALayer = {
        let lightShadow = CALayer()
        lightShadow.shadowRadius = 10
        lightShadow.shadowOpacity = 1
        lightShadow.shadowOffset = CGSize(width: -5, height: -5)
        lightShadow.cornerRadius = cornerRadius
        return lightShadow
    }()
    
    lazy var darkInnerShadow: CALayer = {
        let darkInnerShadow = CALayer()
        darkInnerShadow.cornerRadius = cornerRadius
        darkInnerShadow.shadowOffset = CGSize(width: 5, height: 5)
        darkInnerShadow.shadowOpacity = 0.2
        darkInnerShadow.shadowRadius = 3
        darkInnerShadow.masksToBounds = true
        return darkInnerShadow
    }()
    
    lazy var lightInnerShadow: CALayer = {
        let lightInnerShadow = CALayer()
        lightInnerShadow.cornerRadius = cornerRadius
        lightInnerShadow.shadowOffset = CGSize(width: -5, height: -5)
        lightInnerShadow.shadowOpacity = 0.2
        lightInnerShadow.shadowRadius = 3
        lightInnerShadow.masksToBounds = true
        return lightInnerShadow
    }()
    
    required init(corner: CGFloat) {
        super.init(frame: .zero)
        
        self.cornerRadius = corner
        self.translatesAutoresizingMaskIntoConstraints = false
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.insertSublayer(darkShadow, at: 0)
        self.layer.insertSublayer(lightShadow, at: 0)
        
        self.layer.addSublayer(darkInnerShadow)
        self.layer.addSublayer(lightInnerShadow)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor(named: "BackgroundColor")
        
        darkShadow.frame = self.bounds
        darkShadow.backgroundColor = UIColor(named: "BackgroundColor")?.cgColor
        darkShadow.shadowColor = UIColor(named: "DarkShadow")?.withAlphaComponent(0.5).cgColor
        
        lightShadow.frame = self.bounds
        lightShadow.backgroundColor = UIColor(named: "BackgroundColor")?.cgColor
        lightShadow.shadowColor = UIColor(named: "LightShadow")?.withAlphaComponent(0.9).cgColor
        
        let path = UIBezierPath(roundedRect: bounds.insetBy(dx: -3, dy: -3), cornerRadius: cornerRadius)
        let cutout = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).reversing()
        path.append(cutout)
        
        darkInnerShadow.frame = self.bounds
        darkInnerShadow.shadowColor = UIColor(named: "DarkShadow")?.cgColor
        darkInnerShadow.shadowPath = path.cgPath
        
        lightInnerShadow.frame = self.bounds
        lightInnerShadow.shadowColor = UIColor(named: "LightShadow")?.cgColor
        lightInnerShadow.shadowPath = path.cgPath
    }
}

class NeumInnterView: UIView {
    var cornerRadius: CGFloat = 15 {
        didSet {
            layoutSubviews()
        }
    }
    
    lazy var darkShadow: CALayer = {
        let darkShadow = CALayer()
        darkShadow.shadowRadius = 10
        darkShadow.shadowOpacity = 1
        darkShadow.shadowOffset = CGSize(width: 10, height: 10)
        darkShadow.cornerRadius = cornerRadius
        return darkShadow
    }()
    
    lazy var lightShadow: CALayer = {
        let lightShadow = CALayer()
        lightShadow.shadowRadius = 10
        lightShadow.shadowOpacity = 1
        lightShadow.shadowOffset = CGSize(width: -5, height: -5)
        lightShadow.cornerRadius = cornerRadius
        return lightShadow
    }()
    
    lazy var darkInnerShadow: CALayer = {
        let darkShadow = CALayer()
        darkShadow.cornerRadius = cornerRadius
        darkShadow.shadowOffset = CGSize(width: 5, height: 5)
        darkShadow.shadowOpacity = 1
        darkShadow.shadowRadius = 3
        darkShadow.masksToBounds = true
        return darkShadow
    }()
    
    lazy var lightInnerShadow: CALayer = {
        let lightShadow = CALayer()
        lightShadow.cornerRadius = cornerRadius
        lightShadow.shadowOffset = CGSize(width: -5, height: -5)
        lightShadow.shadowOpacity = 1
        lightShadow.shadowRadius = 3
        lightShadow.masksToBounds = true
        return lightShadow
    }()
    
    required init(corner: CGFloat) {
        super.init(frame: .zero)
        
        self.cornerRadius = corner
        self.translatesAutoresizingMaskIntoConstraints = false
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.addSublayer(darkInnerShadow)
        self.layer.addSublayer(lightInnerShadow)
        
        self.layer.insertSublayer(darkShadow, at: 0)
        self.layer.insertSublayer(lightShadow, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor(named: "BackgroundColor")
        
        darkShadow.frame = self.bounds
        darkShadow.backgroundColor = UIColor(named: "BackgroundColor")?.cgColor
        darkShadow.shadowColor = UIColor(named: "DarkShadow")?.withAlphaComponent(0.3).cgColor
        
        lightShadow.frame = self.bounds
        lightShadow.backgroundColor = UIColor(named: "BackgroundColor")?.cgColor
        lightShadow.shadowColor = UIColor(named: "LightShadow")?.withAlphaComponent(0.5).cgColor
        
        let path = UIBezierPath(roundedRect: bounds.insetBy(dx: -3, dy: -3), cornerRadius: cornerRadius)
        let cutout = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).reversing()
        path.append(cutout)
        
        darkInnerShadow.frame = self.bounds
        darkInnerShadow.shadowColor = UIColor(named: "DarkShadow")?.cgColor
        darkInnerShadow.shadowPath = path.cgPath
        
        lightInnerShadow.frame = self.bounds
        lightInnerShadow.shadowColor = UIColor(named: "LightShadow")?.cgColor
        lightInnerShadow.shadowPath = path.cgPath
    }
}

class NeumButton: UIButton {
    
    var cornerRadius: CGFloat = 15
    
    var pressState: buttonState = .released {
        didSet {
            changeState(to: pressState)
        }
    }
    
    var shouldBeAnimated: Bool = true
    
    lazy var neumophicView: NeumView = {
        let neumophicView = NeumView(corner: cornerRadius)
        neumophicView.isUserInteractionEnabled = false
        neumophicView.backgroundColor = .clear
        neumophicView.layer.zPosition = -1
        return neumophicView
    }()
    
    lazy var neumophicInnerView: NeumInnterView = {
        let neumophicInnerView = NeumInnterView(corner: cornerRadius)
        neumophicInnerView.isUserInteractionEnabled = false
        neumophicInnerView.backgroundColor = .clear
        neumophicInnerView.layer.zPosition = -1
        return neumophicInnerView
    }()
    
    required init(corner: CGFloat) {
        super.init(frame: .zero)
        
        self.cornerRadius = corner
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(named: "BackgroundColor")
        
        addSubview(neumophicInnerView)
        neumophicInnerView.fillSuperView()
        
        addSubview(neumophicView)
        neumophicView.fillSuperView()
    }
    
    func changeState(to: buttonState) {
        switch to {
        case .pressed:
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: .curveEaseInOut) {
                self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
                self.neumophicView.alpha = 0
                self.neumophicInnerView.alpha = 1
            }
        case .released:
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: .curveEaseInOut) {
                self.transform = .identity
                self.neumophicView.alpha = 1
                self.neumophicInnerView.alpha = 0
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if !shouldBeAnimated { return }
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: .curveEaseInOut) {
                self.neumophicView.alpha = self.isHighlighted ? 0 : 1
                self.neumophicInnerView.alpha = !self.isHighlighted ? 0 : 1
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.98, y: 0.98) : .identity
            }
        }
    }
}

enum buttonState {
    case pressed
    case released
}

//class TestNeumButton: UIButton {
//    var cornerRadius: CGFloat = 15
//
//    lazy var darkShadow: CAShapeLayer = {
//        let darkShadow = CAShapeLayer()
//        darkShadow.shadowRadius = 10
//        darkShadow.shadowOpacity = 1
//        darkShadow.shadowOffset = CGSize(width: 10, height: 10)
//        darkShadow.cornerRadius = cornerRadius
//        return darkShadow
//    }()
//
//    lazy var lightShadow: CAShapeLayer = {
//        let lightShadow = CAShapeLayer()
//        lightShadow.shadowRadius = 10
//        lightShadow.shadowOpacity = 1
//        lightShadow.shadowOffset = CGSize(width: -5, height: -5)
//        lightShadow.cornerRadius = cornerRadius
//        return lightShadow
//    }()
//
//    lazy var darkInnerShadow: CALayer = {
//        let darkInnerShadow = CALayer()
//        darkInnerShadow.cornerRadius = cornerRadius
//        darkInnerShadow.shadowOffset = CGSize(width: 5, height: 5)
//        darkInnerShadow.shadowOpacity = 0.2
//        darkInnerShadow.shadowRadius = 3
//        darkInnerShadow.masksToBounds = true
//        return darkInnerShadow
//    }()
//
//    lazy var lightInnerShadow: CALayer = {
//        let lightInnerShadow = CALayer()
//        lightInnerShadow.cornerRadius = cornerRadius
//        lightInnerShadow.shadowOffset = CGSize(width: -5, height: -5)
//        lightInnerShadow.shadowOpacity = 0.2
//        lightInnerShadow.shadowRadius = 3
//        lightInnerShadow.masksToBounds = true
//        return lightInnerShadow
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupView() {
//        self.layer.zPosition = 1
//
//        self.layer.cornerRadius = cornerRadius
//        self.layer.addSublayer(darkShadow)
//        self.layer.insertSublayer(lightShadow, at: 0)
//
//        self.layer.addSublayer(darkInnerShadow)
//        self.layer.addSublayer(lightInnerShadow)
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        self.backgroundColor = UIColor(named: "BackgroundColor")
//
//        darkShadow.frame = self.bounds
//        darkShadow.fillColor = UIColor.clear.cgColor
//        darkShadow.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//        darkShadow.shadowColor = UIColor(named: "DarkShadow")?.withAlphaComponent(1).cgColor
//        darkShadow.shadowPath = darkShadow.path
//        darkShadow.zPosition = -1
//
//        lightShadow.frame = self.bounds
//        lightShadow.fillColor = UIColor.clear.cgColor
//        lightShadow.shadowColor = UIColor(named: "LightShadow")?.withAlphaComponent(0.9).cgColor
//
//        let path = UIBezierPath(roundedRect: bounds.insetBy(dx: -3, dy: -3), cornerRadius: cornerRadius)
//        let cutout = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).reversing()
//        path.append(cutout)
//
//        darkInnerShadow.frame = self.bounds
//        darkInnerShadow.shadowColor = UIColor(named: "DarkShadow")?.cgColor
//        darkInnerShadow.shadowPath = path.cgPath
//
//        lightInnerShadow.frame = self.bounds
//        lightInnerShadow.shadowColor = UIColor(named: "LightShadow")?.cgColor
//        lightInnerShadow.shadowPath = path.cgPath
//    }
//
//    override var isHighlighted: Bool {
//        didSet {
//            if isHighlighted {
//                    darkShadow.shadowRadius = 10
//                    darkShadow.shadowOpacity = 1
//                    darkShadow.shadowOffset = CGSize(width: 10, height: 10)
//                    darkShadow.cornerRadius = cornerRadius
//
//                    lightShadow.shadowRadius = 10
//                    lightShadow.shadowOpacity = 1
//                    lightShadow.shadowOffset = CGSize(width: -5, height: -5)
//                    lightShadow.cornerRadius = cornerRadius
//
//                    darkInnerShadow.cornerRadius = cornerRadius
//                    darkInnerShadow.shadowOffset = CGSize(width: 5, height: 5)
//                    darkInnerShadow.shadowOpacity = 1
//                    darkInnerShadow.shadowRadius = 3
//                    darkInnerShadow.masksToBounds = true
//
//                    lightInnerShadow.cornerRadius = cornerRadius
//                    lightInnerShadow.shadowOffset = CGSize(width: -5, height: -5)
//                    lightInnerShadow.shadowOpacity = 1
//                    lightInnerShadow.shadowRadius = 3
//                    lightInnerShadow.masksToBounds = true
//            } else {
//                    darkShadow.shadowRadius = 10
//                    darkShadow.shadowOpacity = 1
//                    darkShadow.shadowOffset = CGSize(width: 10, height: 10)
//                    darkShadow.cornerRadius = cornerRadius
//
//                    lightShadow.shadowRadius = 10
//                    lightShadow.shadowOpacity = 1
//                    lightShadow.shadowOffset = CGSize(width: -5, height: -5)
//                    lightShadow.cornerRadius = cornerRadius
//
//                    darkInnerShadow.cornerRadius = cornerRadius
//                    darkInnerShadow.shadowOffset = CGSize(width: 5, height: 5)
//                    darkInnerShadow.shadowOpacity = 0.2
//                    darkInnerShadow.shadowRadius = 3
//                    darkInnerShadow.masksToBounds = true
//
//                    lightInnerShadow.cornerRadius = cornerRadius
//                    lightInnerShadow.shadowOffset = CGSize(width: -5, height: -5)
//                    lightInnerShadow.shadowOpacity = 0.2
//                    lightInnerShadow.shadowRadius = 3
//                    lightInnerShadow.masksToBounds = true
//            }
//        }
//    }
//}


























class ButtonTest: UIViewController {
    
    let neumophobicView: NeumView = {
        let neumophobicView = NeumView(corner: 15)
        return neumophobicView
    }()
    
    let neumophobicInnerView: NeumInnterView = {
        let neumophobicInnerView = NeumInnterView(corner: 15)
        return neumophobicInnerView
    }()
    
    lazy var neumButton: NeumButton = {
        let button = NeumButton(corner: 50)
        self.view.bringSubviewToFront(button)
        button.setImage(UIImage(systemName: "house"), for: .normal)
        button.setTitleColor(UIColor(named: "DarkShadowText"), for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        setUpView()
    }
    
    private func setUpView() {
        view.addSubviews(subviews: neumophobicView, neumophobicInnerView, neumButton)
        view.backgroundColor = UIColor(named: "BackgroundColor")
        setupAnchors()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.isHidden = true
    }
    
    private func setupAnchors() {
        NSLayoutConstraint.activate([
            neumophobicView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            neumophobicView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            neumophobicView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            neumophobicView.heightAnchor.constraint(equalToConstant: 60),
            
            neumophobicInnerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            neumophobicInnerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            neumophobicInnerView.centerXAnchor.constraint(equalTo: neumophobicView.centerXAnchor, constant: 0),
            neumophobicInnerView.topAnchor.constraint(equalTo: neumophobicView.bottomAnchor, constant: 20),
            neumophobicInnerView.heightAnchor.constraint(equalToConstant: 60),
            
            neumButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            neumButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            neumButton.centerXAnchor.constraint(equalTo: neumophobicInnerView.centerXAnchor, constant: 0),
            neumButton.topAnchor.constraint(equalTo: neumophobicInnerView.bottomAnchor, constant: 20),
            neumButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func buttonPressed() {
        print("Button Pressed")
    }
}

extension UIView {
    func fillSuperView(padding: CGFloat = 0) {
        guard let superView = self.superview else { return }
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: padding),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: padding),
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: padding),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: padding)
        ])
    }
    
    func addSubviews(subviews: UIView...) {
        for i in subviews {
            self.addSubview(i)
        }
    }
}
