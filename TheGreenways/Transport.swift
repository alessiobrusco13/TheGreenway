//
//  Transport.swift
//  TheGreenways
//
//  Created by Alessio Garzia Marotta Brusco on 03/10/23.
//

import Foundation

struct Transport: Identifiable {
    let id: String
    var type: TransportType
    var stops: [Stop]?
    
    var emissionsGPerKM: Double
    var capacity: Int
    var fare: Double
}

enum TransportType {
    case bus, eBus, eCarSharing, eScooterSharing, underground, walking, car
}
