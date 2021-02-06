//
//  HomeVC.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 06/02/2021.
//

import UIKit
import Firebase

class HomeVC: UIViewController {
    
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var notFoundLbl: UILabel!
    var notes = [Note]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //notFoundLbl.isHidden = true
        title = "We Note"
        notesTableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteTableViewCell")
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.tableFooterView = UIView( )
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        getData()
    }
    
    @objc func insertNewObject(_ sender: Any){
        handlePushSegue(viewController: DetailVC.self)
    }
    
    func getData(){
        Configers.REF_NOTES.observe(.value) { [weak self](dataSnapshot) in
            guard let self = self else {return}
            let data = dataSnapshot.value
            print("Data : \(data!)")
            if dataSnapshot.childrenCount > 0{
                //clearing the list
                self.notes.removeAll()
                
                //iterating through all the values
                for noteses in dataSnapshot.children.allObjects as! [DataSnapshot]{
                    //getting values
                    let notetObject = noteses.value as? [String: AnyObject]
                    let noteName  = notetObject?["title"]
                    let noteId  = notetObject?["id"]
                    let noteDesc = notetObject?["description"]
                    let noteLocation = notetObject?["location"]
                    let artist = Note(id: noteId as? String, title: noteName as? String, content: noteDesc as? String, location: noteLocation as? String)
                    self.notes.append(artist)
                }
                self.notesTableView.reloadData()
            }
        }
    }
    
}
