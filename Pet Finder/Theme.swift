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
    
    var barStyle: UIBarStyle {
        switch self {
        case .Default, .Graphical:
            return .default
        case .Dark:
            return .black
        }
    }
    
    var navigationBackgroundImage: UIImage? {
        return self == .Graphical ? UIImage(named: "navBackground") : nil
    }
    
    
    
    var tabBarBackgroundImage: UIImage? {
        return self == .Graphical ? UIImage(named: "tabBarBackground") : nil
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .Default, .Graphical:
            return UIColor(white: 0.9, alpha: 1.0)
        case .Dark:
            return UIColor(white: 0.8, alpha: 1.0)
        }
    }
    
    var secondaryColor: UIColor {
        switch self {
        case .Default:
            return UIColor(red: 242.0/255.0, green: 101.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        case .Dark:
            return UIColor(red: 34.0/255.0, green: 128.0/255.0, blue: 66.0/255.0, alpha: 1.0)
        case .Graphical:
            return UIColor(red: 140.0/255.0, green: 50.0/255.0, blue: 48.0/255.0, alpha: 1.0)
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
    
    
    static func apply(theme: Theme) {
        // 1
        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        
        // 2
        let sharedApplication = UIApplication.shared
        sharedApplication.delegate?.window??.tintColor = theme.mainColor
        
        UINavigationBar.appearance().barStyle = theme.barStyle
        UINavigationBar.appearance().setBackgroundImage(theme.navigationBackgroundImage, for: .default)
        
       //MARK: NavBar
        // back 按钮自定义  https://koenig-media.raywenderlich.com/uploads/2015/06/mask1.gif
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "backArrow")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrowMask")
      
        // 使得back 按钮的字样在作 回退的时候是潜入到回退图标的下面 https://koenig-media.raywenderlich.com/uploads/2015/06/mask2.gif
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrow")
        
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "backArrowMaskFixed")
        
        
        //MARK:  TabBar
        
        UITabBar.appearance().barStyle = theme.barStyle
        UITabBar.appearance().backgroundImage = theme.tabBarBackgroundImage
        
        let tabIndicator = UIImage(named: "tabBarSelectionIndicator")?.withRenderingMode(.alwaysTemplate)
        let tabResizableIndicator = tabIndicator?.resizableImage(
            withCapInsets: UIEdgeInsets(top: 0, left: 2.0, bottom: 0, right: 2.0))
        UITabBar.appearance().selectionIndicatorImage = tabResizableIndicator
        
        //MARK: Segment Control
        
        // resizeable slice image
        let controlBackground = UIImage(named: "controlBackground")?
            .withRenderingMode(.alwaysTemplate)
            .resizableImage(withCapInsets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        let controlSelectedBackground = UIImage(named: "controlSelectedBackground")?
            .withRenderingMode(.alwaysTemplate)
            .resizableImage(withCapInsets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3))
        
        UISegmentedControl.appearance().setBackgroundImage(controlBackground, for: .normal ,barMetrics: .default)
        
        UISegmentedControl.appearance().setBackgroundImage(controlSelectedBackground, for: .selected,
            
                                                           barMetrics: .default)
       
        //MARK: UIStepper
        UIStepper.appearance().setBackgroundImage(controlBackground, for: .normal)
        UIStepper.appearance().setBackgroundImage(controlBackground, for: .disabled)
        UIStepper.appearance().setBackgroundImage(controlBackground, for: .highlighted)
        UIStepper.appearance().setDecrementImage(UIImage(named: "fewerPaws"), for: .normal)
        UIStepper.appearance().setIncrementImage(UIImage(named: "morePaws"), for: .normal)
        
        
        //MARK: UISlider
        UISlider.appearance().setThumbImage(UIImage(named: "sliderThumb"), for: .normal)
        
        UISlider.appearance().setMaximumTrackImage(UIImage(named: "maximumTrack")?
            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0.0, bottom: 0, right: 6.0)),for: .normal)
        
        UISlider.appearance().setMinimumTrackImage(UIImage(named: "minimumTrack")?
            .withRenderingMode(.alwaysTemplate)
            .resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 6.0, bottom: 0, right: 0)),for: .normal)
        
        UISwitch.appearance().onTintColor = theme.mainColor.withAlphaComponent(0.8)
        UISwitch.appearance().thumbTintColor = theme.mainColor
        
        
    }
    
    
 
    
    
    
    
    
}

