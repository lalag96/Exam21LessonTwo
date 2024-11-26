//
//  ButtonView.swift
//  Exam21Lesson
//
//  Created by  Влад on 31.10.2024.
//

import UIKit

class ButtonView: UIButton {
    init(
        titleName: String,
        color: UIColor,
        colorText: UIColor,
        shadow: Bool
    ) {
        super.init(frame: .zero)
        setupButton(
            titleName: titleName,
            color: color,
            colorText: colorText,
            shadow: shadow
        )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Button configuration

private extension ButtonView {
    func setupButton(
        titleName: String,
        color: UIColor,
        colorText: UIColor,
        shadow: Bool
    ) {
        
        setTitle(titleName, for: .normal)
        backgroundColor = color
        setTitleColor(colorText, for: .normal)
        configureShadow(shadow)
        layer.cornerRadius = 10
        
        heightAnchor.constraint(equalToConstant: 35).isActive = true
        widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

// MARK: - Customizing the appearance
private extension ButtonView {
    func configureShadow(_ shadow: Bool) {
        if shadow {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.3
            layer.shadowRadius = 4
        } else {
            layer.shadowOpacity = 0
        }
    }
}
