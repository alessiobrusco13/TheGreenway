//
//  MapView.swift
//  TheGreenways
//
//  Created by Alessio Garzia Marotta Brusco on 03/10/23.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State private var cameraPosition: MapCameraPosition = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 41.90216, longitude: 12.45838), distance: 1000, pitch: 80))
    
    var body: some View {
        Map(position: $cameraPosition) {
            Annotation("Location", coordinate: userLocation) {
                Circle()
                    .fill(.thickMaterial)
                    .overlay {
                        Circle()
                            .foregroundStyle(.green.gradient)
                            .padding(2)
                    }
                    .frame(width: 20)
            }
            .annotationTitles(.hidden)
        }
    }
}

#Preview {
    MapView()
}
