//
//  ContentView.swift
//  Drawing
//
//  Created by Judy chen on 2021/12/15.
//

import SwiftUI
struct DrawView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 180/255, alpha: 0.3)
            
    //小小兵底圖
        /*let kevinImageView = UIImageView(image: UIImage(named: "kevin") )
        let mask = UIImageView()
        mask.frame = kevinImageView.frame
        view.frame = mask.frame
        mask.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        view.addSubview(kevinImageView)
        view.addSubview(mask)*/
        
        let pantsColor = UIColor(red: 93/255, green: 132/255, blue: 173/255, alpha: 1)
        let bodyColor = UIColor(red: 244/255, green: 208/255, blue: 88/205, alpha: 1)
        let armsColor = UIColor(red: 244/255, green: 208/255, blue: 88/205, alpha: 1)
        let minionLineColor = UIColor(red: 62/255, green: 57/255, blue: 53/255, alpha: 1)
        let shoesColor = UIColor(red: 62/255, green: 57/255, blue: 53/255, alpha: 1)
        let nameGradientColor = [
            CGColor(red: 10/255, green: 25/255, blue: 49/255, alpha: 1),
            CGColor(red: 24/255, green: 90/255, blue: 219/255, alpha: 1),
            CGColor(red: 255/255, green: 201/255, blue: 71/255, alpha: 1)]
       
        
            //橫幅
            func addBannerView(){
                let bannerView = UIView(frame: CGRect(x: 0, y: 20, width: 415, height: 99))
                bannerView.backgroundColor = UIColor(white: 1, alpha: 0.5)
                view.addSubview(bannerView)
                    
                let bannerLinePath = UIBezierPath()
                bannerLinePath.move(to: CGPoint(x: 0, y: 8))
                bannerLinePath.addLine(to: CGPoint(x: 415, y: 8))
                bannerLinePath.move(to: CGPoint(x: 0, y: 91))
                bannerLinePath.addLine(to: CGPoint(x: 415, y: 91))
                
                let bannerLayer = CAShapeLayer()
                bannerLayer.path = bannerLinePath.cgPath
                bannerLayer.strokeColor = UIColor(red: 62/255, green: 57/255, blue: 53/255, alpha: 1).cgColor
                bannerLayer.lineWidth = 5
                bannerView.layer.addSublayer(bannerLayer)
            }
            
        
            
              
            func growHair(){
            //畫第一根頭髮
                let hairPath = UIBezierPath()
                hairPath.move(to: CGPoint(x: 140, y: 125))
                hairPath.addQuadCurve(to: CGPoint(x: 112, y: 76), controlPoint: CGPoint(x: 133, y: 93))
                
            //畫第二根頭髮
                hairPath.move(to: CGPoint(x: 140, y: 125))
                hairPath.addQuadCurve(to: CGPoint(x: 122, y: 62), controlPoint: CGPoint(x: 140, y: 93))
            
            //畫第三根頭髮
                hairPath.move(to: CGPoint(x: 140, y: 125))
                hairPath.addQuadCurve(to: CGPoint(x: 162, y: 62), controlPoint: CGPoint(x: 140, y: 93))
            //畫第四根頭髮
                hairPath.move(to: CGPoint(x: 140, y: 125))
                hairPath.addQuadCurve(to: CGPoint(x: 170, y: 76), controlPoint: CGPoint(x: 148, y: 93))
                
            //顯示全四根頭髮
                let hairLayer = CAShapeLayer()
                hairLayer.path = hairPath.cgPath
                hairLayer.strokeColor = minionLineColor.cgColor
                hairLayer.lineWidth = 8
                hairLayer.fillColor = UIColor.clear.cgColor
                view.layer.addSublayer(hairLayer)
            
        
            }
            
            func createBody(){
            //畫左半身
                let leftBodyPath = UIBezierPath()
                leftBodyPath.move(to: CGPoint(x: 140, y: 125))
                leftBodyPath.addQuadCurve(to: CGPoint(x: 60, y: 200),  controlPoint: CGPoint(x: 65, y: 133))
                leftBodyPath.addLine(to: CGPoint(x: 58, y: 400))
                leftBodyPath.addQuadCurve(to: CGPoint(x: 100, y: 463), controlPoint: CGPoint(x: 54, y: 465))
                leftBodyPath.addLine(to: CGPoint(x: 100, y: 480))
                leftBodyPath.addQuadCurve(to: CGPoint(x: 83, y: 500),  controlPoint: CGPoint(x: 88, y: 490))
                leftBodyPath.addLine(to: CGPoint(x: 134, y: 500))
                leftBodyPath.addLine(to: CGPoint(x: 134, y: 465))
                leftBodyPath.addLine(to: CGPoint(x: 140, y: 465))
           //顯示左半身
                let leftBodyLayer = CAShapeLayer()
                leftBodyLayer.path = leftBodyPath.cgPath
                leftBodyLayer.strokeColor = minionLineColor.cgColor
                leftBodyLayer.fillColor = bodyColor.cgColor
                leftBodyLayer.lineWidth = 8
                view.layer.addSublayer(leftBodyLayer)
               
               
            
            //右半身：水平移動＋翻轉左半邊身體
                let rightBodyLayer = CAShapeLayer()
                rightBodyLayer.path = leftBodyPath.cgPath
                let moveDistance = leftBodyPath.bounds.maxX*2
                let transform = CGAffineTransform(translationX: moveDistance, y: 0).scaledBy(x: -1, y: 1)
                rightBodyLayer.setAffineTransform(transform)
                rightBodyLayer.strokeColor = minionLineColor.cgColor
                rightBodyLayer.fillColor = bodyColor.cgColor
                rightBodyLayer.lineWidth = 8
                view.layer.addSublayer(rightBodyLayer)
                
            }
            
            func wearPants(){
            //畫左半褲子
                let leftPantsPath = UIBezierPath()
                leftPantsPath.move(to: CGPoint(x: 140, y: 355))
                leftPantsPath.addLine(to: CGPoint(x: 90, y: 355))
                leftPantsPath.addLine(to: CGPoint(x: 57, y: 335))
                leftPantsPath.addLine(to: CGPoint(x: 50, y: 350))
                leftPantsPath.addLine(to: CGPoint(x: 85, y: 370))
                leftPantsPath.addLine(to: CGPoint(x: 85, y: 408))
                leftPantsPath.addLine(to: CGPoint(x: 55, y: 408))
                leftPantsPath.addQuadCurve(to: CGPoint(x: 100, y: 463), controlPoint: CGPoint(x: 54, y: 465))
                leftPantsPath.addLine(to: CGPoint(x: 100, y: 480))
                leftPantsPath.addQuadCurve(to: CGPoint(x: 83, y: 500),  controlPoint: CGPoint(x: 88, y: 490))
                leftPantsPath.addLine(to: CGPoint(x: 134, y: 500))
                leftPantsPath.addLine(to: CGPoint(x: 134, y: 465))
                leftPantsPath.addLine(to: CGPoint(x: 140, y: 465))
             
            //顯示右半褲子
                let leftPantsLayer = CAShapeLayer()
                leftPantsLayer.path = leftPantsPath.cgPath
                leftPantsLayer.strokeColor = minionLineColor.cgColor
                leftPantsLayer.fillColor = pantsColor.cgColor
                leftPantsLayer.lineWidth = 8
                view.layer.addSublayer(leftPantsLayer)
            
            //右半褲子：水平移動＋翻轉左半褲子
                let rightPantsLayer = CAShapeLayer()
                rightPantsLayer.path = leftPantsPath.cgPath
                let moveDistance = leftPantsPath.bounds.maxX*2
                let transform = CGAffineTransform(translationX: moveDistance, y: 0).scaledBy(x: -1, y: 1)
                rightPantsLayer.setAffineTransform(transform)
                rightPantsLayer.strokeColor = minionLineColor.cgColor
                rightPantsLayer.fillColor = pantsColor.cgColor
                rightPantsLayer.lineWidth = 8
                view.layer.addSublayer(rightPantsLayer)
            }
            
            func putOnShoes(){
            //畫左鞋
                let leftShoePath = UIBezierPath()
                    leftShoePath.move(to: CGPoint(x: 102, y: 487))
                leftShoePath.addQuadCurve(to: CGPoint(x: 83, y: 500),  controlPoint: CGPoint(x: 88, y: 490))
                leftShoePath.addLine(to: CGPoint(x: 134, y: 500))
                leftShoePath.addLine(to: CGPoint(x: 134, y: 487))
                leftShoePath.close()
            //顯示左鞋
                let leftShoeLayer = CAShapeLayer()
                leftShoeLayer.path = leftShoePath.cgPath
                leftShoeLayer.strokeColor = minionLineColor.cgColor
                leftShoeLayer.fillColor = shoesColor.cgColor
                leftShoeLayer.lineWidth = 8
                view.layer.addSublayer(leftShoeLayer)
            
            //右鞋：水平移動＋翻轉左鞋
                let rightShoeLayer = CAShapeLayer()
                rightShoeLayer.path = leftShoePath.cgPath
                let moveDistance = leftShoePath.bounds.maxX * 2 + 13
                let transform = CGAffineTransform(translationX: moveDistance, y: 0).scaledBy(x: -1, y: 1)
                rightShoeLayer.setAffineTransform(transform)
                rightShoeLayer.strokeColor = minionLineColor.cgColor
                rightShoeLayer.fillColor = shoesColor.cgColor
                rightShoeLayer.lineWidth = 8
                view.layer.addSublayer(rightShoeLayer)
            }
            
            func createArms(){
            //畫左手臂
                let leftArmPath = UIBezierPath()
                
                leftArmPath.move(to: CGPoint(x: 59, y: 337))
                leftArmPath.addLine(to: CGPoint(x: 25, y: 430))
                leftArmPath.addLine(to: CGPoint(x: 41, y: 435))
                leftArmPath.addLine(to: CGPoint(x: 58, y: 390))
            //顯示左手臂
                let leftArmLayer = CAShapeLayer()
                leftArmLayer.path = leftArmPath.cgPath
                leftArmLayer.strokeColor = minionLineColor.cgColor
                leftArmLayer.fillColor = armsColor.cgColor
                leftArmLayer.lineWidth = 8
                view.layer.addSublayer(leftArmLayer)
                    
            //右臂：水平移動＋翻轉左臂
                let rightArmLayer = CAShapeLayer()
                rightArmLayer.path = leftArmPath.cgPath
                    let moveDistance = leftArmPath.bounds.maxX * 2 + 163
                let transform = CGAffineTransform(translationX: moveDistance, y: 0).scaledBy(x: -1, y: 1)
                    rightArmLayer.setAffineTransform(transform)
                    rightArmLayer.strokeColor = minionLineColor.cgColor
                    rightArmLayer.fillColor = armsColor.cgColor
                    rightArmLayer.lineWidth = 8
                    view.layer.addSublayer(rightArmLayer)
            }
            
            func createHands(){
            //畫左手
                let leftHandPath = UIBezierPath()
                leftHandPath.move(to: CGPoint(x: 25, y: 430))
                leftHandPath.addLine(to: CGPoint(x: 23, y: 430))
                leftHandPath.addLine(to: CGPoint(x: 16, y: 453))
                leftHandPath.addCurve(to: CGPoint(x: 40, y: 452), controlPoint1: CGPoint(x: 9, y: 475), controlPoint2: CGPoint(x: 70, y: 484))
                leftHandPath.addLine(to: CGPoint(x: 45, y: 437))
                leftHandPath.addLine(to: CGPoint(x: 41, y: 435))
                leftHandPath.close()
            //顯示左手
                let leftHandLayer = CAShapeLayer()
                leftHandLayer.path = leftHandPath.cgPath
                leftHandLayer.strokeColor = minionLineColor.cgColor
                leftHandLayer.fillColor = minionLineColor.cgColor
                leftHandLayer.lineWidth = 8
                view.layer.addSublayer(leftHandLayer)
            
            
            //右手：水平移動＋翻轉左手
                let rightHandLayer = CAShapeLayer()
                rightHandLayer.path = leftHandPath.cgPath
                let moveDistance = leftHandPath.bounds.maxX * 2 + 185
                let transform = CGAffineTransform(translationX: moveDistance, y: 0).scaledBy(x: -1, y: 1)
                rightHandLayer.setAffineTransform(transform)
                rightHandLayer.strokeColor = minionLineColor.cgColor
                rightHandLayer.fillColor = minionLineColor.cgColor
                rightHandLayer.lineWidth = 8
                view.layer.addSublayer(rightHandLayer)
            }
            
            func createGlassesFrames(){
            //畫眼鏡架: 一個長條的長方形
                let glassesFramePath = UIBezierPath()
                glassesFramePath.move(to: CGPoint(x: 54, y: 190))
                glassesFramePath.addLine(to: CGPoint(x: 230, y: 190))
                glassesFramePath.addLine(to: CGPoint(x: 230, y: 210))
                glassesFramePath.addLine(to: CGPoint(x: 54, y: 210))
                glassesFramePath.close()
            //顯示眼鏡架: 一個長條的長方形
                let glassesFrameLayer = CAShapeLayer()
                glassesFrameLayer.path = glassesFramePath.cgPath
                glassesFrameLayer.strokeColor = minionLineColor.cgColor
                glassesFrameLayer.fillColor = UIColor(red: 62/255, green: 57/255, blue: 53/255, alpha: 1).cgColor
                glassesFrameLayer.lineWidth = 8
                view.layer.addSublayer(glassesFrameLayer)
            }
            
            func createRoundGlasses(){
            //畫左圓鏡框
                let leftGlassesPath = UIBezierPath(arcCenter: CGPoint(x: 105, y: 200), radius: 35, startAngle: .pi/180 * 0, endAngle: .pi/180 * 360, clockwise: true)
            //顯示左圓鏡框
                let leftGlassesLayer = CAShapeLayer()
                leftGlassesLayer.path = leftGlassesPath.cgPath
                leftGlassesLayer.strokeColor = minionLineColor.cgColor
                leftGlassesLayer.fillColor = minionLineColor.cgColor
                leftGlassesLayer.lineWidth = 8
                view.layer.addSublayer(leftGlassesLayer)
            
            //右圓鏡框：水平移動＋翻轉左圓鏡框
                let rightGlassesLayer = CAShapeLayer()
                rightGlassesLayer.path = leftGlassesPath.cgPath
                let moveDistance = leftGlassesPath.bounds.maxX * 2
                let transform = CGAffineTransform(translationX: moveDistance, y: 0).scaledBy(x: -1, y: 1)
                rightGlassesLayer.setAffineTransform(transform)
                rightGlassesLayer.strokeColor = minionLineColor.cgColor
                rightGlassesLayer.fillColor = minionLineColor.cgColor
                rightGlassesLayer.lineWidth = 8
                view.layer.addSublayer(rightGlassesLayer)
            }
                
            func showEyes(){
            //畫左眼
                let leftEyePath = UIBezierPath(arcCenter: CGPoint(x: 105, y: 200), radius: 23, startAngle: .pi/180 * 0, endAngle: .pi/180 * 360, clockwise: true)
            //顯示左眼
                let leftEyeLayer = CAShapeLayer()
                leftEyeLayer.path = leftEyePath.cgPath
                leftEyeLayer.strokeColor = UIColor.white.cgColor
                leftEyeLayer.fillColor = UIColor(white: 1, alpha: 1).cgColor
                leftEyeLayer.lineWidth = 8
                view.layer.addSublayer(leftEyeLayer)
                
            //右眼：水平移動＋翻轉左眼
                let rightEyeLayer = CAShapeLayer()
                rightEyeLayer.path = leftEyePath.cgPath
                let moveDistance = leftEyePath.bounds.maxX * 2 + 24
                let transform = CGAffineTransform(translationX: moveDistance, y: 0).scaledBy(x: -1, y: 1)
                rightEyeLayer.setAffineTransform(transform)
                rightEyeLayer.strokeColor = UIColor.white.cgColor
                rightEyeLayer.fillColor = UIColor(white: 1, alpha: 1).cgColor
                rightEyeLayer.lineWidth = 8
                view.layer.addSublayer(rightEyeLayer)
                }
            
            func appendPupils(){
            //左曈孔
                let leftPupilPath = UIBezierPath(arcCenter: CGPoint(x: 110, y: 200), radius: 8, startAngle: .pi/180 * 0, endAngle: .pi/180 * 360, clockwise: false)
                
                let leftPupilLayer = CAShapeLayer()
                leftPupilLayer.path = leftPupilPath.cgPath
                leftPupilLayer.strokeColor = minionLineColor.cgColor
                leftPupilLayer.fillColor = minionLineColor.cgColor
                leftPupilLayer.lineWidth = 8
                view.layer.addSublayer(leftPupilLayer)
            
            //右瞳孔：：水平移動＋翻轉左曈孔
                let rightPupilLayer = CAShapeLayer()
                rightPupilLayer.path = leftPupilPath.cgPath
                let moveDistance = leftPupilPath.bounds.maxX * 2 + 43
                let transform = CGAffineTransform(translationX: moveDistance, y: 0).scaledBy(x: -1, y: 1)
                rightPupilLayer.setAffineTransform(transform)
                rightPupilLayer.strokeColor = minionLineColor.cgColor
                rightPupilLayer.fillColor = minionLineColor.cgColor
                rightPupilLayer.lineWidth = 8
                view.layer.addSublayer(rightPupilLayer)
            }
                
            func pantsLogo(){
            //畫褲子Logo的圓型
                let circleView = UIView(frame: CGRect(x: 113, y: 373.5, width: 56, height: 56))
                circleView.layer.cornerRadius = circleView.frame.size.width / 2
                circleView.backgroundColor = minionLineColor
                view.addSubview(circleView)
            //畫褲子Logo的方型
                let squarePath = UIBezierPath()
                squarePath.move(to: CGPoint(x: 162, y: 398))
                squarePath.addLine(to: CGPoint(x: 140, y: 375))
                squarePath.addLine(to: CGPoint(x: 116, y: 402))
                squarePath.addLine(to: CGPoint(x: 141, y: 427))
                squarePath.addLine(to: CGPoint(x: 163, y: 406))
                squarePath.addLine(to: CGPoint(x: 168, y: 406))
                squarePath.addQuadCurve(to: CGPoint(x: 168, y: 401), controlPoint: CGPoint(x: 168, y: 405))
                squarePath.addLine(to: CGPoint(x: 141, y: 401))
                squarePath.addLine(to: CGPoint(x: 141, y: 405))
                squarePath.addLine(to: CGPoint(x: 148, y: 405))
                squarePath.addQuadCurve(to: CGPoint(x: 140, y: 410), controlPoint: CGPoint(x: 145, y: 411))
                squarePath.addQuadCurve(to: CGPoint(x: 132, y: 403), controlPoint: CGPoint(x: 134, y: 409))
                squarePath.addQuadCurve(to: CGPoint(x: 140, y: 393), controlPoint: CGPoint(x: 131, y: 395))
                squarePath.addQuadCurve(to: CGPoint(x: 149, y: 398), controlPoint: CGPoint(x: 147, y: 394))
                squarePath.close()
            //顯示Logo的方型
                let squareLayer = CAShapeLayer()
                    squareLayer.path = squarePath.cgPath
                    squareLayer.strokeColor = minionLineColor.cgColor
                    squareLayer.fillColor = pantsColor.cgColor
                    squareLayer.lineWidth = 1
                    view.layer.addSublayer(squareLayer)
            }
            
            func smile(){
            //畫嘴巴
                let mouthPath = UIBezierPath()
                mouthPath.move(to: CGPoint(x: 120, y: 313))
                mouthPath.addQuadCurve(to: CGPoint(x: 177, y: 295), controlPoint: CGPoint(x: 152, y: 317))
            //顯示嘴巴
                let mouthLayer = CAShapeLayer()
                mouthLayer.path = mouthPath.cgPath
                mouthLayer.strokeColor = minionLineColor.cgColor
                mouthLayer.lineWidth = 8
                mouthLayer.fillColor = UIColor.clear.cgColor
                view.layer.addSublayer(mouthLayer)
            }
            
            func writeLetterK(){
            //畫K的外框
                let kPath = UIBezierPath()
                kPath.move(to: CGPoint(x: 189, y: 84))
                kPath.addLine(to: CGPoint(x: 189, y: 54))
                kPath.addLine(to: CGPoint(x: 197, y: 54))
                kPath.addLine(to: CGPoint(x: 197, y: 69))
                kPath.addLine(to: CGPoint(x: 210, y: 54))
                kPath.addLine(to: CGPoint(x: 219, y: 54))
                kPath.addLine(to: CGPoint(x: 208, y: 68))
                kPath.addLine(to: CGPoint(x: 219, y: 84))
                kPath.addLine(to: CGPoint(x: 209, y: 84))
                kPath.addLine(to: CGPoint(x: 201, y: 73))
                kPath.addLine(to: CGPoint(x: 197, y: 77))
                kPath.addLine(to: CGPoint(x: 197, y: 84))
                kPath.close()
                
             //顯示K的外框
                let kLayer = CAShapeLayer()
                kLayer.path = kPath.cgPath
                kLayer.strokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
                kLayer.lineWidth = 2
                kLayer.fillColor = UIColor.clear.cgColor
                view.layer.addSublayer(kLayer)
             //K漸層
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = [
                    CGColor(red: 10/255, green: 25/255, blue: 49/255, alpha: 1),
                    CGColor(red: 24/255, green: 90/255, blue: 219/255, alpha: 1),
                    CGColor(red: 255/255, green: 201/255, blue: 71/255, alpha: 1),
                    CGColor(red: 239/255, green: 239/255, blue: 0, alpha: 1)]
                gradientLayer.locations = [0.09, 0.15, 0.2]
                gradientLayer.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
            
                view.layer.addSublayer(gradientLayer)
                gradientLayer.mask = kLayer
            //K動畫
                    let animation = CABasicAnimation(keyPath: "transform.scale.x")
                    animation.fromValue = 2
                    animation.toValue = 1
                    animation.duration = 3
                    kLayer.add(animation, forKey: nil)
                }

            
            func writeLetterE(){
            //Ｅ路徑
                let ePath = UIBezierPath()
                ePath.move(to: CGPoint(x: 249, y: 57))
                ePath.addLine(to: CGPoint(x: 228, y: 57))
                ePath.addLine(to: CGPoint(x: 228, y: 81))
                ePath.addLine(to: CGPoint(x: 249, y: 81))
                ePath.move(to: CGPoint(x: 230, y: 69))
                ePath.addLine(to: CGPoint(x: 247, y: 69))
                
                let eLayer = CAShapeLayer()
                eLayer.path = ePath.cgPath
                eLayer.strokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
                eLayer.lineWidth = 8
                eLayer.fillColor = UIColor.clear.cgColor
                view.layer.addSublayer(eLayer)
            //E漸層
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = nameGradientColor
                gradientLayer.locations = [0.09, 0.15, 0.2]
                gradientLayer.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
                view.layer.addSublayer(gradientLayer)
                gradientLayer.mask = eLayer
            //E動畫
                let animation = CABasicAnimation(keyPath: "strokeEnd")
                animation.fromValue = 0
                animation.toValue = 1
                animation.duration = 3
                eLayer.add(animation, forKey: nil)
                }

              
                    
            func writeLetterV(){
            //畫Ｖ的外框
                let vPath = UIBezierPath()
                vPath.move(to: CGPoint(x: 252, y: 54))
                vPath.addLine(to: CGPoint(x: 264, y: 84))
                vPath.addLine(to: CGPoint(x: 274, y: 84))
                vPath.addLine(to: CGPoint(x: 286, y: 54))
                vPath.addLine(to: CGPoint(x: 277, y: 54))
                vPath.addLine(to: CGPoint(x: 270, y: 74))
                vPath.addLine(to: CGPoint(x: 261, y: 54))
                vPath.close()
                
                let vLayer = CAShapeLayer()
                vLayer.path = vPath.cgPath
                vLayer.strokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
                vLayer.lineWidth = 2
                vLayer.fillColor = UIColor.clear.cgColor
                view.layer.addSublayer(vLayer)
                
                
            //V漸層
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = nameGradientColor
                gradientLayer.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
                gradientLayer.locations = [0.09, 0.15, 0.2]
                view.layer.addSublayer(gradientLayer)
                gradientLayer.mask = vLayer
                
            //V動畫
                let animation = CABasicAnimation(keyPath: "opacity")
                animation.fromValue = 0
                animation.toValue = 1
                animation.duration = 3
                vLayer.add(animation, forKey: nil)
                
            }
            
            
            func writeLetterI(){
            //I路徑
                let iPath = UIBezierPath()
                iPath.move(to: CGPoint(x: 295, y: 53))
                iPath.addLine(to: CGPoint(x: 295, y: 85))
            //顯示I
                let iLayer = CAShapeLayer()
                iLayer.path = iPath.cgPath
                iLayer.strokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
                iLayer.lineWidth = 10
                iLayer.fillColor = UIColor.clear.cgColor
                view.layer.addSublayer(iLayer)
            //I漸層
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = nameGradientColor
                gradientLayer.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
                gradientLayer.locations = [0.09, 0.15, 0.2]
                view.layer.addSublayer(gradientLayer)
                gradientLayer.mask = iLayer
            //I動畫
                let animation = CABasicAnimation(keyPath: "position")
                animation.fromValue = [0, 40]
                animation.toValue = [0, 0]
                animation.duration = 1
                iLayer.add(animation, forKey: nil)
                
            }
        
            func writeLetterN(){
            //畫N的外框
                let nPath = UIBezierPath()
                nPath.move(to: CGPoint(x: 307, y: 54))
                nPath.addLine(to: CGPoint(x: 307, y: 84))
                nPath.addLine(to: CGPoint(x: 316, y: 84))
                nPath.addLine(to: CGPoint(x: 316, y: 71))
                nPath.addLine(to: CGPoint(x: 329, y: 84))
                nPath.addLine(to: CGPoint(x: 337, y: 84))
                nPath.addLine(to: CGPoint(x: 337, y: 54))
                nPath.addLine(to: CGPoint(x: 328, y: 54))
                nPath.addLine(to: CGPoint(x: 328, y: 69))
                nPath.addLine(to: CGPoint(x: 328, y: 70))
                nPath.addLine(to: CGPoint(x: 315, y: 54))
                nPath.close()
            
            //顯示N的外框
                let nLayer = CAShapeLayer()
                nLayer.path = nPath.cgPath
                nLayer.fillColor = UIColor.clear.cgColor
                nLayer.strokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
                nLayer.lineWidth = 2
                view.layer.addSublayer(nLayer)
            
            //N漸層
                let gradientLayer = CAGradientLayer()
                gradientLayer.colors = nameGradientColor
               
                gradientLayer.locations = [0.09, 0.15, 0.2]
                gradientLayer.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
                view.layer.addSublayer(gradientLayer)
                gradientLayer.mask = nLayer
                
                
            }
                

                
    
        addBannerView()

        growHair()
        createArms()
        createBody()
        smile()
        createGlassesFrames()
        createRoundGlasses()
        showEyes()
        appendPupils()
        createHands()
        wearPants()
        putOnShoes()
        pantsLogo()
        writeLetterK()
        writeLetterE()
        writeLetterV()
        writeLetterI()
        writeLetterN()
        
        
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
}
struct ContentView: View {
    var body: some View {
        DrawView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
