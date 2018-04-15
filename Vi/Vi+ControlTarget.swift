//
//  Vi+ControlTarget.swift
//  Vi
//
//  Created by Plutonist on 2017/5/30.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit

class ControlTarget: NSObject {
    typealias Callback = (UIControl) -> ()
    
    let callback: Callback
    
    var view: UIControl { return ViTick.view as! UIControl }

    init(event: UIControlEvents, callback: @escaping Callback) {
        self.callback = callback
        super.init()
        view.addTarget(self, action: #selector(ControlTarget.eventHandler(_:)), for: event)
        objc_setAssociatedObject(view, String(format: "[%d]", arc4random()), self, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    func eventHandler(_ sender: UIControl!) {
        callback(sender)
    }
}
