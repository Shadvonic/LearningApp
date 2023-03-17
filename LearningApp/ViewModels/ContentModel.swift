//
//  ContentModel.swift
//  LearningApp
//
//  Created by Marc Moxey on 3/13/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    // List of modules
    @Published var modules = [Module]()
    
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
   
    // Current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    // current lesson explanation
    @Published var lessonDescription = NSAttributedString()
    
    // Current selected  content in test
    @Published var currentContentSelected: Int?
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    
    
    // MARK: - Data Methods
    
    
    
    
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            // Log error
            print("Couldn't parse style data")
        }
        
    }
    
    
    
    // MARK: - Module navigation methods
    
    func beginModule(_ moduleid: Int) {
        
        // Find the index for this id
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                
                // find the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // set the current module
        
        currentModule = modules[currentModuleIndex]
    }
    
    
    
    func beginLesson(_ lessonIndex: Int) {
        
        
        // check that the lesson index is wihin range of module lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
            
        } else {
            currentLessonIndex = 0
        }
        
        // set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        
        
        lessonDescription = addStyling(currentLesson!.explanation)
        
        
    }
    
    func hasNextLesson() -> Bool {
        if currentLessonIndex + 1 < currentModule!.content.lessons.count {
            return true
        } else {
            return false
        }
    }
    
    
    func nextLesson() {
        // Advance the lessoon index
        currentLessonIndex += 1
        
        // check that it is within range
        if currentLessonIndex < currentModule!.content.lessons.count {
            // set the the current lessoon property
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            lessonDescription = addStyling(currentLesson!.explanation)
        } else {
            // reset the lessopn state
            currentLesson = nil
            currentLessonIndex = 0
        }
        
    }
    
    
    
    // MARK: - Code Styling
    
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        // Add the styling data
        if styleData != nil {
            data.append(self.styleData!)
        }

        
        // add the html data
        data.append(Data(htmlString.utf8))
        
        // Convert to attributted string
   
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
                
                resultString = attributedString
            }
    
        
        return resultString
    }
    
}
