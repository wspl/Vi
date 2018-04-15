//
//  ViewController.swift
//  Vi
//
//  Created by Plutonist on 2017/5/29.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var theView = UIView()
    var existLabel = UILabel()
    
    func asdf() {
        print("asdffdsa")
    }
    
    var textField = Field<String>("Hehe")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Vi(view)
        FrameComponent() ~> {
            snp.edges.equalToSuperview()
            
            UITextField() ~> {
                text ~= textField

                snp.top.equalToSuperview().offset(30)
                snp.width.equalToSuperview()
            }

            existLabel ~> {
                text ~= textField
                fontSize = 25

                snp.top.equalToSuperview().offset(60)
            }
            
            UILabel() ~> {
                text ~= textField
                
                snp.top.equalTo(existLabel.snp.bottom)
            }
            
            UIView() ~> {
                x = 20
                y = 200
                height = 100
                width = 100
                bgColor = .yellow
            }
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class FrameComponent: ViComponent {
    override func template(slot: ViSlot) {
        UIView() ~> {
            bgColor = .cyan
            snp.edges.equalToSuperview()
            
            slot()
        }
    }
}
