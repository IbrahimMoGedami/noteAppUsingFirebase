//
//  NoteServices.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 06/02/2021.
//

import Foundation

typealias GetNoteResponse = (Note?, Error?) -> Void

typealias LoadNotesResponse = ([Note]?, Error?) -> Void

typealias UpdateNoteResponse = (Note?, Error?) -> Void

typealias DeleteNoteResponse = (Error?) -> Void

protocol DataService {
    func getNote(_ noteId: String, onCompletion: @escaping GetNoteResponse) -> Void
    func loadNotes(onCompletion: @escaping LoadNotesResponse) -> Void
    func updateNote(_ note: Note, onCompletion: @escaping UpdateNoteResponse) -> Void
    func deleteNote(_ noteId: String, onCompletion: @escaping DeleteNoteResponse) -> Void
}

enum DataServiceError: Error {
    case NoSuchNote
    case NetworkError(errorMessage: String)
}
