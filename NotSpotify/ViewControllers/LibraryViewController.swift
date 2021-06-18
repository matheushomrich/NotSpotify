//
//  ViewController.swift
//  NotSpotify
//
//  Created by Matheus Homrich on 18/06/21.
//

import UIKit

class LibraryViewController: UITableViewController {
    
    private var collections: [MusicCollection] = []
    private var musicService: MusicService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            self.musicService = try MusicService()
            self.collections = musicService?.loadLibrary() ?? []
        } catch {
            print(error)
        }
        
        tableView.dataSource = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return collections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "title-detail", for: indexPath)
        
        //var colecaoteste = musicService?.getCollection(id: collections[0].id)
        
        let musicCollection = collections[indexPath.row]
        //
        //            cell.imageView?.image = musicService?.getCoverImage(forItemIded: collections[1].id)
        //            cell.textLabel?.text = collections[1].title
        //            cell.detailTextLabel?.text = collections[1].type.rawValue + collections[1].mainPerson
        //
        
        cell.imageView?.image = UIImage(named: musicCollection.id)
        cell.textLabel?.text = musicCollection.title
        cell.detailTextLabel?.text = musicCollection.type.rawValue + musicCollection.mainPerson
        
        return cell
    }
    
}

