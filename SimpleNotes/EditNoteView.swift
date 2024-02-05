//
//  EditDestinationView.swift
//  SimpleNotes
//
//  Created by c on 05.02.2024.
//

import SwiftUI
import SwiftData

struct EditNoteView: View {
    @Bindable var note: Note
    
    var body: some View {
        VStack {
            TextField("Новая заметка", text: $note.title).font(.title).bold()
            TextEditor(text: $note.details)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Note.self, configurations: config)
        let example = Note(title: "Новая заметка", details: "Пример текста новой заметки, которая должна выходить в три стоки. Или больше, для болеее показательного случая.\n\nВторой абзац начался. Уж небо осенью дышало, и всё немедля обветшало и никуда и никому и только ему единственному одному.")
        return EditNoteView(note: example)
            .modelContainer(container)
    } catch {
        fatalError("Не удалось создать контейнер модели")
    }
}
