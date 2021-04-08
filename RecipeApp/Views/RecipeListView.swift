//
//  RecipeListView.swift
//  RecipeApp
//
//  Created by Brian Dilts on 4/7/21.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view model
//    @ObservedObject var model = RecipeModel()
    // Remove the @ObservedObject that was getting the data and add a property that calls the data from the RecipeTabView where we set the data as an .environmentObject
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                       
                        // MARK: Row Item
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                        
                    })
               
                
            }
            .navigationBarTitle("All Recipes in App")
        }
        
    }
    // Reference the view model
    //@ObservedObject var model = RecipeModel()
    
//    List(model.recipes) { r in
//        
//        HStack {
//            Image(r.image)
//            Text (r.name)
//        }
//        
//    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
