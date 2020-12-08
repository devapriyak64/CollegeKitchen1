//
//  RecipePopUpViewController.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/5/20.
//

import UIKit

class RecipePopUpViewController: UIViewController {
    
    var recipe: Recipe
    var image: UIImageView!
//    var filters: UICollectionView TODO
    var recipeTitle: UILabel!
    var username: UILabel!
    var shortDescription: UITextView!
    var ingredientsLabel: UILabel!
    var ingredientsList: UITextView!
    var stepsLabel: UILabel!
    var stepsList: UITextView!
    // TODO: bottom navigation bar
    
    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        image = UIImageView()
        image.image = recipe.image
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        view.addSubview(image)
        
        recipeTitle = UILabel()
        recipeTitle.text = recipe.recipeTitle
        recipeTitle.textColor = .white
        recipeTitle.textAlignment = .left
        recipeTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        recipeTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeTitle)
        
        username = UILabel()
        username.text = recipe.username
        username.textColor = .white
        username.textAlignment = .left
        username.font = UIFont.systemFont(ofSize: 20)
        username.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(username)
        
        shortDescription = UITextView()
        shortDescription.text = recipe.shortDescription
        shortDescription.textColor = .lightGray
        shortDescription.backgroundColor = .black
        shortDescription.textAlignment = .left
        shortDescription.isEditable = false
        shortDescription.isSelectable = false
        shortDescription.font = UIFont.systemFont(ofSize: 18)
        shortDescription.translatesAutoresizingMaskIntoConstraints = false
        shortDescription.isScrollEnabled = true
        shortDescription.showsVerticalScrollIndicator = true
        view.addSubview(shortDescription)
        
        ingredientsLabel = UILabel()
        ingredientsLabel.text = "Ingredients"
        ingredientsLabel.textColor = .white
        ingredientsLabel.textAlignment = .left
        ingredientsLabel.font = UIFont.systemFont(ofSize: 20)
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsLabel)
        
        ingredientsList = UITextView()
        ingredientsList.text = recipe.ingredients
        ingredientsList.textColor = .lightGray
        ingredientsList.backgroundColor = .black
        ingredientsList.textAlignment = .left
        ingredientsList.isEditable = false
        ingredientsList.isSelectable = false
        ingredientsList.font = UIFont.systemFont(ofSize: 18)
        ingredientsList.translatesAutoresizingMaskIntoConstraints = false
        ingredientsList.isScrollEnabled = true
        ingredientsList.showsVerticalScrollIndicator = true
        view.addSubview(ingredientsList)
        
        stepsLabel = UILabel()
        stepsLabel.text = "Steps"
        stepsLabel.textColor = .white
        stepsLabel.textAlignment = .left
        stepsLabel.font = UIFont.systemFont(ofSize: 20)
        stepsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepsLabel)
        
        stepsList = UITextView()
        stepsList.text = recipe.steps
        stepsList.textColor = .lightGray
        stepsList.backgroundColor = .black
        stepsList.textAlignment = .left
        stepsList.font = UIFont.systemFont(ofSize: 18)
        stepsList.translatesAutoresizingMaskIntoConstraints = false
        stepsList.isEditable = false
        stepsList.isSelectable = false
        stepsList.isScrollEnabled = true
        stepsList.showsVerticalScrollIndicator = true
        view.addSubview(stepsList)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        let imageHeight: CGFloat = 180
        let labelHeight: CGFloat = 30
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
            recipeTitle.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: recipeTitle.bottomAnchor, constant: bigbuffer),
            username.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            username.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            username.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            shortDescription.topAnchor.constraint(equalTo: username.bottomAnchor, constant: smallbuffer),
            shortDescription.bottomAnchor.constraint(equalTo: username.bottomAnchor, constant: 75),
            shortDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            shortDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: shortDescription.bottomAnchor, constant: smallbuffer),
            ingredientsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            ingredientsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            ingredientsLabel.heightAnchor.constraint(equalToConstant: labelHeight)
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
            stepsLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            stepsList.topAnchor.constraint(equalTo: stepsLabel.bottomAnchor, constant: smallbuffer),
            stepsList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stepsList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            stepsList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer)
        ])
        
    }

}
