//
//  Vi+Tick.swift
//  Vi
//
//  Created by Plutonist on 2017/5/29.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit

func Vi(_ view: UIView) {
    ViTick.view = view
}

class ViTick {
    static var view: UIView = UIView()
    static var prop: ViProp = .none
}
