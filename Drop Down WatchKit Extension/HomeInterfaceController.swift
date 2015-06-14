//
//  InterfaceController.swift
//  Drop Down WatchKit Extension
//
//  Created by VLT Labs on 6/14/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

import WatchKit
import Foundation


class HomeInterfaceController: WKInterfaceController {

    @IBOutlet weak var pushUpQuantityLabel: WKInterfaceLabel!
    @IBOutlet weak var doItButton: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("numberOfPushups") == nil {
            
            self.presentControllerWithName("settingPushupController", context: nil)
            
        }
        else {
            
            var pushUpQuantity = NSUserDefaults.standardUserDefaults().objectForKey("numberOfPushups") as! Int?
            
            self.pushUpQuantityLabel.setText("\(pushUpQuantity!)")
            self.pushUpQuantityLabel.setTextColor(UIColor.redColor())
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    @IBAction func setPushUpsTapped() {
    self.presentControllerWithName("settingPushupController", context: nil)
        
    }
    
    
}
