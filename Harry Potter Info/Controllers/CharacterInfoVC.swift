//
//  CharacterInfoVC.swift
//  Harry Potter Info
//
//  Created by Markus Varner on 9/9/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class CharacterInfoVC: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var houseLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var houseImageView: UIImageView!
    @IBOutlet var infoView: UIView!
    
    
    //MARK: - Properties
    var hpCharacter: HPCharacter? {
        didSet{
            updateView()
            loadImage()
            loadHouseImage()
//            colorByHouse()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func updateView() {
        
        guard let hpCharacter = hpCharacter else {return}
        DispatchQueue.main.async {
            self.nameLabel.text = hpCharacter.name
            self.speciesLabel.text = hpCharacter.species
            self.houseLabel.text = hpCharacter.house
        }
        
    }
    
    func loadImage() {
        
        guard let hpCharacter = hpCharacter else {return}
        CharacterController.shared.fetchImages(character: hpCharacter) { (image) in
            if image != nil {
                DispatchQueue.main.async {
                    self.characterImageView.image = image
                    
                }
            }
        }
        
    }
    
    func loadHouseImage() {
//
//
        guard let hpCharacter = hpCharacter else {return}
//
        DispatchQueue.main.async {
            switch hpCharacter.house {
            case "Slytherin":
                self.houseImageView.image = UIImage(named: "slytherin")
            //                self.infoView.backgroundColor = UIColor(red: 0, green: 0.8, blue: 0.4, alpha: 0.4)
            case "Gryffindor":
                self.houseImageView.image = UIImage(named: "gryiffindor")
            //                self.infoView.backgroundColor = UIColor(red: 0.8, green: 0.3, blue: 0.1, alpha: 0.5)
            case "Ravenclaw":
                self.houseImageView.image = UIImage(named: "ravenclaw")
            //                self.infoView.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 0.8, alpha: 0.5)
            case "Hufflepuff":
                self.houseImageView.image = UIImage(named: "hufflpuff")
            //                self.infoView.backgroundColor = UIColor(red: 0.9, green: 0.8, blue: 0, alpha: 0.6)
            default:
                self.houseImageView.image = UIImage(named: "wizardHat")
                //                self.infoView.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 0.8, alpha: 0.5)
                //
            }
        }
        
//
    }
    
}
