//
//  Test.swift
//  TLAlertDemo
//
//  Created by Creolophus on 12/3/15.
//  Copyright © 2015 liang.tao. All rights reserved.
//

import UIKit

class TLAlertHelper: NSObject {
    var title: String?
    var message: String?
    var preferredStyle: TLAlertStyle
    var actions: [TLAlertAction]?
    
    init(title: String?, message: String?, preferredStyle: TLAlertStyle) {
        
        self.title = title
        self.message = message
        self.preferredStyle = preferredStyle
        super.init()
    }
    
    func show(viewController: UIViewController) {
        switch preferredStyle {
        case .ActionSheet:
            TLBlockActionSheet.actionSheet(title, actions: actions).showInViewController(viewController)
        case .Alert:
        }
    }
}

class TLAlertAction: NSObject {

    var title: String?
    
    var style: TLAlertActionStyle
    
    var enabled: Bool
    
    var handler: ((TLAlertAction) -> Void)?
    
    init(title: String?, style: TLAlertActionStyle, enabled: Bool = true, handler: ((TLAlertAction) -> Void)?) {
        
        self.title = title
        self.style = style
        self.enabled = enabled
        self.handler = handler
        super.init()
    }
}

