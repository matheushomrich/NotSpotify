//
//  ViewController.swift
//  NotSpotify
//
//  Created by Matheus Homrich on 18/06/21.
//

import UIKit

class LibViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lib: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    
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
        
        lib.dataSource = self
    }
    
    func numberOfSections(in libView: UITableView) -> Int {
        return collections.count
    }
    
    func tableView(_ libView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = libView.dequeueReusableCell(withIdentifier: "title-detail", for: indexPath)
        
        let musicCollection = collections[indexPath.row]
        
        cell.imageView?.image = UIImage(named: musicCollection.id)
        cell.textLabel?.text = musicCollection.title
        cell.detailTextLabel?.text = musicCollection.type.rawValue + " · " + musicCollection.mainPerson
        
        return cell
    }
    
}

