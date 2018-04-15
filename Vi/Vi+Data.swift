//
//  Vi+Data.swift
//  Vi
//
//  Created by Plutonist on 2017/5/30.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit

class Field<T> {
    var rawValue: T
    var value: T {
        get {
            return rawValue
        }
        set(v) {
            rawValue = v
            self.publish()
        }
    }
    
    init(_ defaultValue: T) {
        rawValue = defaultValue
    }
    
    var subscribers = [(view: UIView, prop: ViProp)]()
    
    func addSubscriber(view: UIView, prop: ViProp) {
        subscribers.append((view: view, prop: prop))
    }
    
    func publish() {
        subscribers.forEach { subscriber in
            ViPropSetup(view: subscriber.view, prop: subscriber.prop, value: value)
        }
    }
    
    static func bind(prop: Any, field: Field<T>) {
        field.addSubscriber(view: ViTick.view, prop: ViTick.prop)
        field.publish()
        if (ViTick.view as? UIControl) != nil {
            onChange { val in
                if let val = val as? T {
                    field.value = val
                }
            }
        }
    }
}
