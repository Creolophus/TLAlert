//
//  TLAlertDefine.swift
//  TLAlertDemo
//
//  Created by Creolophus on 12/3/15.
//  Copyright © 2015 liang.tao. All rights reserved.
//

import Foundation
import UIKit

/**
 enum like UIAlertControllerStyle
 
 - ActionSheet: UIActionSheet
 - Alert:       UIAlert
 */
enum TLAlertStyle: Int {
    
    case ActionSheet
    case Alert
    
    @available(iOS 8.0, *)
    func convertToUIAlertControllerStyle() -> UIAlertControllerStyle {
        return UIAlertControllerStyle(rawValue: self.rawValue)!
    }
}


/**
 enum like UIAlertActionStyle
 
 - Default:     UIAlertActionStyle.Default
 - Cancel:      UIAlertActionStyle.Cancel
 - Destructive: UIAlertActionStyle.Destructive
 */
enum TLAlertActionStyle : Int {
    
    case Default
    case Cancel
    case Destructive
    
    @available(iOS 8.0, *)
    func convertToUIAlertActionStyle() -> UIAlertActionStyle {
        return UIAlertActionStyle(rawValue: self.rawValue)!
    }
}