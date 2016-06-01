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
    
    //TODO: Fetch data from somewhere
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
    // Changes from green to yellow for marking late
    // Changes from yellow to red for checking out
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        // Change attendance status on record and change color of row
        switch students[rowIndex].aStatus {
        case .absent:
            (table.rowControllerAtIndex(rowIndex) as! StudentsRow).setStudentBackgroundColor(UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5));
            students[rowIndex].aStatus = .present;
            break;
        case .present:
            (table.rowControllerAtIndex(rowIndex) as! StudentsRow).setStudentBackgroundColor(UIColor.init(red: 1.0, green: 1.0, blue: 0.0, alpha: 0.5));
            students[rowIndex].aStatus = .late;
            break;
        case .late:
            (table.rowControllerAtIndex(rowIndex) as! StudentsRow).setStudentBackgroundColor(UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5));
            students[rowIndex].aStatus = .absent;
            break;
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
                // Set the name labels
                row.studentFirstNameLabel.setText(students[i].firstName);
                row.studentLastNameLabel.setText(students[i].lastName);
                
                // Set color based on attendance status
                // Red - Absent, Green - Present, Yellow - Late
                switch students[i].aStatus {
                case .absent:
                    row.setStudentBackgroundColor(UIColor.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5));
                    break;
                case .present:
                    row.setStudentBackgroundColor(UIColor.init(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.5));
                    break;
                case .late:
                    row.setStudentBackgroundColor(UIColor.init(red: 1.0, green: 1.0, blue: 0.0, alpha: 0.5));
                    break;
                }
            }
        }
    }
    
    // Shows an alert asking to submit attendance
    func showPopup(){
        
        // Currently just pops out of attendance view for demo
        // TODO: Actually submit attendance
        let h0 = {
            self.popController();
        };
        
        let action1 = WKAlertAction(title: "Yes", style: .Default, handler:h0);
        let action2 = WKAlertAction(title: "No", style: .Cancel) {};
        
        presentAlertControllerWithTitle("", message: "Are you sure you want to submit the attendance?", preferredStyle: .Alert, actions: [action1, action2]);
    }
    
    
    // Action for pressing the submit button
    @IBAction func submitAttendance() {
        showPopup();
    }
}
