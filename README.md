# TLAlert
---

1.可以让你在需要支持iOS7的项目中使用类似UIAlertController的方式展现AlertView和ActionSheet.

2.在iOS 7中使用UIAlertView和UIActionSheet

3.在iOS 8以后的版本中使用UIAlertController

## Usage

将TLAlert导入工程即可

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
        
## Demo
![actionsheet](https://github.com/Creolophus/TLAlert/blob/master/actionsheet.png?raw=true)
![alertview](https://github.com/Creolophus/TLAlert/blob/master/alertview.png?raw=true)
