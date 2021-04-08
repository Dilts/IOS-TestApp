//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Brian Dilts on 4/8/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
           
            VStack (alignment: .leading) {
                
                
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("• " + item)
                        
                    }
                }
                    .padding(.horizontal)
                
                Divider()
                
                // MARK: Diretions
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)
                    
                    VStack(alignment: .leading) {
                        ForEach(recipe.directions, id: \.self) { item in
                            Text(item)
                                .padding([.bottom, .top], 5)

                        }
                    }
                }
                    .padding(.horizontal)
                
            }

        }
        .navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so we can preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
