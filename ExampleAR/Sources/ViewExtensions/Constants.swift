//
//  Constants.swift
//  ExampleAR
//
//  Created by MAHESHWARAN on 07/04/24.
//

import Foundation

enum Constants {
  
}

// MARK: - USDZ files

extension Constants {
  
  ///  USDZ Files gives list of files available in main bundle
  ///
  ///  Usage:
  ///
  ///  let model = try? ModelEntity.loadModel(named: fileName + ".usdz")
  ///
  ///  let achor = AnchorEntity(plane: .any)
  ///  achor.addChild(model)
  ///
  ///  scene.addAnchor(achor)
  ///
  static var usdzFiles: [String] {
    
    guard let path = Bundle.main.resourcePath,
          let files = try? FileManager.default.contentsOfDirectory(atPath: path) else {
      return []
    }
    return files
      .filter { $0.hasSuffix("usdz") }
      .compactMap { $0.replacingOccurrences(of: ".usdz", with: "") }
  }
}
