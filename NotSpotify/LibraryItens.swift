//
//  LibraryItens.swift
//  NotSpotify
//
//  Created by Matheus Homrich on 18/06/21.
//

import Foundation

struct Library {
    var type: String
    var id: String
    var title: String
    var mainPerson: String
    var referenceDate: Date
    var albumDescription: String
    var albumArtistDescription: String
    var musics: [Music]
}
