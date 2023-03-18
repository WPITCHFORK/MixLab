//
//  LessonView.swift
//  MixLab
//
//  Created by Will Pitchfork on 15/03/2023.
//

import SwiftUI
import UIKit

class Lesson: ObservableObject {
    @Published var selectedLesson = 0
}

struct LessonView: View {
    @ObservedObject var selectedLesson = Lesson()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    let columnLayout = Array(repeating: GridItem(), count: 3)
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomBlue.ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: columnLayout) {
                        ForEach(lessons) { lessonInfo in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(CustomLightBlue)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                NavigationLink(destination: HoldingView(lessonSelected: lessonInfo.id)) {
                                    VStack {
                                        lessonInfo.Image
                                            .font(.system(size: lessonInfo.ImageSize))
                                            .foregroundColor(CustomBlue)
                                            .padding(.bottom, 20)
                                        Spacer()
                                        Text("Lesson \(lessonInfo.id): \(lessonInfo.LongTitle)")
                                            .foregroundColor(CustomBlue)
                                            .font(.title)
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.all, 50)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
            }
            .navigationBarTitle("Lessons", displayMode: .inline)
        }
        .environmentObject(selectedLesson)
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

private struct lessonInfo: Identifiable {
    var id: Int
    let ShortTitle: String
    let LongTitle: String
    let Image: Image
    let ImageSize: CGFloat
}

private let lessons: [lessonInfo] = [
    lessonInfo(id: 1, ShortTitle: "Intro", LongTitle: "Introduction to Music Technology", Image: Image(systemName: "magnifyingglass"), ImageSize: 120),
    lessonInfo(id: 2, ShortTitle: "MusTec at UoY", LongTitle: "Music Technology at University of York", Image: Image(systemName: "graduationcap.fill"), ImageSize: 100),
    lessonInfo(id: 3, ShortTitle: "What", LongTitle: "What Will You Learn From MixLab?", Image: Image(systemName: "person.fill.questionmark"), ImageSize: 125),
    lessonInfo(id: 4, ShortTitle: "Differences", LongTitle: "Differences Between Live and Studio Mixing", Image: Image(systemName: "airpodsmax"), ImageSize: 100),
    lessonInfo(id: 5, ShortTitle: "Equipment", LongTitle: "What Equipment is Used", Image: Image(systemName: "cable.connector.horizontal"), ImageSize: 150),
    lessonInfo(id: 6, ShortTitle: "Layout", LongTitle: "Layout and Design of Mixers", Image: Image(systemName: "square.on.square.squareshape.controlhandles"), ImageSize: 100),
    lessonInfo(id: 7, ShortTitle: "Placement", LongTitle: "Microphone Placement", Image: Image(systemName: "music.mic"), ImageSize: 100),
    lessonInfo(id: 8, ShortTitle: "Gain", LongTitle: "Gain Staging", Image: Image(systemName: "mic.and.signal.meter"), ImageSize: 100),
    lessonInfo(id: 9, ShortTitle: "EQ", LongTitle: "EQ", Image: Image(systemName: "trapezoid.and.line.vertical.fill"), ImageSize: 100),
    lessonInfo(id: 10, ShortTitle: "Compression", LongTitle: "Compression", Image: Image(systemName: "dial.medium.fill"), ImageSize: 100),
    lessonInfo(id: 11, ShortTitle: "FX", LongTitle: "Other Effects", Image: Image(systemName: "dot.radiowaves.left.and.right"), ImageSize: 100),
    lessonInfo(id: 12, ShortTitle: "Panning", LongTitle: "Panning", Image: Image(systemName: "frying.pan"), ImageSize: 100),
    lessonInfo(id: 13, ShortTitle: "Mix", LongTitle: "Main Mix", Image: Image(systemName: "slider.vertical.3"), ImageSize: 150),
    lessonInfo(id: 14, ShortTitle: "Monitors", LongTitle: "Monitors, Busses, and Auxillaries", Image: Image(systemName: "bus"), ImageSize: 100)
]

