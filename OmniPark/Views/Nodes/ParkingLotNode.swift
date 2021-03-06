//
//  ParkingLotNode.swift
//  OminPark
//
//  Created by Vasilii Muravev on 10/22/17.
//  Copyright © 2017 SilverLogic, LLC. All rights reserved.
//

import SceneKit

enum LotType {
    case available
    case unavailable
}

class ParkingLotNode: BaseNode {
    
    // MARK: - Public Instance Attributes
    var type: LotType {
        didSet {
            updateColor()
        }
    }
    
    
    // MARK: - Initializers
    init(_ type: LotType) {
        self.type = type
        super.init()
        let width: CGFloat = 0.06
        let height: CGFloat = 0.09
        let subNode = SCNNode()
        addChildNode(subNode)
        let plane = SCNPlane(width: width, height: height)
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles = SCNVector3(CGFloat.pi * -0.5, 0.0, 0.0)
        subNode.addChildNode(planeNode)
        updateColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private Instance Attributes
    private func updateColor() {
        guard let plane = childNodes.first?.childNodes.first?.geometry as? SCNPlane else { return }
        let color = (type == .available ? UIColor.colorFromHexValue(0xb3d355, alpha: 0.9) : UIColor.colorFromHexValue(0xbe1e2d, alpha: 0.9))
        plane.firstMaterial?.diffuse.contents = color.withAlphaComponent(0.8)
    }
}

