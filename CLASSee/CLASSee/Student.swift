//
//  Student.swift
//  CLASSee
//
//  Created by Christopher Mason on 3/29/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import Foundation

// Enum for different attendance statuses
enum attendanceStatus {
    case present
    case absent
    case late
}

class Student: NSObject {
    var firstName: String;
    var lastName: String;
    var observations: [String];
    var aStatus: attendanceStatus;
    var tallyValue: Int;
    
    init(firstName: String, lastName: String, observations: [String]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.observations = observations;
        self.aStatus = .absent;
        self.tallyValue = 0;
    }
}
