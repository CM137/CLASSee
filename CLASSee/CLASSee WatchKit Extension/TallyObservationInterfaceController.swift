//
//  TallyObservationInterfaceController.swift
//  CLASSee
//
//  Created by Christopher Mason on 4/5/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import WatchKit
import Foundation

class TallyObservationInterfaceController: WKInterfaceController {
    
    // Button connected to subtract button
    @IBOutlet var subtractTallyButton: WKInterfaceButton!
    
    // Label showing the current tally
    @IBOutlet var currentTallyLabel: WKInterfaceLabel!
    
    // Int holding count for tally
    var currentTally = 0;
    
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
        
        if currentTally == 0 {
            subtractTallyButton.setEnabled(false)
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
    
    // Action when subtract button is pressed
    @IBAction func subtractFromTally() {
        // If current tally is 0 do not subtract from the tally, otherwise subtract and update tally
        if currentTally > 0 {
            currentTally = currentTally - 1
            updateTally(currentTally);
        }
        
        // If tally is now zero, disable the button
        if currentTally == 0 {
            subtractTallyButton.setEnabled(false)
        }
    }
    
    // Action when add button is pressed
    @IBAction func addToTally() {
        // Update tally and label
        currentTally = currentTally + 1
        updateTally(currentTally);
        
        // Ensure subtract button is enabled
        if currentTally > 0 {
            subtractTallyButton.setEnabled(true)
        }
    }
    
    // Update the tally label
    func updateTally(value: Int) {
        currentTallyLabel.setText("\(currentTally)")
    }
    
    // Shows an alert asking to submit tally
    func showPopup(){
        
        // Currently just pops out of tally view for demo
        // TODO: Actually submit tally
        let h0 = {
            self.popController();
        };
        
        let action1 = WKAlertAction(title: "Yes", style: .Default, handler:h0);
        let action2 = WKAlertAction(title: "No", style: .Cancel) {};
        
        presentAlertControllerWithTitle("", message: "Are you sure you want to submit this tally?", preferredStyle: .Alert, actions: [action1, action2]);
    }
    
    // Submit the tally
    @IBAction func submitTally() {
        showPopup()
    }
}