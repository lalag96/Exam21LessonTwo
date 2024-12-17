//
//  ImageInfo.swift
//  Exam21Lesson
//
//  Created by  Влад on 31.10.2024.
//

import Foundation

struct ImageInfo: Comparable, CustomStringConvertible {
    
    
    
    let imageName: String
    let imageText: String
    
    static func < (lhs: ImageInfo, rhs: ImageInfo) -> Bool {
        lhs.imageName < rhs.imageName
    }
    
    var description: String {
        "Название картинки: \(imageName), описание: \(imageText)"
    }
}
