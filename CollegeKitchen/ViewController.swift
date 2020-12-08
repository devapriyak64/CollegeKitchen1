//
//  ViewController.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    var pushRecipePopUpButton: UIButton!
    
    let pestopasta = Recipe(image: UIImage(named: "pestopasta.jpg")!, recipeTitle: "Pesto Pasta", username: "Jeremy Scheck", shortDescription: "Anyone can make a Pesto Pasta, but not everyone knows how to make a pesto pasta that’s slick with plenty of pesto sauce without adding tons of extra oil! Here’s how I make it.", ingredients: "- Onion\n- Pesto\n- Olive Oil\n- Ziti\n - Parmesan\n- Salt\n- Pepper", steps: "1. Bring a pot of lightly salted water to a rolling boil; cook the fettuccini at a boil until cooked through yet firm to the bite, about 8 minutes; drain. Transfer the fettuccini to a bowl.\n2. Melt the butter in a saucepan over medium heat. Cook the garlic and pesto in the melted butter until warmed, 2 to 3 minutes; pour over the fettuccini and toss to coat.\n3. Season to taste using salt and pepper.")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // title = "Temporary Feed Page"
        
        // temporary button, will be replaced by recipes in UITableView or UICollectionView
        pushRecipePopUpButton = UIButton()
        pushRecipePopUpButton.translatesAutoresizingMaskIntoConstraints = false
        pushRecipePopUpButton.setTitle("Click for Recipe", for: .normal)
        pushRecipePopUpButton.setTitleColor(.black, for: .normal)
        pushRecipePopUpButton.addTarget(self, action: #selector(pushRecipePopUp), for: .touchUpInside)
        view.addSubview(pushRecipePopUpButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            pushRecipePopUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushRecipePopUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushRecipePopUpButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    @objc func pushRecipePopUp() {
        let vc = RecipePopUpViewController(recipe: pestopasta)
        navigationController?.pushViewController(vc, animated: true)
    }


}

