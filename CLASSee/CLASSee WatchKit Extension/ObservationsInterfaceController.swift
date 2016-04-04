//
//  ObservationsInterfaceController.swift
//  CLASSee
//
//  Created by Christopher Mason on 3/29/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import WatchKit
import Foundation

class ObservationsInterfaceController: WKInterfaceController {
    
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
    
    // Setup the table view with students
    func setupRosterTable(students: [Student]) {
        // Set the number of rows in the table
        rosterTableView.setNumberOfRows(students.count, withRowType: "StudentsRow")
        
        // Set a row controller for each row in the table
        // Row controller of special class type StudentsRow (necessary for table view controllers)
        for i in 0 ..< students.count {
            if let row = rosterTableView.rowControllerAtIndex(i) as? StudentsRow {
                // Set the name labels
                row.studentFirstNameLabel.setText(students[i].getFirstName());
                row.studentLastNameLabel.setText(students[i].getLastName());
            }
        }
    }
    
}