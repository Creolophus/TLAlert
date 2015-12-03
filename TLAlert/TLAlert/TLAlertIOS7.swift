//
//  TLAlertIOS7.swift
//  TLAlertDemo
//
//  Created by Creolophus on 12/3/15.
//  Copyright © 2015 liang.tao. All rights reserved.
//

import UIKit

@available(iOS 7.0, *)
class TLBlockActionSheet: UIActionSheet, iOS7AlertProtocol {
    var actions: [TLAlertAction]!
    
    static func actionSheet(title: String, actions: [TLAlertAction]) -> TLBlockActionSheet {
        
        var actionSheet = TLBlockActionSheet(title: <#T##String?#>, delegate: <#T##UIActionSheetDelegate?#>, cancelButtonTitle: <#T##String?#>, destructiveButtonTitle: <#T##String?#>)
        actionSheet.title = title
        actionSheet.delegate = actionSheet
        actionSheet.actions = actions
        actionSheet.configActions()
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

private protocol iOS7AlertProtocol {
    
    var actions: [TLAlertAction]! { get set }
    var cancelButtonIndex: Int { get set }
    
    mutating func configActions()
    func addButtonWithTitle(title: String?) -> Int // returns index of button. 0 based.

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