//
//  AttendanceInterfaceController.swift
//  CLASSee
//
//  Created by Christopher Mason on 3/29/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import WatchKit
import Foundation

class AttendanceInterfaceController: WKInterfaceController {
    
    // Outlet for the table view listing students on the roster
    @IBOutlet var rosterTableView: WKInterfaceTable!
    
    // Dummy student data for demo
    let students: [Student] = [Student(firstName: "John", lastName: "Appleseed", observations: []),
                               Student(firstName: "Larry", lastName: "Brightside", observations: []),
                               Student(firstName: "Maxwell", lastName: "Cornelius", observations: []),
                               Student(firstName: "Heather", lastName: "Finnigan", observations: []),
                               Student(firstName: "Lucy", lastName: "Hainsworth", observations: []),
                               Student(firstName: "Sarah", lastName: "Jones", observations: []),
                               Student(firstName: "Patrick", lastName: "Mayflower", observations: []),
                               Student(firstName: "Jennifer", lastName: "Peters", observations: []),
                               Student(firstName: "Dante", lastName: "Trumundi", observations: []),
                               Student(firstName: "Lorraine", lastName: "Williams", observations: [])];
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        setupRosterTable(students);
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // Demo attendance state change when pressing on a student in list
    // Changes from red to green for checking in
    // Changes from green to red for checking out
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        // Change attendance status on record
        students[rowIndex].setAttendanceStatus(!students[rowIndex].getAttendanceStatus());
        
        // Check if student is checked in or not and change to correct color
        if (students[rowIndex].getAttendanceStatus()) {
            (table.rowControllerAtIndex(rowIndex) as! StudentsRow).setStudentBackgroundColor(UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5));
        } else {
            (table.rowControllerAtIndex(rowIndex) as! StudentsRow).setStudentBackgroundColor(UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5));
        }
    }
    
    // Setup the table view with students
    func setupRosterTable(students: [Student]) {
        // Set the number of rows in the table
        rosterTableView.setNumberOfRows(students.count, withRowType: "StudentsRow")
        
        // Set a row controller for each row in the table
        // Row controller of special class type StudentsRow (necessary for table view controllers)
        for i in 0 ..< students.count {
            if let row = rosterTableView.rowControllerAtIndex(i) as? StudentsRow {
                // Set the name labels and default color to red
                row.studentFirstNameLabel.setText(students[i].getFirstName());
                row.studentLastNameLabel.setText(students[i].getLastName());
                row.setStudentBackgroundColor(UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5));
            }
        }
    }
    
    // Shows an alert asking to submit attendance
    func showPopup(){
        
        // Currently just pops out of attendance view for demo
        // TODO: Actuall submit attendance
        let h0 = {
            self.popController();
        };
        
        let action1 = WKAlertAction(title: "Yes", style: .Default, handler:h0);
        let action2 = WKAlertAction(title: "No", style: .Destructive) {};
        
        presentAlertControllerWithTitle("", message: "Are you sure you want to submit attendance?", preferredStyle: .ActionSheet, actions: [action1, action2]);
    }
    
    
    // Action for pressing the submit button
    @IBAction func submitAttendance() {
        showPopup();
    }
}
