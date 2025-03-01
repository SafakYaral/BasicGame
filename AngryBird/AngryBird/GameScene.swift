//
//  GameScene.swift
//  AngryBird
//
//  Created by Safak Yaral on 14.11.2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate{
    
    //var bird2 = SKSpriteNode()
    
    var bird2 = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var box6 = SKSpriteNode()
    var box7 = SKSpriteNode()
    
    var gameStarted = false
    
    var originalPosition = CGPoint()
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum colliderType : UInt32 {
        case Bird = 1
        case Box = 2
    }//kategoriler oluşturuyoruz o yüzden enum kullandık
    
    override func didMove(to view: SKView) {
        
        /*  let texture = SKTexture(imageNamed: "bird")
         bird2 = SKSpriteNode(texture: texture)
         bird2.position = CGPoint(x: 0, y: 0)
         bird2.size = CGSize(width: 50, height: 50)
         bird2.zPosition = 1
         self.addChild(bird2)
         */
        
        //Physics body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)// kuşun ekrandan çıkmamasını sağladık.
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        //Bird
        bird2 = childNode(withName: "bird2") as! SKSpriteNode
        
        let bird2Texture = SKTexture(imageNamed: "bird2")
        
        
        bird2.physicsBody = SKPhysicsBody(circleOfRadius: bird2Texture.size().height / 14) // kuşun etrafına bir fiziksel body oluşturur şarpışma esnasında o algılanır.
        bird2.physicsBody?.affectedByGravity = false
        bird2.physicsBody?.isDynamic = true
        bird2.physicsBody?.allowsRotation = true
        bird2.physicsBody?.mass = 0.2
        originalPosition = bird2.position
        
        bird2.physicsBody?.contactTestBitMask = colliderType.Bird.rawValue
        bird2.physicsBody?.categoryBitMask = colliderType.Bird.rawValue
        bird2.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        
        
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 7.5, height: boxTexture.size().height / 7.5)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.4
        
        box1.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.4
        
        box2.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.4
        
        box3.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.4
        
        box4.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.4
        
        box5.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        box6 = childNode(withName: "box6") as! SKSpriteNode
        box6.physicsBody = SKPhysicsBody(rectangleOf: size)
        box6.physicsBody?.affectedByGravity = true
        box6.physicsBody?.isDynamic = true
        box6.physicsBody?.allowsRotation = true
        box6.physicsBody?.mass = 0.4
        
        box6.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        box7 = childNode(withName: "box7") as! SKSpriteNode
        box7.physicsBody = SKPhysicsBody(rectangleOf: size)
        box7.physicsBody?.affectedByGravity = true
        box7.physicsBody?.isDynamic = true
        box7.physicsBody?.allowsRotation = true
        box7.physicsBody?.mass = 0.4
        
        box7.physicsBody?.collisionBitMask = colliderType.Bird.rawValue
        
        //Label
        
        scoreLabel.fontName = "HelveticaNeue-Light"
        scoreLabel.fontColor = SKColor.blue
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: self.frame.width / 2.5, y: self.frame.height / 3)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
    }
    
    func didBegin(_ contact : SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == colliderType.Bird.rawValue && contact.bodyB.collisionBitMask == colliderType.Bird.rawValue{
            
            score += 1
            scoreLabel.text = String(score)
        }
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /* flappy bird oyunu için
         //  bird2.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 150))
         //  bird2.physicsBody?.affectedByGravity = true
         */
        
        if gameStarted == false {
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        
                        if let spriteNode = node as? SKSpriteNode {
                            
                            if spriteNode == bird2 {
                                bird2.position = touchLocation
                            }
                            
                        }
                    }
                }
            }
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        
        if gameStarted == false {
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        
                        if let spriteNode = node as? SKSpriteNode {
                            
                            if spriteNode == bird2 {
                                bird2.position = touchLocation
                            }
                            
                        }
                    }
                }
            }
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bird2 {
                                
                                let dx = -(touchLocation.x - originalPosition.x)
                                let dy = -(touchLocation.y - originalPosition.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bird2.physicsBody?.applyImpulse(impulse)
                                bird2.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                                
                            }
                            
                        }
                    }
                }
            }
        }
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        if let birdPhysicBody = bird2.physicsBody {
            
            if birdPhysicBody.velocity.dx <= 0.1 && birdPhysicBody.velocity.dy <= 0.1 && birdPhysicBody.angularVelocity <= 0.1 && gameStarted == true {
                
                bird2.physicsBody?.affectedByGravity = false
                bird2.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird2.physicsBody?.angularVelocity = 0
                bird2.zPosition = 0
                bird2.position = originalPosition
               
                gameStarted = false
                
                
            }
        }
        
    }
    
    
}
