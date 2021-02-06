//
//  DetailViewController.swift
//  notesAppDemo
//
//  Created by Ibrahim Mo Gedami on 06/02/2021.
//

import UIKit
import MapKit

protocol PassDataToNoteVC : class{
    func passNotes(notes:[Note])
}

class DetailVC: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var getLocationBu: UIButton!
    @IBOutlet weak var openLocationBu: UIButton!
    
    
    weak var delegate : PassDataToNoteVC?
    var notesArr = [Note]()
    var id : String?
    var desc: String?
    var titl : String?
    var lat: CLLocationDegrees?
    var lon: CLLocationDegrees?
    var location : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveData))
        self.idLabel.text = id
        self.contentTextView.text = desc
        self.titleTextField.text = titl
        self.locationLabel.text = location
        configureLocationBu()
    }
    
    func configureLocationBu(){
        getLocationBu.backgroundColor = .mainBlueTint
        getLocationBu.layer.cornerRadius = 5
        openLocationBu.layer.cornerRadius = 5
        openLocationBu.backgroundColor = .mainBlueTint
    }
    
    @objc func saveData(){
        guard let title = titleTextField.text , !title.isEmpty ,let desc = contentTextView.text ,!desc.isEmpty ,let locat = locationLabel.text else { return }
        let id = Configers.REF_NOTES.childByAutoId().key
        let value = ["id": id ,"title" : title ,"description":desc , "location" : locat]
        print(value)
        Configers.REF_NOTES.childByAutoId().setValue(value)
        let modelData = Note(id: id, title: title, content: desc, location: location)
        self.notesArr.append(modelData)
        delegate?.passNotes(notes: notesArr)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resignKeyboardTextField(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func getLocationBuTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "MapVC" ) as! MapVC
        vc.delgate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openLocationBuTapped(_ sender: UIButton) {

        UIApplication.shared.openURL(URL(string:"https://www.google.com/maps/@\(lat),\(lon),6z")!)

    }
}

extension DetailVC : GetLatLong{
    
    func getLatLongData(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        self.lat = lat
        self.lon = lon
        print("\(self.lat ?? 0.0) \(self.lon ?? 0.0)")
    }
    
    func getLocationTitle(title: String) {
        DispatchQueue.main.async {
            print(title)
            self.locationLabel.text = title
        }
    }
}
