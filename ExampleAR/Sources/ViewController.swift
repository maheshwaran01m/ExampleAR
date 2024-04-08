//
//  ViewController.swift
//  ExampleAR
//
//  Created by MAHESHWARAN M on 06/04/24.
//

import UIKit
import ARKit

class ViewController: UIViewController {
  
  private var sceneView = ARSCNView()
  
  // MARK: - Override Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupView()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    sceneView.session.pause()
  }
  
  // MARK: - Views
  
  private func setupView() {
    view.backgroundColor = .systemBackground
    setupARView()
  }
  
  private func setupARView() {
    sceneView.delegate = self
    
    view.insertSubview(sceneView, at: 0)
    sceneView.edges(to: view)
    
    sceneView.showsStatistics = true
    
//    let config = ARWorldTrackingConfiguration()
//    config.planeDetection = [.horizontal, .vertical]
//    config.environmentTexturing = .automatic
//    
//    if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
//      config.sceneReconstruction = .mesh
//    }
//    sceneView.session.run(config)
    setupImageTracking()
  }
}

extension ViewController: ARSCNViewDelegate { }

// MARK: - Image Tracking

extension ViewController {
  
  private func setupImageTracking() {
    
    let imageConfig = ARImageTrackingConfiguration()
    guard let imageTracking = ARReferenceImage.referenceImages(
      inGroupNamed: "AR_Images", bundle: nil) else {
      return
    }
    imageConfig.trackingImages = imageTracking
    sceneView.session.run(imageConfig)
  }
  
  func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
    guard let imageAnchor = anchor as? ARImageAnchor else { return nil }
    
    guard let imageName = imageAnchor.referenceImage.name else { return nil }
    
    let plane = SCNPlane(
      width: imageAnchor.referenceImage.physicalSize.width,
      height: imageAnchor.referenceImage.physicalSize.height
    )
    plane.firstMaterial?.diffuse.contents = UIColor.clear
    
    let planeNode = SCNNode(geometry: plane)
    planeNode.eulerAngles.x = -.pi / 2
    
    let node = SCNNode()
    node.addChildNode(planeNode)
    
    let spacing: Float = 0.005
    
    let title = textNode(imageName, font: .boldSystemFont(ofSize: 10))
    title.pivotOnTopLeft()
    title.position.x += Float(plane.width/2) + spacing
    title.position.y += Float(plane.height/2)
    
    node.addChildNode(title)
    
    let title1 = textNode(imageName.capitalized,
                          font: .boldSystemFont(ofSize: 4), maxWidth: 100)
    title1.pivotOnTopLeft()
    title1.position.x += Float(plane.width/2) + spacing
    title1.position.y = title.position.y - title.height - spacing
    
    node.addChildNode(title1)
    
    let image = SCNPlane(
      width: imageAnchor.referenceImage.physicalSize.width,
      height: imageAnchor.referenceImage.physicalSize.height)
    image.firstMaterial?.diffuse.contents = UIImage(systemName: "star")
    
    let imageNode = SCNNode(geometry: image)
    imageNode.pivotOnTopCenter()
    imageNode.position.y -= Float(plane.height/2) + spacing
  
    node.addChildNode(imageNode)
    
    return node
  }
  
  func textNode(_ string: String, font: UIFont, maxWidth: Int? = nil) -> SCNNode {
    let text = SCNText(string: string, extrusionDepth: 0)
    text.flatness = 0.1
    text.font = font
    
    if let maxWidth {
      text.containerFrame = .init(
        origin: .zero, size: CGSize(width: maxWidth, height: 500))
      text.isWrapped = true
    }
    
    let node = SCNNode(geometry: text)
    node.scale = SCNVector3(0.002, 0.002, 0.002)
    
    return node
  }
}
