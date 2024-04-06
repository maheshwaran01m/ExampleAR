//
//  CustomARView.swift
//  ExampleAR
//
//  Created by MAHESHWARAN on 06/04/24.
//

import ARKit
import SceneKit
import UIKit

class CustomARView: ARSCNView {
  
  override init(frame: CGRect) {
    super.init(frame: frame, options: nil)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  private func setupView() {
    setupDebug()
    drawSphereAtOrigin()
  }
  
  private func setupDebug() {
    debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
    autoenablesDefaultLighting = true
  }
  
  private func drawSphereAtOrigin() {
    let sphere = SCNNode(geometry: SCNSphere(radius: 0.05))
    sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.systemBlue.opacity(0.3)
    sphere.position = SCNVector3(0, 0, 0)
    
    self.scene.rootNode.addChildNode(sphere)
  }
}
