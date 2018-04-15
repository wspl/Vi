//
//  Layout.swift
//  Vi
//
//  Created by Plutonist on 2017/5/31.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit
import SnapKit

var text: String {
    get {
        ViTick.prop = .text
        return ""
    }
    set(v) {
        ViPropSetup(view: ViTick.view, prop: .text, value: v)
    }
}

var fontSize: CGFloat {
    get {
        ViTick.prop = .fontSize
        return 0
    }
    set(v) {
        ViPropSetup(view: ViTick.view, prop: .fontSize, value: v)
    }
}


var snp: ConstraintMaker!
