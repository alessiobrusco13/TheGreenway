//
//  ContentView.swift
//  TheGreenways
//
//  Created by Alessio Garzia Marotta Brusco on 03/10/23.
//

import MapKit
import SwiftUI

let userLocation = CLLocationCoordinate2D(latitude: 41.90216, longitude: 12.45838)

struct ContentView: View {
    @State private var text = ""
    @State private var fullScreen = false
    @FocusState private var focused: Bool
    
    @Namespace var namespace
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Hi Alberto")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            HStack(spacing: 0) {
                                Text("Where ")
                                    .foregroundStyle(.linearGradient(stops: [.init(color: .salem, location: 0.7), .init(color: .emerald, location: 1)], startPoint: .bottomTrailing, endPoint: .topLeading))
                                    .fontWeight(.bold)
                                
                                Text("to?")
                                    .fontWeight(.medium)
                            }
                            .font(.largeTitle.width(.expanded))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0)
                                .scaleEffect(phase.isIdentity ? 1 : 0.75)
                                .blur(radius: phase.isIdentity ? 0 : 10)
                        }
                        .padding(.vertical)
                        
                        if !fullScreen {
                            MapView()
                                .matchedGeometryEffect(id: "map", in: namespace)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .containerRelativeFrame(.vertical, count: 3, spacing: 10)
                            
                            MapSearchField(text: $text)
                                .focused($focused)
                                .matchedGeometryEffect(id: "searchField", in: namespace)
                                .padding(.vertical, -40)
                        }
                    }
                    .padding(.horizontal)
                    .onChange(of: focused) { _, newValue in
                        if newValue {
                            withAnimation {
                                fullScreen = true
                            }
                        }
                    }
                }
                
                if fullScreen {
                    MapView()
                        .matchedGeometryEffect(id: "map", in: namespace)
                        .overlay(alignment: .top) {
                            MapSearchField(text: $text)
                                .focused($focused)
                                .matchedGeometryEffect(id: "searchField", in: namespace)
                                .padding()
                        }
                }
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Button("Done") {
                            withAnimation {
                                fullScreen = false
                                focused = false
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
