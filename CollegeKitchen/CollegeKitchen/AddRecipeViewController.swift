//
//  AddRecipeViewController.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/8/20.
//

import UIKit

class AddRecipeViewController: UIViewController {
    // overall rating automatically can be 3
    // TODO: tags
    // TODO (NETWORKING): make fields actually create new recipe (tags can be empty)
    
    weak var delegate: SaveNewRecipeDelegate?
    var image: UIImageView!
    var nameLabel: UILabel!
    var nameField: UITextField!
    var priceLabel: UILabel!
    var priceField: UITextField!
    var difficultyLabel: UILabel!
    var difficultyField: UITextField!
    var ingredientsLabel: UILabel!
    var ingredientsField: UITextField!
    var stepsLabel: UILabel!
    var stepsField: UITextField!
    var submitButton: UIButton!
    var recipe: Post
    
    init(delegate: SaveNewRecipeDelegate?, recipe: Post) {
        self.recipe = recipe
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        image = UIImageView()
        // TODO (NETWORKING): change this picture to a upload picture field
        image.image = UIImage(named: "food.jpeg")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        view.addSubview(image)
        
        nameLabel = UILabel()
        nameLabel.text = "Enter a name"
        nameLabel.textColor = .black
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        nameField = UITextField()
        nameField.text = "  Start typing..."
        nameField.layer.cornerRadius = 15.0
        nameField.layer.borderColor = UIColor.black.cgColor
        nameField.layer.borderWidth = 1
        nameField.backgroundColor = .white
        nameField.textColor = .lightGray
        nameField.textAlignment = .left
        nameField.clearsOnBeginEditing = true
        nameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameField)
        
        priceLabel = UILabel()
        priceLabel.text = "Price (0 - 5)"
        priceLabel.textColor = .black
        priceLabel.textAlignment = .left
        priceLabel.font = UIFont.systemFont(ofSize: 18)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceLabel)
        
        priceField = UITextField()
        priceField.text = "  Start typing..."
        priceField.layer.cornerRadius = 15.0
        priceField.layer.borderColor = UIColor.black.cgColor
        priceField.layer.borderWidth = 1
        priceField.backgroundColor = .white
        priceField.textColor = .lightGray
        priceField.textAlignment = .left
        priceField.clearsOnBeginEditing = true
        priceField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceField)
        
        difficultyLabel = UILabel()
        difficultyLabel.text = "Difficulty (0 - 5)"
        difficultyLabel.textColor = .black
        difficultyLabel.textAlignment = .left
        difficultyLabel.font = UIFont.systemFont(ofSize: 18)
        difficultyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(difficultyLabel)
        
        difficultyField = UITextField()
        difficultyField.text = "  Start typing..."
        difficultyField.layer.cornerRadius = 15.0
        difficultyField.layer.borderColor = UIColor.black.cgColor
        difficultyField.layer.borderWidth = 1
        difficultyField.backgroundColor = .white
        difficultyField.textColor = .lightGray
        difficultyField.textAlignment = .left
        difficultyField.clearsOnBeginEditing = true
        difficultyField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(difficultyField)
        
        ingredientsLabel = UILabel()
        ingredientsLabel.text = "List the ingredients"
        ingredientsLabel.textColor = .black
        ingredientsLabel.textAlignment = .left
        ingredientsLabel.font = UIFont.systemFont(ofSize: 18)
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsLabel)
        
        ingredientsField = UITextField()
        ingredientsField.text = "  Start typing..."
        ingredientsField.layer.cornerRadius = 15.0
        ingredientsField.layer.borderColor = UIColor.black.cgColor
        ingredientsField.layer.borderWidth = 1
        ingredientsField.backgroundColor = .white
        ingredientsField.textColor = .lightGray
        ingredientsField.textAlignment = .left
        ingredientsField.clearsOnBeginEditing = true
        ingredientsField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsField)
        
        stepsLabel = UILabel()
        stepsLabel.text = "Write out the steps"
        stepsLabel.textColor = .black
        stepsLabel.textAlignment = .left
        stepsLabel.font = UIFont.systemFont(ofSize: 20)
        stepsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepsLabel)
        
        stepsField = UITextField()
        stepsField.text = "  Start typing..."
        stepsField.layer.cornerRadius = 15.0
        stepsField.layer.borderColor = UIColor.black.cgColor
        stepsField.layer.borderWidth = 1
        stepsField.backgroundColor = .white
        stepsField.textColor = .lightGray
        stepsField.textAlignment = .left
        stepsField.clearsOnBeginEditing = true
        stepsField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepsField)
        
        submitButton = UIButton()
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("  Save  ", for: .normal)
        submitButton.backgroundColor = UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.borderColor = UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00).cgColor
        submitButton.layer.borderWidth = 1
        submitButton.layer.cornerRadius = 15.0
        submitButton.addTarget(self, action: #selector(saveRecipe), for: .touchUpInside)
        view.addSubview(submitButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        let imageHeight: CGFloat = 180
        let labelHeight: CGFloat = 21
        let bigbuffer: CGFloat = 10
        let smallbuffer: CGFloat = 3
        let fieldHeight: CGFloat = 90
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: imageHeight),
            image.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo:image.bottomAnchor, constant: bigbuffer), nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: smallbuffer),
            nameField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            nameField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            nameField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo:nameField.bottomAnchor, constant: bigbuffer), priceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            priceLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -smallbuffer),
            priceLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            priceField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: smallbuffer),
            priceField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            priceField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -smallbuffer),
            priceField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            difficultyLabel.topAnchor.constraint(equalTo:nameField.bottomAnchor, constant: bigbuffer),
            difficultyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: smallbuffer),
            difficultyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            difficultyLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            difficultyField.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: smallbuffer),
            difficultyField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: smallbuffer),
            difficultyField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -smallbuffer),
            difficultyField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: priceField.bottomAnchor, constant: smallbuffer),
            ingredientsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            ingredientsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: bigbuffer),
            ingredientsLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsField.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: smallbuffer),
            ingredientsField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            ingredientsField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            ingredientsField.heightAnchor.constraint(equalToConstant: fieldHeight)
        ])
        
        NSLayoutConstraint.activate([
            stepsLabel.topAnchor.constraint(equalTo: ingredientsField.bottomAnchor, constant: smallbuffer),
            stepsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            stepsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: bigbuffer),
            stepsLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            stepsField.topAnchor.constraint(equalTo: stepsLabel.bottomAnchor, constant: smallbuffer),
            stepsField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            stepsField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            stepsField.heightAnchor.constraint(equalToConstant: fieldHeight)
        ])
        
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: stepsField.bottomAnchor, constant: bigbuffer),
            submitButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc func saveRecipe() {
        if let title = nameField.text, let price = Int (priceField.text!), let difficulty = Int (difficultyField.text!), let ingredients = ingredientsField.text, let steps = stepsField.text {
            recipe.title = title
            recipe.priceRating = price
            recipe.difficultyRating = difficulty
            recipe.ingredients = ingredients
            recipe.recipe = steps
            delegate?.saveNewRecipe(post: recipe)
        }
        self.navigationController?.popViewController(animated: true)
    }

}
