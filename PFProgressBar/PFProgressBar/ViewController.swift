//
//  ViewController.swift
//  PFProgressBar
//
//  Created by panfuTech on 2018/8/2.
//  Copyright © 2018年 panfuTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var progressBar : PFProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // example
        progressBar = PFProgressBar.init(frame: CGRect.init(x:0, y:50, width:self.view.bounds.size.width, height:50), datasource: ["S1","S2","S3","S4","S5"])
        self.view.addSubview(progressBar)
        
        let preStepBtn : UIButton = UIButton.init(frame: CGRect.init(x:20, y:150, width:self.view.bounds.size.width-40, height:34))
        preStepBtn.setTitle("前一步", for: UIControlState.normal)
        preStepBtn.backgroundColor = UIColor.red
        preStepBtn.addTarget(self, action: #selector(self.preStepAction), for: .touchUpInside)
        self.view.addSubview(preStepBtn)
        
        let netStepBtn = UIButton.init(frame: CGRect.init(x:20, y:200, width:self.view.bounds.size.width-40, height:34))
        netStepBtn.setTitle("后一步", for: UIControlState.normal)
        netStepBtn.backgroundColor = UIColor.red
        netStepBtn.addTarget(self, action:#selector(self.nextStepAction), for: .touchUpInside)
        self.view.addSubview(netStepBtn)
        
    }

    @objc func preStepAction() {
        if progressBar.index < 1  {
            return
        }
        progressBar.index  = progressBar.index - 1
    }
    
    @objc func nextStepAction() {
        if progressBar.index >= (progressBar.datasource?.count)!-1 {
            return
        }
        progressBar.index = progressBar.index + 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

