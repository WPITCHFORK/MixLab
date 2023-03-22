//
//  HoldingView.swift
//  MixLab
//
//  Created by Will Pitchfork on 18/03/2023.
//

import SwiftUI

struct HoldingView: View {
    var selectedLesson: lessonInfo
    //var lessonSelected: Int
    var loading: Bool = true
    
    var body: some View {
        ZStack {
            CustomBlue
                .ignoresSafeArea()
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(CustomLightBlue)
                VStack {
                    Spacer()
                    
                    selectedLesson.Image
                        .font(.system(size: selectedLesson.ImageSize))
                        .foregroundColor(CustomBlue)
                    
                    Spacer()
                    VStack {
                        Text("Lesson \(selectedLesson.id)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(CustomBlue)
                        Text(selectedLesson.LongTitle)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(CustomBlue)
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(CustomBlue)
                            .frame(height: 5)
                            .padding(.horizontal, 50)
                    }
                    
                    Spacer()
                    
                    Text("Description of Lesson")
                        .foregroundColor(CustomBlue)
                    
                    Spacer()
                    
                    Button (action: {
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .frame(width: 150, height: 40)
                                .foregroundColor(CustomBlue)
                            
                            Text("Start Lesson")
                                .fontWeight(.bold)
                                .foregroundColor(CustomLightBlue)
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.vertical, 50)
            .padding(.horizontal, 100)
        }
    }
}


struct ActivityIndicator: UIViewRepresentable {
    typealias UIView = UIActivityIndicatorView
    var isAnimating: Bool
    fileprivate var configuration = { (indicator: UIView) in }
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView {
        UIView()
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

extension View where Self == ActivityIndicator {
    func configure(_ configuration: @escaping (Self.UIView) -> Void) -> Self {
        Self.init(isAnimating: self.isAnimating, configuration: configuration)
    }
}

struct HoldingView_Previews: PreviewProvider {
    static var previews: some View {
        HoldingView(selectedLesson: lessonInfo(id: 1, ShortTitle: "Intro", LongTitle: "Introduction to Music Technology", Image: Image(systemName: "magnifyingglass"), ImageSize: 150))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
