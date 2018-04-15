//
//  Vi+PropSetters.swift
//  Vi
//
//  Created by Plutonist on 2017/5/29.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit

var height: CGFloat? {
    get {
        ViTick.prop = .height
        return nil
    }
    set(v) {
        ViPropSetup(view: ViTick.view, prop: .height, value: v!)
    }
}

var width: CGFloat? {
    get {
        ViTick.prop = .width
        return nil
    }
    set(v) {
        ViPropSetup(view: ViTick.view, prop: .width, value: v!)
    }
}

var x: CGFloat? {
    get {
        ViTick.prop = .x
        return nil
    }
    set(v) {
        ViPropSetup(view: ViTick.view, prop: .x, value: v!)
    }
}

var y: CGFloat? {
    get {
        ViTick.prop = .y
        return nil
    }
    set(v) {
        ViPropSetup(view: ViTick.view, prop: .y, value: v!)
    }
}


var bgColor: UIColor? {
    get {
        ViTick.prop = .bgColor
        return nil
    }
    set(v) {
        ViPropSetup(view: ViTick.view, prop: .bgColor, value: v!)
    }
}
