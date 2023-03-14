//
//  SettingsView.swift
//  MixLab
//
//  Created by Will Pitchfork on 14/03/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: NewView()) {
                Text("Setting 1")
            }
            
                .navigationTitle(Text("Settings"))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
