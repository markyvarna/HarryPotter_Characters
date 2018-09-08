//
//  HPTableViewCell.swift
//  Harry Potter Info
//
//  Created by Markus Varner on 9/8/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class HPTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet var hpCharacterImageView: RoundImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var houseLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    
    //MARK: - Properties
    
    var hpCharacter: HPCharacter? {
        didSet{
            
            self.updateView()
            self.updateImage()
            self.colorByHouse()
            
            
        }
    }
    
    //MARK: - Update Actions
    
    func updateView() {
        CharacterController.shared.fetchCharacters { (success) in
            if success {
                DispatchQueue.main.async {
                    guard let hpCharacter = self.hpCharacter else {return}
                    self.nameLabel.text = hpCharacter.name
                    self.speciesLabel.text = hpCharacter.species
                    self.houseLabel.text = hpCharacter.house
                }
            } else {
                print("😭Error with Fetching Characters!!😭")
            }
        }
        //hpCharacterImageView.image =
    }
    
    func updateImage() {
        guard let hpCharacter = self.hpCharacter else {return}
        CharacterController.shared.fetchImages(character: hpCharacter, completion: { (image) in
            if let image = image {
                
                DispatchQueue.main.async {
                    self.hpCharacterImageView.image = image
                }
            } else {
                print("😭Image was NIL!!😭")
            }
        })
    }
    
    //MARK: - UI
    
    func colorByHouse() {
        
        guard let hpCharacter = self.hpCharacter else {return}
        
        DispatchQueue.main.async {
            switch hpCharacter.house {
            case "Slytherin":
                self.backgroundColor = UIColor(red: 0, green: 0.8, blue: 0.4, alpha: 0.4)
            case "Gryffindor":
                self.backgroundColor = UIColor(red: 0.8, green: 0.3, blue: 0.1, alpha: 0.5)
            case "Ravenclaw":
                self.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 0.8, alpha: 0.5)
            case "Hufflepuff":
                self.backgroundColor = UIColor(red: 0.9, green: 0.8, blue: 0, alpha: 0.6)
            default:
                self.backgroundColor = UIColor(red: 0.7, green: 0.5, blue: 0.8, alpha: 0.5)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
          
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
