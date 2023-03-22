//
//  HoldingView.swift
//  MixLab
//
//  Created by Will Pitchfork on 18/03/2023.
//

import SwiftUI

struct HoldingView: View {
    var selectedLesson: lessonInfo
    @State var lessonDestination: any View = NewView()
    var loading: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomBlue
                    .ignoresSafeArea()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(CustomLightBlue)
                    VStack {
                        Spacer()
                        
                        Image(systemName: selectedLesson.ImageName)
                            .font(.system(size: CGFloat(selectedLesson.ImageSize)))
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
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(CustomBlue)
                                .frame(height: 5)
                                .padding(.horizontal, 50)
                        }
                        
                        Spacer()
                        
                        Text(selectedLesson.Description)
                            .foregroundColor(CustomBlue)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 250)
                        
                        Spacer()
                        
                        Button (action: {
                            switch (selectedLesson.id) {
                                case 1:
                                    print("Go to lesson 1")
                                case 2:
                                    print("Go to lesson 2")
                                case 3:
                                    print("Go to lesson 3")
                                case 4:
                                    print("Go to lesson 4")
                                case 5:
                                    print("Go to lesson 5")
                                case 6:
                                    print("Go to lesson 6")
                                case 7:
                                    print("Go to lesson 7")
                                case 8:
                                    print("Go to lesson 8")
                                case 9:
                                    print("Go to lesson 9")
                                case 10:
                                    print("Go to lesson 10")
                                case 11:
                                    print("Go to lesson 11")
                                case 12:
                                    print("Go to lesson 12")
                                case 13:
                                    print("Go to lesson 13")
                                case 14:
                                    print("Go to lesson 14")
                                default:
                                    print("I don't know what lesson you're actually wanting to load here... you've broken it again 🙄")
                            }
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
        HoldingView(selectedLesson: lessonInfo(id: 1, ShortTitle: "Intro", LongTitle: "Introduction to Music Technology", ImageName: "magnifyingglass", ImageSize: 150, Description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
