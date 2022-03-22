//
//  Places.swift
//  LocationSaver
//
//  Created by Eslam Ali  on 22/03/2022.
//

import Foundation
import RealmSwift

class Places {
    static let shared = Places()
    
    var landmarks : Results <Landmark>!
    
    private init () {} 
}
