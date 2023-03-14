//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Marc Moxey on 3/13/23.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
