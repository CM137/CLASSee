//
//  InterfaceController.swift
//  CLASSee WatchKit Extension
//
//  Created by Christopher Mason on 3/21/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import WatchKit
import Foundation


class CoursesInterfaceController: WKInterfaceController {
    
    // Outlet for the table view listing available courses
    @IBOutlet var coursesListTableView: WKInterfaceTable!
    
    // Dummy data for demo
    let courses: [Course] = [Course(name: "PHI102",time: "Online",location: "Online", studentsList: []),
                             Course(name: "PHY142",time: "MWF 11:00-11:50",location: "South Campus Gym", studentsList: []),
                             Course(name: "MAT413",time: "M 2:00-3:00",location: "25 Uni. Rm. 179", studentsList: []),
                             Course(name: "MAT493", time: "MWF 10:00-10:50", location: "25 Uni. Rm. 125", studentsList: [])];

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        setupCoursesTable(courses);
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // Setup the table view with courses
    func setupCoursesTable(courses: [Course]) {
        // Set the number of rows in the table
        coursesListTableView.setNumberOfRows(courses.count, withRowType: "CoursesRow")
        
        // Set a row controller for each row in the table
        // Row controller of special class type CoursesRow (necessary for table view controllers)
        for i in 0 ..< courses.count {
            if let row = coursesListTableView.rowControllerAtIndex(i) as? CoursesRow {
                row.courseNameLabel.setText(courses[i].getName());
                row.courseTimeLabel.setText(courses[i].getTime());
                row.courseLocationLabel.setText(courses[i].getLocation());
            }
        }
    }
    
    // Send the course name with the segue for display in next screen
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        return courses[rowIndex].getName();
    }
}
