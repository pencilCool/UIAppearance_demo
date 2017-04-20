//
//  Theme.swift
//  Pet Finder
//
//  Created by tangyuhua on 2017/4/20.
//  Copyright © 2017年 Ray Wenderlich. All rights reserved.
//

import UIKit

enum Theme:Int {
    case Default, Dark, Graphical
    
    var mainColor: UIColor {
        switch self {
        case .Default:
            return UIColor(red: 87.0/255.0, green: 188.0/255.0, blue: 95.0/255.0, alpha: 1.0)
        case .Dark:
            return UIColor(red: 242.0/255.0, green: 101.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        case .Graphical:
            return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        }
    }
}

let SelectedThemeKey = "SelectedTheme"
struct ThemeManager {
    

    static func currentTheme() -> Theme {
        if let storedTheme = (UserDefaults.standard.value(forKey: SelectedThemeKey) as AnyObject).integerValue {
            return Theme(rawValue:storedTheme)!
        } else {
            return .Default
        }
    }
    
    
}

