//
//  Music.swift
//  RxSwiftTutorial
//
//  Created by An Nguyen Q. VN.Danang on 05/08/2022.
//  Copyright © 2022 MBA0217. All rights reserved.
//

import Foundation

final class Music: Decodable {
    var artistName: String?
    var id: String?
    var name: String?
    var releaseDate: String?
    var copyright: String?
    var artworkUrl100: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case id
        case name
        case releaseDate
        case copyright
        case artworkUrl100
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        artistName = try? container.decode(String.self, forKey: .artistName)
        id = try? container.decode(String.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        releaseDate = try? container.decode(String.self, forKey: .releaseDate)
        copyright = try? container.decode(String.self, forKey: .copyright)
        artworkUrl100 = try? container.decode(String.self, forKey: .artworkUrl100)
    }
}

struct FeedResults: Decodable {
    var results: [Music]?

    enum CodingKeys: String, CodingKey {
        case feed
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let feed = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .feed)
        results = try? feed.decode([Music].self, forKey: .results)
    }
}
