//
//  ViewController.swift
//  ExampleAR
//
//  Created by MAHESHWARAN M on 06/04/24.
//

import UIKit
import ARKit

class ViewController: UIViewController {
  
  private var sceneView: CustomARView?

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
    sceneView?.session.pause()
  }
  
  // MARK: - Views
  
  private func setupView() {
    title = "Home"
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  private func setupARView() {
    sceneView = CustomARView(frame: view.bounds)
    view.addSubView(sceneView)
    sceneView?.delegate = self
    
    sceneView?.showsStatistics = true
    
    let config = ARWorldTrackingConfiguration()
    sceneView?.session.run(config)
  }
}

extension ViewController: ARSCNViewDelegate { }
