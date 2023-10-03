//
//  MapSearchField.swift
//  TheGreenways
//
//  Created by Alessio Garzia Marotta Brusco on 03/10/23.
//

import SwiftUI

struct MapSearchField: View {
    @Binding var text: String
   
    var body: some View {
        HStack {
            Circle()
                .frame(width: 16)
                .foregroundStyle(Color.emerald)
            
            TextField("Enter your destination", text: $text)
                
        }
        .padding()
        .background(in: Capsule())
        .shadow(radius: 10)
    }
}

#Preview {
    MapSearchField(text: .constant(""))
}
