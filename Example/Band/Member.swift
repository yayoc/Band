//
//  Member.swift
//  Band
//
//  Created by yayoc on 10/26/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation

struct Member {
    let name: String
}

extension Member {
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String else {
            return nil
        }
        self.name = name
    }
}

extension Member {
    static func members(completion: @escaping ([Member], Error?) -> Void) {
        let url = URL(string: "https://api.myjson.com/bins/38vjc")
        let session = URLSession(configuration: .default)
        let request = URLRequest(url: url!)
        session.dataTask(with: request) { (data, response, error) in
            var members: [Member] = []
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let membersJson = json?["members"] as? [[String: Any]] {
                    members = membersJson.map({ (result) -> Member? in
                        return Member(json: result)
                    }).flatMap{ $0 }
                }
            }
            DispatchQueue.main.async {
                completion(members, error)
            }
            }.resume()
    }
}
