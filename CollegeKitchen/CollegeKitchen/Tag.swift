//
//  Tag.swift
//  CollegeKitchen
//
//  Created by Vian Nguyen on 12/13/20.
//

import Foundation

class Tag {
    
    var tag_id: Int
    var tag_name: String
    var posts: String

    
    init(tag_id: Int, tag_name: String, posts: String) {
        self.tag_id = tag_id
        self.tag_name = tag_name
        self.posts = posts
    }

}
