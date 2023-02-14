//
//  ContentModel.swift
//  M5Learning
//
//  Created by Craig on 2/11/23.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
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
}
