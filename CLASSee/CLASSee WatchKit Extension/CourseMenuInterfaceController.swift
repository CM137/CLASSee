//
//  CourseMenuInterfaceController.swift
//  CLASSee
//
//  Created by Christopher Mason on 3/29/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import WatchKit
import Foundation

class CourseMenuInterfaceController: WKInterfaceController {

    // For holding the course name sent with the segue to this controller
    var courseName = "";
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        // Set the page title to the course name of the course that was selected
        if let courseName = context as? String {
            self.setTitle(courseName);
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}