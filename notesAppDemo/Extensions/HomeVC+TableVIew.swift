//
//  HomeVC+TableVIew.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 06/02/2021.
//

import UIKit

extension HomeVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if notes.count <= 0{
            return 0
        }else{
            return notes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell {
            cell.noteTitle.text = notes[indexPath.row].title
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let user: Note = notes[indexPath.row]
            let uk = user.title
            Configers.REF_NOTES.child(uk ?? "").removeValue()
            self.notes.remove(at: indexPath.row)
            self.notesTableView.deleteRows(at: [indexPath], with: .fade)
            notesTableView.reloadData()
        }
    }
    
}

extension HomeVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNote = notes[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(identifier: "DetailVC" ) as! DetailVC
        vc.id = selectedNote.id
        vc.desc = selectedNote.content
        vc.titl = selectedNote.title
        vc.location = selectedNote.location
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
