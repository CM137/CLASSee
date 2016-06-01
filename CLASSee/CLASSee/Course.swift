//
//  Course.swift
//  CLASSee
//
//  Created by Christopher Mason on 3/29/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import Foundation
import WatchKit

class Course: NSObject {
    var name: String;
    var time: String;
    var location: String;
    var studentsList: [Student];
    
    init(name: String, time: String, location: String, studentsList: [Student]) {
        self.name = name;
        self.time = time;
        self.location = location;
        self.studentsList = studentsList;
    }
}