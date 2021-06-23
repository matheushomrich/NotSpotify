//
//  AlbumDetailViewController.swift
//  NotSpotify
//
//  Created by Matheus Homrich on 22/06/21.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    var musicCollection: MusicCollection?
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumArtist: UILabel!
    @IBOutlet weak var numberOfSongs: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var albumDescription: UILabel!
    @IBOutlet weak var aboutArtirst: UILabel!
    @IBOutlet weak var artistDescription: UILabel!
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumImage.image = UIImage(named: musicCollection!.id)
        albumName.text = musicCollection?.title
        albumArtist.text = musicCollection?.mainPerson
        numberOfSongs.text = "\(String(describing: musicCollection!.musics.count)) songs"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        releaseDate.text = "Released \(dateFormatter.string(from: musicCollection!.referenceDate))"
        albumDescription.text = musicCollection?.albumDescription
        aboutArtirst.text = musicCollection?.mainPerson
        artistDescription.text = musicCollection?.albumArtistDescription
    }
}
