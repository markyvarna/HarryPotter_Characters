//
//  CharacterController.swift
//  Harry Potter Info
//
//  Created by Markus Varner on 9/6/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

//http://hp-api.herokuapp.com/api/characters#
import UIKit

class CharacterController {
    
     //MARK: - Properties
    
    static let shared = CharacterController()
    private init(){}
    let baseURL = URL(string: "https://hp-api.herokuapp.com/api/characters")
    var characters: [HPCharacter] = []
    
    
    //MARK: - Fetch Actions
    
    func fetchCharacters(completion: @escaping (Bool) -> Void){
        
        guard let url = baseURL else { fatalError("Error BAD baseURL \(#function) ")}
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error { print("🤬DataTask, bad URL \(error), \(#function)🤬");completion(false); return}
            guard let data = data else {completion(false); return}
            
            do{
                
                let characterArray = try JSONDecoder().decode([HPCharacter].self, from: data)
                self.characters = characterArray
                
                completion(true)
                
            } catch let error {
                print("Error Bad Data \(error) \(error.localizedDescription)");completion(false); return
            }
            
        }.resume()
    }
    
    func fetchImages(character: HPCharacter, completion: @escaping (UIImage?) -> Void) {
        
        
        let url = character.image
        
        
        
            
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Bad Data for IMAGE \(error)")
            }
            guard let data = data else {completion(nil); return}
            
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}
