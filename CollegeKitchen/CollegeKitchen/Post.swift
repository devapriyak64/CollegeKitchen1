//
//  Post.swift
//  CollegeKitchen
//
//  Created by Vian Nguyen on 12/13/20.
//

import Foundation
class Post {
    
    var post_id: Int
    var poster_id: Int
    var title: String
    var overall_rating: String
    var price_rating: String
    var difficulty: String
    var tags: String
    var ingredients: String
    var recipe: String
    var comments: String
    
    init(post_id: Int, poster_id: Int, title: String, overall_rating: String, price_rating: String, difficulty: String, tags: String, ingredients: String, recipe: String, comments: String) {
        self.post_id = post_id
        self.poster_id = poster_id
        self.title = title
        self.overall_rating = overall_rating
        self.price_rating = overall_rating
        self.difficulty = difficulty
        self.tags = tags
        self.ingredients = ingredients
        self.recipe = recipe
        self.comments = comments
    }

}
