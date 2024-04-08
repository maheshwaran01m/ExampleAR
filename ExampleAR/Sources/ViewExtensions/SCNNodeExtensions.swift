//
//  SCNNodeExtensions.swift
//  ExampleAR
//
//  Created by MAHESHWARAN on 07/04/24.
//

import SceneKit

extension SCNNode {
  
  var width: Float {
    (boundingBox.max.x - boundingBox.min.x) * scale.x
  }
  
  var height: Float {
    (boundingBox.max.y - boundingBox.min.y) * scale.y
  }
  
  var depth: Float {
    (boundingBox.max.z - boundingBox.min.z) * scale.z
  }
  
  func pivotOnTopLeft() {
    let (min, max) = boundingBox
    pivot = SCNMatrix4MakeTranslation(min.x, (max.y-min.y) + min.y, 0)
  }
  
  func pivotOnTopCenter() {
    let (min, max) = boundingBox
    pivot = SCNMatrix4MakeTranslation((max.x-min.x)/2 + min.x, (max.y-min.y) + min.y, 0)
  }
}
