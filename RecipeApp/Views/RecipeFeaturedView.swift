//
//  RecipeFeaturedView.swift
//  RecipeApp
//
//  Created by Brian Dilts on 4/8/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
   
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    
    var body: some View {

        VStack(alignment: .leading) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { g in
                
                TabView {
                    
                    ForEach (0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured {
                            
                            // Recipe card button
                            Button(action: {
                                
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                
                                // Recipe Card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                        
                                    }
                                }
                                
                            })
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show the recipe detail view
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: g.size.width - 40, height: g.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 10, x: 5, y: -5)
                                
                            
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Prep Time:")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights:")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding(.leading)
        }

    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
