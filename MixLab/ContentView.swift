//
//  ContentView.swift
//  MixLab
//
//  Created by Will Pitchfork on 12/03/2023.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomBlue
                    .ignoresSafeArea()
            
                VStack {
                    Text("Home")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Grid{
                        GridRow{
                            LessonsButton()
                                .padding(.horizontal, 20)
                            FreePlayButton()
                                .padding(.horizontal, 20)
                        }
                        GridRow{
                            SettingsButton()
                                .padding(.horizontal, 20)
                            AboutButton()
                                .padding(.horizontal, 20)
                        }
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct ExtractedView: View {
    var body: some View {
        ZStack {
            Button {
            } label: {
                RoundedRectangle(cornerRadius: 20.0)
                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                    .foregroundColor(CustomLightBlue)
            }
            
            NavigationLink(destination: NewView()) {
                VStack {
                    Image(systemName: "play.circle")
                    Text("Button5")
                }
                .frame(width: 200, height: 200)
            }
            .buttonStyle(.plain)
        }
    }
}
