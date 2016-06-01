//
//  ObservationTypeInterfaceController.swift
//  CLASSee
//
//  Created by Christopher Mason on 4/5/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import WatchKit
import Foundation

class ObservationTypeInterfaceController: WKInterfaceController {
    
    // For holding the student name sent with the segue to this controller
    var studentName = "";
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        // Set the page title to the course name of the course that was selected
        if let studentName = context as? String {
            self.studentName = studentName;
            self.setTitle(studentName);
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
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        return self.studentName;
    }
    
    // Button for text inputted observation
    @IBAction func promptTextObservation() {
        // Dummy phrases for demo
        // TODO: get phrases from somewhere
        let phrases = ["Excellent work", "Actively participating", "Not participating", "Acting out", "May need extra assistance", "Extra credit"];
        
        // Present text input
        presentTextInputControllerWithSuggestions(phrases,
                                                  allowedInputMode: .AllowEmoji,
                                                  completion: { (result) -> Void in
                                                    
                                                    if let choice = result {
                                                        print(choice[0])
                                                    }
        })
    }
}