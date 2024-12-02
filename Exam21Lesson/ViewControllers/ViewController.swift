//
//  ViewController.swift
//  Exam21Lesson
//
//  Created by  Влад on 30.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageData = ImageManager()
    private let imageDataManagement = ImageDataManagement(images: [])
    
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
    
    private let verticalstackView = UIStackView()
    private let horizontalStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }


}

// MARK: - Setup View

private extension ViewController {
    
    func addAction() {
        let nextdButtonAction = UIAction { _ in
            let nextImageInfo = self.imageDataManagement.getNextImageIndex()
            self.imageView.image = UIImage(named: nextImageInfo.imageName)
            self.infoLabel.text = nextImageInfo.imageText
        }
        
        let firstButtonAction = UIAction { _ in
            let firstImageInfo = self.imageDataManagement.getFirstButtonIndex()
            self.imageView.image = UIImage(named: firstImageInfo.imageName)
            self.infoLabel.text = firstImageInfo.imageText
        }
        
        let lastButtonAction = UIAction { _ in
            let lastImageInfo = self.imageDataManagement.getLastImageIndex()
            self.imageView.image = UIImage(named: lastImageInfo.imageName)
            self.infoLabel.text = lastImageInfo.imageText
        }
        
        nextdButton.addAction(nextdButtonAction, for: .touchUpInside)
        lastButton.addAction(lastButtonAction, for: .touchUpInside)
        firstButton.addAction(firstButtonAction, for: .touchUpInside)
    }
    
    func setupView() {
        
        imageDataManagement.addImage(imageData.getImageModels())
        
        view.backgroundColor = .white
        
        setupImageView()
        setupInfoLabel()
        
        view.addSubview(verticalstackView)
        view.addSubview(firstButton)
        addAction()
        
        setupVerticalStackView()
        setupHorizontalStackView()
        setupLayout()
    }
    
    func setupImageView() {
        let imageName = imageDataManagement.сurrentElement().imageName
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        
    }
    
    func setupInfoLabel() {
        let imageInfo = imageDataManagement.сurrentElement().imageText
        infoLabel.text = imageInfo
        infoLabel.textColor = .black
        infoLabel.font = .systemFont(ofSize: 15)
        infoLabel.numberOfLines = 0
    }
    
    func setupVerticalStackView() {
        verticalstackView.axis = .vertical
        verticalstackView.distribution = .fillEqually
        verticalstackView.alignment = .center
        verticalstackView.spacing = 10
        
        verticalstackView.addArrangedSubview(imageView)
        verticalstackView.addArrangedSubview(infoLabel)
        
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
        verticalstackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            verticalstackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            verticalstackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalstackView.widthAnchor.constraint(equalToConstant: 200),
            verticalstackView.heightAnchor.constraint(equalToConstant: 200),
            
            horizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
           
        ])
    }
}
    
