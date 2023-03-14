//
//  ContentView.swift
//  LearningApp
//
//  Created by Marc Moxey on 3/14/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                // Confrim that currentModel is set
                
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        ContentViewRow(index: index)
                      
                    }
                }
                
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}


