//
//  HPListTableViewController.swift
//  Harry Potter Info
//
//  Created by Markus Varner on 9/8/18.
//  Copyright © 2018 Markus Varner. All rights reserved.
//

import UIKit

class HPListTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CharacterController.shared.characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hpCell", for: indexPath) as? HPTableViewCell
        let hpCharacter = CharacterController.shared.characters[indexPath.row]
        cell?.hpCharacter = hpCharacter
        
        
        return cell ?? UITableViewCell()
    }
    
    func updateView() {
        
        CharacterController.shared.fetchCharacters { (success) in
            if success {
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                    
                }
            }
        }
        
    }

    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
