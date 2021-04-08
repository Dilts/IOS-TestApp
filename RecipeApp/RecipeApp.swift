//
//  RecipeApp.swift
//  RecipeApp
//
//  Created by Brian Dilts on 4/7/21.
//

import SwiftUI

@main
struct RecipeApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                // Make an environmentObject to store the data so that it is accesible in all the Child Views
                .environmentObject(RecipeModel())
        }
    }
}
