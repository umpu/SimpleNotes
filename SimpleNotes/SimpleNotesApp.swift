//
//  SimpleNotesApp.swift
//  SimpleNotes
//
//  Created by c on 05.02.2024.
//

import SwiftData
import SwiftUI

@main
struct SimpleNotesApp: App {
    var appId = "6477391601"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
