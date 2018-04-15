//
//  Vi+Prop.swift
//  Vi
//
//  Created by Plutonist on 2017/5/30.
//  Copyright © 2017年 Plutonist. All rights reserved.
//

import UIKit

enum ViProp {
    case none
    
    // UIView
    case height
    case width
    case x
    case y
    case bgColor
    
    // UILabel
    case text
    case fontSize
}

let UIViewProps: [ViProp] = [
    .height,
    .width,
    .x,
    .y,
    .bgColor
]

let UILabelProps: [ViProp] = [
    .text,
    .fontSize
]

class ViPropSetup {
    let view: UIView
    let prop: ViProp
    let value: Any
    
    var stringValue: String {
        switch value {
        case is String:
            return value as! String
        case is Float, is Double, is Bool, is Int, is CGFloat:
            return "\(value)"
        default:
            return ""
        }
    }
    
    var cgFloatValue: CGFloat {
        switch value {
        case is CGFloat:
            return value as! CGFloat
        case let v as Float:
            return CGFloat(v)
        case let v as Double:
            return CGFloat(v)
        case let v as Int:
            return CGFloat(v)
        default: return 0
        }
    }
    
    var uiColorValue: UIColor {
        switch value {
        case is UIColor:
            return value as! UIColor
        default: return UIColor.clear
        }
    }
    
    var boolValue: Bool {
        return value as! Bool
    }
    
    @discardableResult
    init(view: UIView, prop: ViProp, value: Any) {
        self.view = view
        self.prop = prop
        self.value = value
        
        bypass()
    }
    
    func bypass() {
        if UIViewProps.contains(prop) {
            originView()
        } else {
            bypassView()
        }
    }
    
    func bypassView() {
        switch view {
        case is UILabel: label()
        case is UITextField: textField()
        default: originView()
        }
    }
    
    func label() {
        let v = view as! UILabel
        switch prop {
        case .text:
            v.text = stringValue
        case .fontSize:
            v.font = v.font?.withSize(cgFloatValue)
        default: break
        }
    }
    
    func textField() {
        let v = view as! UITextField
        switch prop {
        case .text:
            v.text = stringValue
        case .fontSize:
            v.font = v.font?.withSize(cgFloatValue)
        default: break
        }
    }
    
    func originView() {
        switch prop {
        case .height:
            view.frame = CGRect(
                x: view.frame.origin.x,
                y: view.frame.origin.y,
                width: view.frame.width,
                height: cgFloatValue)
        case .width:
            view.frame = CGRect(
                x: view.frame.origin.x,
                y: view.frame.origin.y,
                width: cgFloatValue,
                height: view.frame.height)
        case .x:
            view.frame = CGRect(
                x: cgFloatValue,
                y: view.frame.origin.y,
                width: view.frame.width,
                height: view.frame.height)
        case .y:
            view.frame = CGRect(
                x: view.frame.origin.x,
                y: cgFloatValue,
                width: view.frame.width,
                height: view.frame.height)
        case .bgColor:
            view.backgroundColor = uiColorValue
        default: break
        }
    }
}
