//
//  PFProgressBar.swift
//  PFProgressBar
//
//  Created by panfuTech on 2018/8/2.
//  Copyright © 2018年 panfuTech. All rights reserved.
//

import UIKit

let margin:CGFloat = 10
class PFProgressBar: UIView {
    // 背景线
    var backgroundLine:UIView?
    // 已完成的进度线
    var completeLine:UIView?
    // 未完成的
    var undoArr:[UIView]!
    // 总进度
    var datasource:[String]?
    //当前的索引
    var index:Int!{
        didSet{
            
            guard index! >=  0 && index! < (self.datasource?.count)! else {
                return
            }
           
            let per_W = self.frame.size.width / CGFloat ((self.datasource?.count)!)
            
            self.completeLine?.frame = CGRect.init(x: (backgroundLine?.frame.origin.x)!, y: (backgroundLine?.frame.origin.y)!, width: per_W * CGFloat (index!), height: (self.backgroundLine?.frame.size.height)!)
            
            let circleVx = self.undoArr[index!]
            
            markI?.center = CGPoint.init(x: circleVx.center.x, y: circleVx.center.y)
            markI?.text   = "S\(index + 1)"
            addAnimation(sender: markI!)
            
            for var i in 0 ..< self.undoArr.count{
                let circleV = self.undoArr[i]
                if i <= index! {
                    
                    circleV.backgroundColor = UIColor.init(red: 255/255.0, green: 0, blue: 0, alpha: 1.0)
                }else{
                    
                    circleV.backgroundColor = UIColor.lightGray
                }
                
            }
        }
    }
    
    var markI:UILabel?
    
    
    init(frame:CGRect,datasource:[String]) {
        
        super.init(frame: frame)
        index = 0
        self.datasource = [String]()//初始化
        self.datasource = datasource
        backgroundLine = UIView.init()
        let line_W = frame.size.width - frame.size.width / CGFloat (datasource.count)
        backgroundLine?.frame  =  CGRect.init(x: 0, y: 0, width: line_W, height: 3)
        backgroundLine?.center = CGPoint.init(x: self.center.x, y: self.frame.size.height / 2)
        backgroundLine?.backgroundColor = UIColor.lightGray
        self.addSubview(backgroundLine!)
        
        let start_X = backgroundLine?.frame.origin.x
        let Per_W = self.frame.size.width / CGFloat (datasource.count)
        self.undoArr = [UIView]()
        for var i in 0 ..< datasource.count{
            
            let circleV = UIView.init(frame: CGRect.init(x: start_X! + Per_W * CGFloat(i) , y: (backgroundLine?.center.y)! -  5.75, width: 13, height: 13))
            circleV.backgroundColor = UIColor.lightGray
            circleV.layer.cornerRadius = CGFloat(13 >> 1)
            self.addSubview(circleV)
            self.undoArr.append(circleV)
            
        }
        
        
        completeLine = UIView.init()
        completeLine?.frame = CGRect.zero
        completeLine?.backgroundColor = UIColor.init(red: 255/255.0, green: 0, blue: 0, alpha: 1.0)
        
        self.addSubview(completeLine!)
        
        markI = UILabel.init(frame: CGRect.init(x: start_X! , y: (backgroundLine?.center.y)! - 11.75, width: 25, height: 25))
        markI?.backgroundColor = UIColor.init(red: 255/255.0, green: 0, blue: 0, alpha: 1.0)
        markI?.text = "S1"
        markI?.textAlignment = .center
        markI?.textColor = UIColor.white
        markI?.layer.cornerRadius = 25 / 2
        markI?.layer.masksToBounds = true
        
        self.addSubview(markI!)
       
    }
    
    func addAnimation(sender:UILabel)  {
        
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1.0
        scaleAnimate.toValue = 1.2
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = 1
        scaleAnimate.duration = 0.3
        sender.layer.add(scaleAnimate, forKey: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
