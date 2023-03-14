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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
