//
//  Destination.swift
//  SimpleNotes
//
//  Created by c on 05.02.2024.
//

import Foundation
import SwiftData

@Model
class Note {
    var title: String
    var details: String
    var date: Date
    
    init(title: String = "", details: String = "", date: Date = .now) {
        self.title = title
        self.details = details
        self.date = date
    }
}
