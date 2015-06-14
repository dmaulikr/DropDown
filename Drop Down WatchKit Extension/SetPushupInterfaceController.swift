//
//  SetPushupInterfaceController.swift
//  Drop Down
//
//  Created by VLT Labs on 6/14/15.
//  Copyright (c) 2015 Jay Ang. All rights reserved.
//

import WatchKit
import Foundation


class SetPushupInterfaceController: WKInterfaceController {

    @IBOutlet weak var confirmButton: WKInterfaceButton!
    @IBOutlet weak var pushUpSlider: WKInterfaceSlider!
    @IBOutlet weak var pushUpLabel: WKInterfaceLabel!
    
    var pushUpQuantity = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.pushUpLabel.setText("10")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        var pushUpCount = NSUserDefaults.standardUserDefaults().objectForKey("numberOfPushups") as! Int?
        
        if pushUpCount != nil {
            self.pushUpQuantity = pushUpCount!
            self.pushUpSlider.setValue(Float(pushUpCount!))
            self.pushUpLabel.setText("\(pushUpCount!)")
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func onPushUpSliderValuePressed(value: Float) {
        
        var pushUpCount = Int(value)
        self.pushUpQuantity = pushUpCount
        self.pushUpLabel.setText("\(pushUpCount)")
        
    }

    @IBAction func onConfirmButtonPressed() {
        
        NSUserDefaults.standardUserDefaults().setObject(self.pushUpQuantity, forKey: "numberOfPushups")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.dismissController()
    }
}
