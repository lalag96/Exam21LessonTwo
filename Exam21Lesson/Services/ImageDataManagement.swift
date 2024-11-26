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
    
    func getNextImage() -> ImageInfo {
        images[currentIndex]
    }
    
    func getNextImageIndex() -> ImageInfo {
        if currentIndex < images.count - 1 {
            currentIndex += 1
        }
        return getNextImage()
    }
}
