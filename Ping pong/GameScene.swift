//
//  GameScene.swift
//  Ping pong
//
//  Created by Evan Jåsund Kassab on 23/04/2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var me = SKSpriteNode()
    var fiende = SKSpriteNode()
    
    var topLabel = SKLabelNode()
    var btmLabel = SKLabelNode()
    
    var poeng = [Int]()

    
    override func didMove(to view: SKView) {
        
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        me = self.childNode(withName: "me") as! SKSpriteNode
        fiende = self.childNode(withName: "fiende") as! SKSpriteNode
        
        fiende.position.y = (self.frame.height / 2) - 50
        me.position.y = -(self.frame.height / 2) + 50
        
        
        topLabel = self.childNode(withName: "topLabel") as! SKLabelNode
        btmLabel = self.childNode(withName: "btmLabel") as! SKLabelNode
        
        let kant = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        kant.friction = 0
        kant.restitution = 1
        
        self.physicsBody = kant
    
        
        startSpill()
        
        
    }
    
    func startSpill(){
        poeng = [0, 0]
        topLabel.text = "\(poeng[1])"
        btmLabel.text = "\(poeng[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: -15, dy: -20))
        
    }
    
    func leggtilPoeng(spillerSomVant : SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if spillerSomVant == me{
            poeng[0] += 1
            
            ball.physicsBody?.applyImpulse(CGVector(dx: -15, dy: -15))
            
        }
        else if spillerSomVant == fiende{
            poeng[1] += 1
            
            ball.physicsBody?.applyImpulse(CGVector(dx: 15, dy: 15))
        }
        
        topLabel.text = "\(poeng[1])"
        btmLabel.text = "\(poeng[0])"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let lokasjon = touch.location(in: self)
            
            if (currentGameType == .player2){
                if lokasjon.y > 0{
                    fiende.run(SKAction.moveTo(x: lokasjon.x, duration: 0.05))
                }
                if lokasjon.y < 0{
                    me.run(SKAction.moveTo(x: lokasjon.x, duration: 0.05))
                }
            }
            
            
            else {
                me.run(SKAction.moveTo(x: lokasjon.x, duration: 0.05))
            }
        
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let lokasjon = touch.location(in: self)
            
            if (currentGameType == .player2){
                if lokasjon.y > 0{
                    fiende.run(SKAction.moveTo(x: lokasjon.x, duration: 0.05))
                }
                if lokasjon.y < 0{
                    me.run(SKAction.moveTo(x: lokasjon.x, duration: 0.05))
                }
            }
            
            
            else {
                me.run(SKAction.moveTo(x: lokasjon.x, duration: 0.05))
            }
        
        }
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        switch currentGameType {
        case .lett:
            fiende.run(SKAction.moveTo(x: ball.position.x, duration: 1.2))
            break
            
        case .medium:
            fiende.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
            break
            
        case .vanskelig:
            fiende.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
            break
            
        case .player2:
            fiende.position.y = (self.frame.height / 2) - 85
            break
            
        }
        
        
        if ball.position.y <= me.position.y - 30 {
            leggtilPoeng(spillerSomVant: fiende)
            
        }
        else if ball.position.y >= fiende.position.y + 30 {
            leggtilPoeng(spillerSomVant: me)
            
        }
        
        
    }
}
