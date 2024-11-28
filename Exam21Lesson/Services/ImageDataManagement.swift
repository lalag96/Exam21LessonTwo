//
//  ImageDataManagement.swift
//  Exam21Lesson
//
//  Created by  Влад on 31.10.2024.
//

import Foundation

class ImageDataManagement {
    
    private var images: [ImageInfo] = []
    private var currentIndex = 0
    
    init(images: [ImageInfo]) {
        self.images = images
    }
    
    func addImage(_ images: [ImageInfo]) {
        self.images.append(contentsOf: images)
    }
    
    func сurrentElement() -> ImageInfo {
        images[currentIndex]
    }
    
    func getNextImageIndex() -> ImageInfo {
        if currentIndex < images.count - 1 {
            currentIndex += 1
        }
        return сurrentElement()
    }
    
    func getLastImageIndex() -> ImageInfo {
        if currentIndex < images.count && currentIndex != 0 {
            currentIndex -= 1
        }
        return сurrentElement()
    }
    
    func getFirstButtonIndex() -> ImageInfo {
        currentIndex = 0
        return сurrentElement()
    }
}
