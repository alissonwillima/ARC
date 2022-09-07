//
//  WebService.swift
//  Articles
//
//  Created by MacbookPro on 17/05/22.
//

import Foundation

class WebService {
    
    func getNews(url: URL, completion: @escaping (Articles?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(nil)
            } else if let dataOkay = data {
                let newsList = try? JSONDecoder().decode(Articles.self, from: dataOkay)
                completion(newsList)
            }
        }.resume()
    }
}
