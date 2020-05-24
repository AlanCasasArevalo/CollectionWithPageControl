//
//  HomeViewController.swift
//  CollectionWithPageControl
//
//  Created by Alan Casas on 24/05/2020.
//  Copyright © 2020 Alan Casas. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var containerTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    func setupTableView () {
        setupRegisters()
        setupDelegates()
    }
    
    func setupRegisters () {
        containerTableView.register(UINib.init(nibName: NibName.homeTableViewCell, bundle: nil), forCellReuseIdentifier: NibName.homeTableViewCell)
    }
    
    func setupDelegates () {
        containerTableView.delegate = self
        containerTableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NibName.homeTableViewCell, for: indexPath) as! HomeTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
}
