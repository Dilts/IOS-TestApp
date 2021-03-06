//
//  DataService.swift
//  RecipeApp
//
//  Created by Brian Dilts on 4/7/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create URL object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
            let recipeData = try decoder.decode([Recipe].self, from: data)
            
                // Add unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
                
            }
            catch {
                print("error with parsing json")
            }
            
            // Return the recipes
            
        }
        catch {
            print("error with getting data")
        }
        
        return [Recipe]()
    }
    
}
