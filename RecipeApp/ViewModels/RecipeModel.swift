//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Brian Dilts on 4/7/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
        
        
        
    }
}
