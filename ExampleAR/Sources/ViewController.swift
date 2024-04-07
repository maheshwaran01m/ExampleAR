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
    
    let config = ARWorldTrackingConfiguration()
    sceneView.session.run(config)
  }
}

extension ViewController: ARSCNViewDelegate { }
