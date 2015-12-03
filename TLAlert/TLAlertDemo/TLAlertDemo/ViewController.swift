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
        UIAlertView(title: "title", message: "message", delegate: self, cancelButtonTitle: "cancel", otherButtonTitles: "biu1", "biu2", "biu3").show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlertView(sender: UIButton) {
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: "title", message: "message", preferredStyle: .Alert)
            let action1 = UIAlertAction(title: "action1", style: .Default, handler: { (action) -> Void in
                if let title = action.title {
                    print(title)
                }
            })
            alert.addAction(action1)
            alert.addAction(UIAlertAction(title: "action2", style: .Default, handler: nil))
            alert.addAction(UIAlertAction(title: "cancel", style: .Cancel, handler: nil))
            if #available(iOS 9.0, *) {
                alert.preferredAction = action1
            } else {
                // Fallback on earlier versions
            }
//            navigationController?.pushViewController(alert, animated: true)
            self.presentViewController(alert, animated: true, completion: { () -> Void in
                print("ffffff")
            })
        } else {
            // Fallback on earlier versions
        }
    }

    @IBAction func ShowActionSheet(sender: AnyObject) {
    }
}


extension ViewController: UIAlertViewDelegate {
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        print(buttonIndex)
    }
}
