//
//  StudentsRow.swift
//  CLASSee
//
//  Created by Christopher Mason on 4/3/16.
//  Copyright © 2016 West Chester University. All rights reserved.
//

import Foundation
import WatchKit
import UIKit

class StudentsRow: NSObject {
    @IBOutlet var studentGroup: WKInterfaceGroup!
    @IBOutlet var studentFirstNameLabel: WKInterfaceLabel!
    @IBOutlet var studentLastNameLabel: WKInterfaceLabel!
    
    // Change color of table row background
    func setStudentBackgroundColor(bgColor: UIColor) {
        studentGroup.setBackgroundColor(bgColor);
    }
}