//
//  PopupViewController.swift
//  LocationSaver
//
//  Created by Eslam Ali  on 22/03/2022.
//

import UIKit
import RealmSwift

class PopupViewController: UIViewController {

    @IBOutlet weak var discriptionField: UITextView!
    @IBOutlet weak var nameField: UITextField!
    
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: Any) {
        print ("saving ")
        
        if let name = nameField.text , !name.isEmpty,
           let desc = discriptionField.text, !desc.isEmpty {
            
            let landmark = Landmark()
            landmark.name =  name
            landmark.desc = desc
            landmark.lat = Places.shared.userLat
            landmark.lon = Places.shared.userLon
            
          //  Places.shared.landmarks.append(landmark)
           
            try! realm.write({
                realm.add(landmark)
            })
            
            dismiss(animated: true)

            
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
