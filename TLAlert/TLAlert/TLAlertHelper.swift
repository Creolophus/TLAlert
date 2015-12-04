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
    lazy var actions: [TLAlertAction]? = []
    
    init(title: String?, message: String?, preferredStyle: TLAlertStyle) {
        
        self.title = title
        self.message = message
        self.preferredStyle = preferredStyle
        super.init()
    }
    
    func addAction(action: TLAlertAction) {
        actions?.append(action)
    }
    
    func show(inViewController viewController: UIViewController) {
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle.convertToUIAlertControllerStyle())
            for action in actions! {
                alert .addAction(UIAlertAction(title: action.title, style: action.style.convertToUIAlertActionStyle(), handler: {_ in
                    action.handler?(action)
                }))
            }
            viewController.presentViewController(alert, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
            switch preferredStyle {
            case .ActionSheet:
                TLBlockActionSheet.actionSheet(title, actions: actions).showInViewController(viewController)
            case .Alert:
                TLBlockAlertView.alert(title, actions: actions).show()
            }
        }
    }
}

class TLAlertAction: NSObject {

    var title: String
    
    var style: TLAlertActionStyle
    
    var enabled: Bool
    
    var handler: ((TLAlertAction) -> Void)?
    
    override var description: String {
        return "title = \(title) style = \(style) enabled = \(enabled)"
    }
    
    init(title: String, style: TLAlertActionStyle, enabled: Bool = true, handler: ((TLAlertAction) -> Void)?) {
        
        self.title = title
        self.style = style
        self.enabled = enabled
        self.handler = handler
        super.init()
    }

}

