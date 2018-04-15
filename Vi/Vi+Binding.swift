//
//  Vi+Bind.swift
//  Vi
//
//  Created by Plutonist on 2017/5/31.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit

class ViBinding<Base> {
    public let base: Base
    public var bindings = [String:Any]()
    
    init(_ base: Base) {
        self.base = base
    }
}

extension ViBinding where Base: UILabel {
    var text: Field<String> {
        get {
            return bindings["text"] as! Field<String>
        }
        set(v) {
            bindings["text"] = v
            Field<String>.bind(field: v, closure: { str in
                self.base.text = str
            })
        }
    }
}

extension ViBinding where Base: UITextField {
    var text: Field<String> {
        get {
            return bindings["text"] as! Field<String>
        }
        set(v) {
            bindings["text"] = v
            Field<String>.bind(field: v, closure: { str in
                self.base.text = str
            })
        }
    }
}
