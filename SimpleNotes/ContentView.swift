//
//  ContentView.swift
//  SimpleNotes
//
//  Created by c on 05.02.2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var notes: [Note]
    @State private var path = [Note]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(notes) { note in
                    NavigationLink(value: note) {
                        VStack(alignment: .leading) {
                            Text(note.title).bold().lineLimit(1)
                            HStack {
                                Text(note.date.formatted(date: .numeric, time: .omitted))
                                Text(note.details).lineLimit(1)
                            }
                            .foregroundStyle(.gray)
                        }
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Заметки")
            .navigationDestination(for: Note.self, destination: EditNoteView.init)
            .toolbar {
                Button("Добавить заметку", systemImage: "square.and.pencil", action: addNote)
            }
        }
    }
    
    func addNote() {
        let note = Note()
        modelContext.insert(note)
        path = [note]
    }
    
    func deleteNote(_ indexSet: IndexSet) {
        for index in indexSet {
            let note = notes[index]
            modelContext.delete(note)
        }
    }
}

#Preview {
    ContentView()
}
