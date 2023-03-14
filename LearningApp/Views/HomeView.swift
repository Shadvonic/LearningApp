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
   
        ScrollView {
            
            LazyVStack {
                
                // Loop through each modules
                ForEach(model.modules) { module in
                    
                    // Learing Card
                    
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
                        
                        HStack {
                            
                            // Image
                            
                            Image("swift")
                                .resizable()
                                .frame(width: 116, height: 116)
                                .clipShape(Circle())
                            
                            //Text
                            VStack(alignment: .leading) {
                                
                                // Headline
                                Text("Learn Swift")
                                    .bold()
                                
                                // Description
                                Text("Some description")
                                
                                // Icons
                                HStack {
                                    
                                    // number of lesson / questions
                                    Image(systemName: "text.book.closed")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        Text("20 Lesson")
                                        .font(.caption)
                                    
                                    // Time
                                    Image(systemName: "clock")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        Text("2 Hours")
                                        .font(.caption)
                                }
                            }
                        }
                    }
                    
                    // Test Card
                }
            }
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
