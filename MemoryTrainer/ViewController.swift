//
//  ViewController.swift
//  MemoryTrainer
//
//  Created by Antony Razhnou on 12/8/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var textBox: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        text.textColor = UIColor(named: "DarkShadowText")
        text.textAlignment = .center
        text.backgroundColor = .clear
        text.numberOfLines = 0
        text.text = "AAAAAAAA"
        text.isHidden = true
        return text
    }()
    
    lazy var button: NeumButton = {
        let button = NeumButton(corner: 15)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(named: "DarkShadowText"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        return button
    }()
    
    var txtInput: UITextField = {
        let field = UITextField()
        field.placeholder = "Here"
        field.autocorrectionType = .no
        field.isUserInteractionEnabled = false
        field.backgroundColor = .clear
        return field
    }()
    
    var textFieldView: NeumInnterView = {
        let view = NeumInnterView(corner: 5)
        return view
    }()
    
    var containerView: NeumView = {
        let view = NeumView(corner: 15)
        return view
    }()
    
    var levelText: UILabel = {
        let text = UILabel()
        text.textColor = UIColor(named: "DarkShadowText")
        text.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        text.textAlignment = .center
        return text
    }()
    
    var timerLabel: UILabel = {
        let text = UILabel()
        text.isHidden = true
        text.textColor = UIColor(named: "DarkShadowText")
        text.textAlignment = .center
        text.text = "5"
        text.font = .systemFont(ofSize: 40, weight: .bold)
        return text
    }()
    
    let test = GamePlay()
    
    var timerCreater = false
    
    @objc private func buttonTapped(sender: UIButton) {
        guard let text = txtInput.text else { return }
        test.userInput = text
        txtInput.text = ""
        test.checkWord()
        self.view.layoutIfNeeded()
        
        test.shouldChange = false
        setOffTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test.currentLevel = .fithteen
        test.dipshit = {
            self.textBox.text = self.test.getGeneratedTextAsString()
            self.levelText.text = "Level \(self.test.currentLevel)"
            self.setUpConstraint()
            self.view.layoutIfNeeded()
        }
        
        setUpView()
        setUpConstraint()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func setUpView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        view.addSubview(containerView)
        view.addSubview(timerLabel)
        view.addSubview(levelText)
        
        containerView.addSubview(textFieldView)
        textFieldView.addSubview(txtInput)
        containerView.addSubview(button)
        containerView.addSubview(textBox)
    }
    
    func setOffTimer() {
        if timerCreater { return }
        timerCreater.toggle()
        textBox.isHidden = false
        var timeLeft = 5
        timerLabel.isHidden = false
        timerLabel.text = "\(timeLeft)"
        txtInput.isUserInteractionEnabled = false
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            timeLeft -= 1
            if timeLeft > 0 {
                self.timerLabel.text = "\(timeLeft)"
                self.pulseAnimation(self.timerLabel)
            } else {
                self.timerLabel.isHidden = true
                self.test.shouldChange = true
                timer.invalidate()
                self.textBox.isHidden = true
                self.timerCreater.toggle()
                self.txtInput.isUserInteractionEnabled = true
                self.timerLabel.layer.removeAllAnimations()
            }
        }
    }
    
    func pulseAnimation(_ view: UIView) {
        let transformX = CABasicAnimation(keyPath: "transform.scale.x")
        transformX.fromValue = 1
        transformX.toValue = 2
        transformX.timingFunction = CAMediaTimingFunction(name: .easeOut)
        transformX.autoreverses = true
        transformX.repeatCount = 1

        let transformY = CABasicAnimation(keyPath: "transform.scale.y")
        transformY.fromValue = 1
        transformY.toValue = 2
        transformY.timingFunction = CAMediaTimingFunction(name: .easeOut)
        transformY.autoreverses = true
        transformY.repeatCount = 1
        
        view.layer.add(transformX, forKey: nil)
        view.layer.add(transformY, forKey: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setUpConstraint() {
        containerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        levelText.snp.makeConstraints { make in
            make.top.equalTo(levelText.superview!.safeAreaLayoutGuide.snp.top).offset(32)
            make.left.equalTo(levelText.superview!.safeAreaLayoutGuide.snp.left).offset(32)
        }
        
        textFieldView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(35)
            make.centerY.equalToSuperview()
        }
        
        textBox.snp.makeConstraints { make in
            make.bottom.equalTo(txtInput.snp.top).offset(-16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(16)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(txtInput.snp.bottom).offset(16)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(16)
        }
        
        timerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        txtInput.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
}

