//
//  ViewController.swift
//  TLAlert
//
//  Created by Creolophus on 12/3/15.
//  Copyright © 2015 liang.tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlertView(sender: UIButton) {
        
        let alert = TLAlertHelper(title: "Alert", message: "message", preferredStyle: .Alert)
        alert.addAction(TLAlertAction(title: "ActionDefault", style: .Default, handler: { (alertAction) in
            print("you press the \(alertAction)")
        }))
        alert.addAction(TLAlertAction(title: "ActionDefault2", style: .Default, handler: { (alertAction) in
            print("you press the \(alertAction)")
        }))
        alert.addAction(TLAlertAction(title: "ActionCancel", style: .Cancel, handler: {
            print("you press the \($0)")
        }))
        alert.show(inViewController: self)
    }

    @IBAction func ShowActionSheet(sender: AnyObject) {
        let actionSheet = TLAlertHelper(title: "ActionSheet", message: "message", preferredStyle: .ActionSheet)
        actionSheet.addAction(TLAlertAction(title: "ActionDefault", style: .Default, handler: { (alertAction) -> Void in
            print("you press the \(alertAction)")
        }))
        actionSheet.addAction(TLAlertAction(title: "ActionCancel", style: .Cancel, handler: { (alertAction) -> Void in
            print("you press the \(alertAction)")
        }))
        actionSheet.addAction(TLAlertAction(title: "ActionDefault2", style: .Default, enabled: false) {
            print("you press the \($0)")
        })
        actionSheet.addAction(TLAlertAction(title: "ActionDestructive", style: .Destructive, handler: { (alertAction) -> Void in
            print("you press the \(alertAction)")
        }))
        actionSheet.show(inViewController: self)
    }
}
