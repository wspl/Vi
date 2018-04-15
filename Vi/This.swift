//
//  Set.swift
//  Vi
//
//  Created by Plutonist on 2017/5/31.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit

func this<T: UIView>(_ closure: (_ view: T) -> ()) {
    closure(ViTick.view as! T)
}

func this<T: UIView>(_ type: T.Type, _ closure: (_ view: T) -> ()) {
    closure(ViTick.view as! T)
}
