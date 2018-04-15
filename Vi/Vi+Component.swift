//
//  Vi+Component.swift
//  Vi
//
//  Created by Plutonist on 2017/5/30.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import Foundation

typealias ViSlot = () -> ()

class ViComponent {
    func template() {
        preconditionFailure("This method must be overridden")
    }
    
    func template(slot: () -> ()) {
        template()
    }
}
