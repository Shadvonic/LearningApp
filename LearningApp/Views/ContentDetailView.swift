//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Marc Moxey on 3/14/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            
            // only show video if we get vaild url
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // TODO: Description
            CodeTextView()
            
            // show next Lesson button, only if there is a next lessoon
            if model.hasNextLesson() {
                Button(action: {
                    // Advance the lesson
                    model.nextLesson()
                }, label: {
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                           
                        
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
               
            } else {
                // Show the complete button instead
              
                Button(action: {
                    // Take user back to home View lesson
                    model.currentContentSelected = nil
                }, label: {
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                    
                        
                        
                        Text("Complete")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
                
            }
           
        }
        .padding()
  
 
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
