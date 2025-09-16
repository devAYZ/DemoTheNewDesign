//
//  ContentView.swift
//  DemoTheNewDesign
//
//  Created by Ayokunle Fatokimi on 06/09/2025.
//

import SwiftUI

struct Car {
    var model: String
    var year: Int
}

struct ContentView: View {
    
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Image("hara")
                .resizable()
//                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(height: zoomed ? 400 : 200)
                .onTapGesture {
                    withAnimation {
                        zoomed.toggle()
                    }
                }
            Text("Hara Picture")
                .font(zoomed ? .largeTitle : .headline)
                .privacySensitive()
            //.contentC start listeningaptureProtected(true)
            Spacer()
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
