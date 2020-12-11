//
//  Recipe.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/5/20.
//

import UIKit
import Foundation

// TODO: need to change this to conform to networked information
class Recipe {
    var image: UIImage
    var recipeTitle: String
    var username: String
    var shortDescription: String
    var ingredients: String
    var steps: String
    
    init(image: UIImage, recipeTitle: String, username: String, shortDescription: String, ingredients: String, steps: String) {
        self.image = image
        self.recipeTitle = recipeTitle
        self.username = username
        self.shortDescription = shortDescription
        self.ingredients = ingredients
        self.steps = steps
    }
}
