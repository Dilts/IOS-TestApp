//
//  RecipeDetailView.swift
//  RecipeApp
//
//  Created by Brian Dilts on 4/8/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    
    
    var body: some View {
        ScrollView {
           
            VStack (alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                //MARK: Serving Size Picker
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 15))
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .font(Font.custom("Avenir", size: 15))
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(.bottom, 5.0)
                    
                    ForEach (recipe.ingredients) { item in
                        
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                        
                    }
                }
                    .padding(.horizontal)
                
                Divider()
                
                // MARK: Diretions
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    
                    VStack(alignment: .leading) {
                        ForEach(recipe.directions, id: \.self) { item in
                            Text(item)
                                .padding([.bottom, .top], 5)
                                .font(Font.custom("Avenir", size: 15))

                        }
                    }
                }
                    .padding(.horizontal)
                
            }

        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe and pass it into the detail view so we can preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
