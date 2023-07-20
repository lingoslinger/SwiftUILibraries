//
//  String+LibraryHourFormatting.swift
//  SwiftLibraries
//
//  Created by Allan Evans on 7/25/16
//

import Foundation

extension String {
    var formattedHours: String {
        if self == "Closed for building improvements" { return self } // maybe a better way to handle exceptions here someday...
        let dayOfWeekArray = ["Mon.", "Tue.", "Wed.", "Thu.", "Fri.", "Sat.", "Sun."]
        let formattedDayOfWeekArray = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        var hoursString = self
        var returnHoursString = "Hours:"
        for currentDayOfWeek in dayOfWeekArray {
            let index = dayOfWeekArray.firstIndex(of: currentDayOfWeek)
            hoursString = hoursString.replacingOccurrences(of: currentDayOfWeek, with: formattedDayOfWeekArray[index!])
        }
        hoursString = hoursString.replacingOccurrences(of: ",", with: ":")
        let hoursStringArray = hoursString.components(separatedBy: "; ")
        for hourString in hoursStringArray {
            returnHoursString = returnHoursString + "\n" + hourString
        }
        return returnHoursString
    }
}
