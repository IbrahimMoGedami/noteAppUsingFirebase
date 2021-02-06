//
//  HandelServices.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 06/02/2021.
//

import Foundation

class MockDataService : DataService {
    
    static var notes = [Note]()
    
    // Initialize 20 notes for mocking purposes.
//    init() {
//        for index in 1...20 {
//            let note = Note(id: UUID().uuidString, title: "Note \(index)", content: "This is note \(index)")
//            MockDataService.notes.append(note)
//        }
//    }
    
    // Get a specific note by noteId
    func getNote(_ noteId: String, onCompletion: @escaping (Note?, Error?) -> Void) {
        for (_, element) in MockDataService.notes.enumerated() {
            if (element.id == noteId) {
                onCompletion(element, nil)
                return
            }
        }
        onCompletion(nil, DataServiceError.NoSuchNote)
    }
    
    // Load all the notes
    func loadNotes(onCompletion: @escaping ([Note]?, Error?) -> Void) {
        onCompletion(MockDataService.notes, nil)
    }
    
    // Update a note (either create or update)
    func updateNote(_ note: Note, onCompletion: @escaping (Note?, Error?) -> Void) {
       if (note.id == nil) {
//            let newNote = Note(array: <#[String : Any]#>, id: UUID().uuidString, title: note.title, content: note.content)
//            MockDataService.notes.append(newNote)
//            onCompletion(newNote, nil)
        } else {
            for (index, element) in MockDataService.notes.enumerated() {
                if (element.id == note.id) {
                    MockDataService.notes[index] = note
                    onCompletion(note, nil)
                    return
                }
            }
            onCompletion(nil, DataServiceError.NoSuchNote)
        }
    }
    
    // Delete a note from the service
    func deleteNote(_ noteId: String, onCompletion: @escaping (Error?) -> Void) {
        var index = -1
        for (listIndex, element) in MockDataService.notes.enumerated() {
            if (element.id == noteId) {
                index = listIndex
            }
        }
        if (index == -1) {
            onCompletion(DataServiceError.NoSuchNote)
        } else {
            MockDataService.notes.remove(at: index)
            onCompletion(nil)
        }
    }
}
