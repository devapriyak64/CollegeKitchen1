//
//  RecipePopUpViewController.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/5/20.
//

import UIKit

class RecipePopUpViewController: UIViewController {
    
    // TODO: conform to networked Recipe
    var recipe: Recipe
    var image: UIImageView!
    // var filters: UICollectionView TODO (make these pink to match theme)
    var recipeTitle: UILabel!
    var username: UILabel!
    var shortDescription: UITextView!
    var ingredientsLabel: UILabel!
    var ingredientsList: UITextView!
    var stepsLabel: UILabel!
    var stepsList: UITextView!
    // TODO: bottom navigation bar ??? does this make sense to have in all screens?
    
    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        image = UIImageView()
        image.image = recipe.image
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        view.addSubview(image)
        
        recipeTitle = UILabel()
        recipeTitle.text = recipe.recipeTitle
        recipeTitle.textColor = .black
        recipeTitle.textAlignment = .left
        recipeTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        recipeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeTitle)
        
        username = UILabel()
        username.text = recipe.username
        username.textColor = .black
        username.textAlignment = .left
        username.font = UIFont.systemFont(ofSize: 16)
        username.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(username)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RecipePopUpViewController.tapFunction))
                username.isUserInteractionEnabled = true
                username.addGestureRecognizer(tap)
        
        shortDescription = UITextView()
        shortDescription.text = recipe.shortDescription
        shortDescription.textColor = .black
        shortDescription.backgroundColor = .white
        shortDescription.textAlignment = .left
        shortDescription.isEditable = false
        shortDescription.isSelectable = false
        shortDescription.font = UIFont.systemFont(ofSize: 14)
        shortDescription.translatesAutoresizingMaskIntoConstraints = false
        shortDescription.isScrollEnabled = true
        shortDescription.showsVerticalScrollIndicator = true
        view.addSubview(shortDescription)
        
        ingredientsLabel = UILabel()
        ingredientsLabel.text = "Ingredients"
        ingredientsLabel.textColor = .black
        ingredientsLabel.textAlignment = .left
        ingredientsLabel.font = UIFont.systemFont(ofSize: 18)
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsLabel)
        
        ingredientsList = UITextView()
        ingredientsList.text = recipe.ingredients
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
        stepsList.text = recipe.steps
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
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: recipeTitle.bottomAnchor, constant: smallbuffer),
            username.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            username.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            username.heightAnchor.constraint(equalToConstant: 19)
        ])
        
        NSLayoutConstraint.activate([
            shortDescription.topAnchor.constraint(equalTo: username.bottomAnchor, constant: smallbuffer),
            shortDescription.heightAnchor.constraint(equalToConstant: 50),
            shortDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            shortDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: shortDescription.bottomAnchor, constant: 12),
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
            stepsList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stepsList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            stepsList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer)
        ])
        
    }

}
