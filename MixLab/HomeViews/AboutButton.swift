//
//  AboutButton.swift
//  MixLab
//
//  Created by Will Pitchfork on 14/03/2023.
//

import SwiftUI

struct AboutButton: View {
    var body: some View {
        Button (action: { }) {
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                    .foregroundColor(CustomLightBlue)
                
                NavigationLink(destination: Text("About Screen")) {
                    VStack {
                        Image(systemName: "info.bubble.fill")
                            .font(.system(size: 200))
                            .foregroundColor(CustomBlue)
                        Text("About")
                            .font(.system(size: 50))
                            .foregroundColor(CustomBlue)
                            .fontWeight(.heavy)
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct AboutButton_Previews: PreviewProvider {
    static var previews: some View {
        AboutButton()
    }
}
