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
    var userLat = 0.0
    var userLon = 0.0
    private init () {} 
}
