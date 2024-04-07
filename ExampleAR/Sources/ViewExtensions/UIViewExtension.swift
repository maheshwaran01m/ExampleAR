//
//  UIViewExtension.swift
//  ExampleAR
//
//  Created by MAHESHWARAN on 06/04/24.
//

import UIKit

extension UIView {
  
  func addSubviews(_ views: UIView...) {
    for view in views {
      addSubview(view)
    }
  }
  
  func border(_ radius: CGFloat, width: CGFloat = 1, color: UIColor = .clear, showShadow: Bool = false) {
    layer.cornerRadius = radius
    layer.masksToBounds = true
    layer.borderColor = color.cgColor
    layer.borderWidth = width
    
    if showShadow {
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOffset = CGSizeMake(2.0, 2.0)
      layer.shadowOpacity = 1.0
    }
  }
  
  func addSubView(_ view: UIView?) {
    guard let view else { return }
    addSubview(view)
  }
  
  func edges(to superView: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
      leadingAnchor.constraint(equalTo: superView.leadingAnchor),
      trailingAnchor.constraint(equalTo: superView.trailingAnchor),
      bottomAnchor.constraint(equalTo: superView.bottomAnchor),
    ])
  }
}

// MARK: - UIColor

extension UIColor {
  
  func opacity(_ value: CGFloat) -> UIColor {
    withAlphaComponent(value)
  }
}
