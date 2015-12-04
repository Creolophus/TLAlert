//
//  TLAlertIOS7.swift
//  TLAlertDemo
//
//  Created by Creolophus on 12/3/15.
//  Copyright © 2015 liang.tao. All rights reserved.
//

import UIKit

@available(iOS 7.0, *)
class TLBlockActionSheet: UIActionSheet, iOS7AlertProtocol, ActionSheetType {
    var actions: [TLAlertAction] = []
    
    static func actionSheet(title: String?, actions: [TLAlertAction]?) -> TLBlockActionSheet {

        var actionSheet = TLBlockActionSheet()
        
        if let title = title {
            actionSheet.title = title
        }
        
        if let actions = actions {
            actionSheet.actions = actions
            actionSheet.configActions()
            actionSheet.delegate = actionSheet
        }
        
        return actionSheet
    }
    
    func showInViewController(viewController: UIViewController) {
        showInView(viewController.view)
    }
}

extension TLBlockActionSheet: UIActionSheetDelegate {
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        actions[buttonIndex].handler?(actions[buttonIndex])
    }
}

@available(iOS 7.0, *)
class TLBlockAlertView: UIAlertView, iOS7AlertProtocol {
    var actions: [TLAlertAction] = []
    
    static func alert(title: String?, actions: [TLAlertAction]?) -> TLBlockAlertView {
        var alertView = TLBlockAlertView()
        
        if let title = title {
            alertView.title = title
        }
        
        if let actions = actions {
            alertView.actions = actions
            alertView.configActions()
            alertView.delegate = alertView
        }
        return alertView
    }
}

extension TLBlockAlertView: UIAlertViewDelegate {
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        actions[buttonIndex].handler?(actions[buttonIndex])
    }
}

private protocol iOS7AlertProtocol {
    
    var actions: [TLAlertAction] { get set }
    var cancelButtonIndex: Int { get set }
    
    func addButtonWithTitle(title: String?) -> Int // returns index of button. 0 based.
    mutating func configActions()
}

extension iOS7AlertProtocol {
    mutating func configActions() {
        for action in actions {
            addButtonWithTitle(action.title)
            if action.style == .Cancel {
                cancelButtonIndex = actions.indexOf(action)!
            }
        }
    }
}

extension iOS7AlertProtocol where Self: ActionSheetType {
    mutating func configActions() {
        for action in actions {
            addButtonWithTitle(action.title)
            if action.style == .Cancel {
                cancelButtonIndex = actions.indexOf(action)!
            } else if action.style == .Destructive {
                destructiveButtonIndex = actions.indexOf(action)!
            }
        }
    }

}

private protocol ActionSheetType {
    var destructiveButtonIndex: Int { get set }
}

