//
//  TLAlertDefine.swift
//  TLAlertDemo
//
//  Created by Creolophus on 12/3/15.
//  Copyright © 2015 liang.tao. All rights reserved.
//

import Foundation

/**
 enum like UIAlertControllerStyle
 
 - ActionSheet: UIActionSheet
 - Alert:       UIAlert
 */
enum TLAlertStyle: Int {
    
    case ActionSheet
    case Alert
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
}