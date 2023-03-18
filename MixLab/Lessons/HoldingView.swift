//
//  HoldingView.swift
//  MixLab
//
//  Created by Will Pitchfork on 18/03/2023.
//

import SwiftUI

struct HoldingView: View {
    var lessonSelected: Int
    var loading: Bool = true
    @EnvironmentObject var lesson: Lesson
    
    var body: some View {
        ZStack {
            CustomBlue
                .ignoresSafeArea()
            
            VStack {
                ActivityIndicator(isAnimating: true)
                    .configure { $0.color = UIColor(CustomBlue)}
                    .padding()
                    .background(CustomLightBlue)
                    .cornerRadius(100)
                    .padding(.bottom, 20)
                Text("Please wait whilst I load Lesson \(lessonSelected)")
                    .foregroundColor(CustomLightBlue)
                    .font(.title)
                //Text("Please wait whilst I load Lesson \(lesson.selectedLesson)")
            }
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
        HoldingView(lessonSelected: 3)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
