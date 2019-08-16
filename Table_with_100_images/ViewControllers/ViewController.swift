//
//  ViewController.swift
//  Table_with_100_images
//
//  Created by Andrey on 15/08/2019.
//  Copyright © 2019 Andrey Kochetkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let imageLoader = ImageLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
    }

    func setupTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let url = URL(string: URLBase.base + "\(indexPath.row + 1)") else { return UITableViewCell() }
        imageLoader.downloadImage(withURL: url, forCell: cell)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //MARK: - Dысоту ячейки решил взять с небольшим запасом
        return 160
    }
}



