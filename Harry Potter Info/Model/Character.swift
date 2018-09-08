//
//  Character.swift
//  Harry Potter Info
//
//  Created by Markus Varner on 9/6/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

struct HPCharacters: Decodable {
    let characters: [HPCharacter]
}
struct HPCharacter: Decodable {
    let name: String
    let species: String
    let house: String
    let image: URL
}
