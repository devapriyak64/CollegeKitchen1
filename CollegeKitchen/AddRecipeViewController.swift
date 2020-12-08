//
//  AddRecipeViewController.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/8/20.
//

import UIKit

class AddRecipeViewController: UIViewController {

    // TODO: make fields actually update recipe
    var image: UIImageView!
    // TODO: tags
    var descriptionLabel: UILabel!
    var descriptionField: UITextField!
    var ingredientsLabel: UILabel!
    var ingredientsField: UITextField!
    var stepsLabel: UILabel!
    var stepsField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        image = UIImageView()
        // TODO: change this picture to a upload picture field
        image.image = UIImage(named: "food.jpeg")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        view.addSubview(image)
        
        descriptionLabel = UILabel()
        descriptionLabel.text = "Write a short description"
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .left
        descriptionLabel.font = UIFont.systemFont(ofSize: 20)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        descriptionField = UITextField()
        descriptionField.text = "  Start typing..."
        descriptionField.layer.cornerRadius = 15.0
        descriptionField.layer.borderColor = UIColor.white.cgColor
        descriptionField.layer.borderWidth = 1
        descriptionField.backgroundColor = .black
        descriptionField.textColor = .lightGray
        descriptionField.textAlignment = .left
        descriptionField.clearsOnBeginEditing = true
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionField)
        
        ingredientsLabel = UILabel()
        ingredientsLabel.text = "List the ingredients"
        ingredientsLabel.textColor = .white
        ingredientsLabel.textAlignment = .left
        ingredientsLabel.font = UIFont.systemFont(ofSize: 20)
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsLabel)
        
        ingredientsField = UITextField()
        ingredientsField.text = "  Start typing..."
        ingredientsField.layer.cornerRadius = 15.0
        ingredientsField.layer.borderColor = UIColor.white.cgColor
        ingredientsField.layer.borderWidth = 1
        ingredientsField.backgroundColor = .black
        ingredientsField.textColor = .lightGray
        ingredientsField.textAlignment = .left
        ingredientsField.clearsOnBeginEditing = true
        ingredientsField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ingredientsField)
        
        stepsLabel = UILabel()
        stepsLabel.text = "Write out the steps"
        stepsLabel.textColor = .white
        stepsLabel.textAlignment = .left
        stepsLabel.font = UIFont.systemFont(ofSize: 20)
        stepsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepsLabel)
        
        stepsField = UITextField()
        stepsField.text = "  Start typing..."
        stepsField.layer.cornerRadius = 15.0
        stepsField.layer.borderColor = UIColor.white.cgColor
        stepsField.layer.borderWidth = 1
        stepsField.backgroundColor = .black
        stepsField.textColor = .lightGray
        stepsField.textAlignment = .left
        stepsField.clearsOnBeginEditing = true
        stepsField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepsField)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        let imageHeight: CGFloat = 180
        let labelHeight: CGFloat = 30
        let bigbuffer: CGFloat = 10
        let smallbuffer: CGFloat = 3
        let fieldHeight: CGFloat = 100
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: imageHeight),
            image.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo:image.bottomAnchor, constant: bigbuffer), descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            descriptionLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        
        NSLayoutConstraint.activate([
            descriptionField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: smallbuffer),
            descriptionField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: bigbuffer),
            descriptionField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -bigbuffer),
            descriptionField.heightAnchor.constraint(equalToConstant: fieldHeight)
        ])
        
        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: smallbuffer),
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
    }

}
