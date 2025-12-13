//
//  UtilityFunctions.swift
//  AlbumsOfTheYear
//
//  Created by Chris Shirai on 12/10/25.
//

import Foundation

 func getYearFromDate(_ date: Date?) -> Int? {
    if date != nil {

        let yearString = date!.formatted(.dateTime.year())

        if let intValue = Int(yearString) {
            return intValue
        }
    }
    return nil
}
