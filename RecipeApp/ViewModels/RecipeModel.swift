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
    
    static func getPortion(ingredient: Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            //GEt a single serving size by multiplying denominator by the recipe servings
            denominator = denominator * recipeServings
//            denominator *= recipeServings >>>>> This is the shorthand for the above expression
            
            //Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // Reduce fraction by greatest common denominator
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // Get the whole portion if num is > denom
            if numerator >= denominator {
                
                // Calculated the whole portions
                wholePortions = numerator / denominator
                // Calculate the remainder
                numerator = numerator % denominator
                //Assigne to porion string
                portion += String(wholePortions)
                
            }
            
            // Express the remainder as a fraction
            if numerator > 0 {
                
                // Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
                
            }
        }
        
        if var unit = ingredient.unit {
            
            // Check if we need to pluralize
            if wholePortions > 1 {
                
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }

        return portion
    }
    
}
