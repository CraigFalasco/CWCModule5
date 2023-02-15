//
//  ContentModel.swift
//  M5Learning
//
//  Created by Craig on 2/11/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    // list of modules
    @Published var modules = [Module]()
    // html style
    var styleData: Data?
    
    // current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    // current lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            self.modules = modules
        }
        catch {
            fatalError("Error getting json data")
        }
        
        // the style.html is not jsaon, so we do not need the decoder, just leave the style HTML as data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        }
        catch {
            fatalError("Error getting style HTML data")
        }
    }
    
    func beginModule(_ moduleId: Int) {
        
        for index in 0..<modules.count {
            
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }
    func beginLesson(_ lessonIndex: Int) {
        
        // check that the lesson index is within range
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        }
        else {
            currentLessonIndex = 0
        }
        // set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
    }
    func hasNextLesson() -> Bool {
        /*
         if currentLessonIndex + 1 < currentModule!.content.lessons.count {
             return true
         }
         else {
             return false
         }
         */
        
        // short way to replace the above if statement
        return currentLessonIndex + 1 < currentModule!.content.lessons.count
    }
    func nextLesson() {
        if currentLessonIndex < currentModule!.content.lessons.count - 1 {
            currentLessonIndex += 1
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        }
        else {
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
}
