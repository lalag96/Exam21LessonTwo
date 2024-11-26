//
//  ViewController.swift
//  Exam21Lesson
//
//  Created by  Влад on 30.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageDataManagement = ImageDataManagement(images: [])
    private let imageData = ImageManager()
    
    private let imageView = UIImageView()
    private let infoLabel = UILabel()
    private let lastButton = ButtonView(
        titleName: "Last",
        color: UIColor(red: 105/255, green: 174/255, blue: 200/255, alpha: 1),
        colorText: .white,
        shadow: true
    )
    private let nextdButton = ButtonView(
        titleName: "Next",
        color: .white,
        colorText: .black,
        shadow: true
    )
    
    private let firstButton = ButtonView(
        titleName: "First",
        color: .systemPink,
        colorText: .white,
        shadow: false
    )
    
    private let stackView = UIStackView()
    private let horizontalStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }


}

// MARK: - Setup View

private extension ViewController {
    
    func setupView() {
        
        view.backgroundColor = .white
        
        setupImageView()
        setupInfoLabel()
        
        view.addSubview(stackView)
        view.addSubview(firstButton)
        
        setupVerticalStackView()
        setupHorizontalStackView()
        setupLayout()
    }
    
    func setupImageView() {
        
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFit
        
    }
    
    func setupInfoLabel() {
        infoLabel.text = "Hello, World!"
        infoLabel.textColor = .black
        infoLabel.font = .systemFont(ofSize: 20)
    }
    
    func setupVerticalStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(infoLabel)
        
    }
    
    func setupHorizontalStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 40
        
        view.addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(lastButton)
        horizontalStackView.addArrangedSubview(nextdButton)
        
    }
    
}

// MARK: - Setup Layout
private extension ViewController {
    
    func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            
            horizontalStackView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
           
        ])
    }
}
    
