//
//  RecipePopUpViewController.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/5/20.
//

import UIKit

class RecipePopUpViewController: UIViewController {
    
    var post: Post
    var image: UIImageView!
    var recipeTitle: UILabel!
//    var username: UILabel!
    var difficultyRating: UILabel!
    var rating: UILabel!
    var priceRating: UILabel!
    var ingredientsLabel: UILabel!
    var ingredientsList: UITextView!
    var stepsLabel: UILabel!
    var stepsList: UITextView!
    var commentsLabel: UILabel!
    var comments: UITextView!
    // TODO: do we want to have tags and bottom navigation buttons? seems unnecessary
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        image = UIImageView()
        image.image = UIImage(named: "food.jpeg") // TODO (NETWORKING): this should be specific to each recipe (how do you get this?)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        view.addSubview(image)
        
        recipeTitle = UILabel()
        recipeTitle.text = post.title
        recipeTitle.textColor = .black
        recipeTitle.textAlignment = .left
        recipeTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        recipeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeTitle)
        
//        username = UILabel()
//        username.text = String (post.poster_id)
//        username.textColor = .black
//        username.textAlignment = .left
//        username.font = UIFont.systemFont(ofSize: 16)
//        username.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(username)
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(RecipePopUpViewController.tapFunction))
//                username.isUserInteractionEnabled = true
//                username.addGestureRecognizer(tap)
        
        difficultyRating = UILabel()
        difficultyRating.text = "Difficulty: " + String (post.difficultyRating)
        difficultyRating.textColor = .black
        difficultyRating.textAlignment = .right
        difficultyRating.font = UIFont.systemFont(ofSize: 16)
        difficultyRating.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(difficultyRating)
        
        rating = UILabel()
        rating.text = "Rating: " + String (post.overallRating)
        rating.textColor = .black
        rating.textAlignment = .right
        rating.font = UIFont.systemFont(ofSize: 16)
        rating.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rating)
        
        priceRating = UILabel()
        priceRating.text = String (post.priceRating)
        priceRating.textColor = .black
        priceRating.textAlignment = .right
        priceRating.font = UIFont.systemFont(ofSize: 16)
        priceRating.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceRating)
        
        ingredientsLabel = UILabel()
        ingredientsLabel.text = "Ingredients"
        ingredientsLabel.textColor = .black
        ingredientsLabel.textAlignment = .left
        ingredientsLabel.font = UIFont.systemFont(ofSize: 18)
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsLabel)
        
        ingredientsList = UITextView()
        ingredientsList.text = post.ingredients
        ingredientsList.textColor = .black
        ingredientsList.backgroundColor = .white
        ingredientsList.textAlignment = .left
        ingredientsList.isEditable = false
        ingredientsList.isSelectable = false
        ingredientsList.font = UIFont.systemFont(ofSize: 14)
        ingredientsList.translatesAutoresizingMaskIntoConstraints = false
        ingredientsList.isScrollEnabled = true
        ingredientsList.showsVerticalScrollIndicator = true
        view.addSubview(ingredientsList)
        
        stepsLabel = UILabel()
        stepsLabel.text = "Steps"
        stepsLabel.textColor = .black
        stepsLabel.textAlignment = .left
        stepsLabel.font = UIFont.systemFont(ofSize: 18)
        stepsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepsLabel)
        
        stepsList = UITextView()
        stepsList.text = post.recipe
        stepsList.textColor = .black
        stepsList.backgroundColor = .white
        stepsList.textAlignment = .left
        stepsList.font = UIFont.systemFont(ofSize: 14)
        stepsList.translatesAutoresizingMaskIntoConstraints = false
        stepsList.isEditable = false
        stepsList.isSelectable = false
        stepsList.isScrollEnabled = true
        stepsList.showsVerticalScrollIndicator = true
        view.addSubview(stepsList)
        
        
        setUpConstraints()
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
    }
    
    func setUpConstraints() {
        let imageHeight: CGFloat = 180
        let bigbuffer: CGFloat = 10
        let smallbuffer: CGFloat = 3
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: imageHeight),
            image.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            recipeTitle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: bigbuffer),
            recipeTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            recipeTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            recipeTitle.heightAnchor.constraint(equalToConstant: 21)
        ])
        
//        NSLayoutConstraint.activate([
//            username.topAnchor.constraint(equalTo: recipeTitle.bottomAnchor, constant: smallbuffer),
//            username.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
//            username.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -bigbuffer),
//            username.heightAnchor.constraint(equalToConstant: 19)
//        ])
        
        NSLayoutConstraint.activate([
            difficultyRating.topAnchor.constraint(equalTo: recipeTitle.topAnchor),
            difficultyRating.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            difficultyRating.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            difficultyRating.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            rating.topAnchor.constraint(equalTo: difficultyRating.bottomAnchor),
            rating.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            rating.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            rating.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            priceRating.topAnchor.constraint(equalTo: rating.bottomAnchor),
            priceRating.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            priceRating.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            priceRating.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: recipeTitle.bottomAnchor, constant: 12),
            ingredientsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            ingredientsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            ingredientsLabel.heightAnchor.constraint(equalToConstant: 23.16)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsList.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: smallbuffer),
            ingredientsList.bottomAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 100),
            ingredientsList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            ingredientsList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
        ])
        
        NSLayoutConstraint.activate([
            stepsLabel.topAnchor.constraint(equalTo: ingredientsList.bottomAnchor, constant: smallbuffer),
            stepsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            stepsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            stepsLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
        
        NSLayoutConstraint.activate([
            stepsList.topAnchor.constraint(equalTo: stepsLabel.bottomAnchor, constant: smallbuffer),
            stepsList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -bigbuffer),
            stepsList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            stepsList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer)
        ])
        
    }

}
