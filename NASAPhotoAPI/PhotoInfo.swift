//
//  PhotoInfo.swift
//  NASAPhotoAPI
//
//  Created by Amaan on 2018-01-02.
//  Copyright © 2018 Amaan Khan. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {

//    var date: String
//    var explanation: String
//    var hdurl: String
//    var media_type: String
//    var service_version: String
//    var title: String
//    var url: String
    
    var title: String
    var description: String
    var url: URL
    var copyright: String?

    enum Keys: String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: Keys.self)
        self.title = try valueContainer.decode(String.self, forKey: Keys.title)
        self.description = try valueContainer.decode(String.self, forKey: Keys.description)
        self.url = try valueContainer.decode(URL.self, forKey: Keys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: Keys.copyright)
    }
}
