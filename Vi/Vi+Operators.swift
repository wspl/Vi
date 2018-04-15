//
//  Vi+Operators.swift
//  Vi
//
//  Created by Plutonist on 2017/5/29.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit
import SnapKit

@discardableResult
fileprivate func connect<T: UIView> (view: T, closure: (_ closure: T) -> ()) -> T {
    ViTick.view.addSubview(view)
    ViTick.view = view
    
    view.snp.makeConstraints { make in
        snp = make
        closure(view)
    }

    ViTick.view = view.superview ?? UIView()
    return view
}

infix operator ~>

@discardableResult
func ~><T: UIView> (view: T, closure: (_ view: T) -> ()) -> T {
    return connect(view: view, closure: closure)
}

@discardableResult
func ~><T: UIView> (view: T, closure: () -> ()) -> T {
    return connect(view: view) { _ in
        closure()
    }
}

@discardableResult
func ~> (component: ViComponent, closure: () -> ()) -> ViComponent {
    component.template(slot: closure)
    return component
}

infix operator ~=
func ~=<T> (prop: Any, field: Field<T>) {
    Field.bind(prop: prop, field: field)
}
