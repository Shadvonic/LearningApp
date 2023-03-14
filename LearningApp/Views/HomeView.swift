//
//  ContentView.swift
//  LearningApp
//
//  Created by Marc Moxey on 3/13/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel // get access
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                ScrollView {
                    
                    LazyVStack {
                        
                        // Loop through each modules
                        ForEach(model.modules) { module in
                            
                            
                            VStack(spacing: 20) {
                                
                                // Learing Card
                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lesson", time: module.content.time)
                                
                                // Test Card
                                HomeViewRow(image: module.test.image, title: "Learn \(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lesson", time: module.test.time)
                                
                            }
                            
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
