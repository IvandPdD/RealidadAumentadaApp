//
//  ViewController.swift
//  RealidadAumentadaApp
//
//  Created by Apps2t on 18/03/2021.
//  Copyright © 2021 Apps2t. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var testAR: ARSCNView!
    
    private let configuration =	ARWorldTrackingConfiguration()
    
    private var node: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.testAR.showsStatistics = true
        self.testAR.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        self.addBox()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.testAR.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.testAR.session.pause()
    }
    
    func addBox(x: Float = 0, y: Float = 0, z: Float = -0.2){
        
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        let colors = [UIColor.green,
            UIColor.red,
            UIColor.blue,
            UIColor.yellow,
            UIColor.purple,
            UIColor.gray]
        let sideMaterials = colors.map { color -> SCNMaterial in
            let material = SCNMaterial()
            material.diffuse.contents = colors
            material.locksAmbientWithDiffuse = true
            
            return material
            
        }
        box.materials = sideMaterials
        
        self.node = SCNNode()
        self.node.geometry = box
        self.node.position = SCNVector3(x, y, z)
        
        testAR.scene.rootNode.addChildNode(self.node)
    }
}

