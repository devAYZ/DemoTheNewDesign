//
//  ContentView.swift
//  DemoTheNewDesign
//
//  Created by Ayokunle Fatokimi on 06/09/2025.
//

import SwiftUI
import Playgrounds

struct Car {
    var model: String
    var year: Int
}

struct ContentView: View {
    
    var body: some View {
        VStack {
            //MiniAnimation()
            StateBackground()
        }
    }
    
}

#Preview {
    ContentView()
}

struct MiniAnimation: View {
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

struct StateBackground: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isOn) {
                Text(isOn ? "ON" : "OFF")
            }
            .fixedSize()
            .padding(6)
            .background(.white)
            .clipShape(RoundedRectangle(cornerSize: .init(width: 16, height: .zero)))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isOn ? .green : .gray)
    }
}

