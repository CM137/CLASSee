//
//  Student.swift
//  CLASSee
//
//  Created by Christopher Mason on 3/29/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import Foundation

class Student: NSObject {
    var firstName: String;
    var lastName: String;
    var observations: [String];
    var inToday: Bool;
    
    init(firstName: String, lastName: String, observations: [String]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.observations = observations;
        self.inToday = false;
    }
    
    func getFirstName() -> String {
        return firstName;
    }
    
    func getLastName() -> String {
        return lastName;
    }
    
    func getAttendanceStatus() -> Bool {
        return inToday;
    }
    
    func setAttendanceStatus(status: Bool) {
        self.inToday = status;
    }
}
