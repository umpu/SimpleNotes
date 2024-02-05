//
//  EditDestinationView.swift
//  SimpleNotes
//
//  Created by c on 05.02.2024.
//

import SwiftUI
import SwiftData

enum FocusText {
    case title, details
}

struct EditNoteView: View {
    @Bindable var note: Note
    @FocusState private var focusField: FocusText?
    
    var body: some View {
        VStack {
            TextField("Новая заметка", text: $note.title)
                .font(.title)
                .bold()
                .focused($focusField, equals: .title)
                .submitLabel(.next)
                .onSubmit {
                    focusField = .details
                }
            
            TextEditor(text: $note.details)
                .focused($focusField, equals: .details)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            focusField = .title
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Note.self, configurations: config)
        let example = Note(title: "Новая заметка", details: "Пример текста новой заметки, которая должна выходить в три стоки. Или больше, для болеее показательного случая.")
        return EditNoteView(note: example)
            .modelContainer(container)
    } catch {
        fatalError("Не удалось создать контейнер модели")
    }
}
