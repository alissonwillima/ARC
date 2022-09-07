//
//  ViewController.swift
//  Articles
//
//  Created by MacbookPro on 10/05/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var article: Articles? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=b74cc1855f5946c2b578cbe57c8ce0d9") {
            WebService().getNews(url: url) { result in
                self.article = result
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.article?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticlesTableViewCell", for: indexPath)
        as! ArticlesTableViewCell
        let article = self.article?.articles[indexPath.row]
        cell.titleLabel.text = article?.title
        cell.descriptionLabel.text = article?.description
        return cell
    }

}

