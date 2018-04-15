//
//  Vi+Event.swift
//  Vi
//
//  Created by Plutonist on 2017/5/30.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit

func onChange(_ closure: @escaping (_ text: String?) -> ()) {
    _ = ControlTarget(event: .editingChanged) { control in
        switch control {
        case let textField as UITextField:
            closure(textField.text)
        default: break
        }
    }
}
