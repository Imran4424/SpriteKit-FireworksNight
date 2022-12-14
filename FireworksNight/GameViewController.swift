//
//  GameViewController.swift
//  FireworksNight
//
//  Created by Shah Md Imran Hossain on 4/11/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // shake gesture
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard let skView = view as? SKView else {
            print("not SKView")
            return
        }
        
        guard let gameScene = skView.scene as? GameScene else {
            print("Not game scene")
            return
        }
        
        gameScene.explodeFireworks()
    }
}
