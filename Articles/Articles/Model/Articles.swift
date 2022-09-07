//
//  Articles.swift
//  Articles
//
//  Created by MacbookPro on 10/05/22.
//

import Foundation
//DECODABLE SERVE PARA FAZER A CONVERSAO DE UM DADO EXTERNO TIPO JSON PARA O SWIFT!!!
struct Articles: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
    let urlToImage: String
}
