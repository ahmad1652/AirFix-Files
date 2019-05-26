//
//  Models.swift
//  AirFix
//
//  Created by Ahmad Mustafa on 5/3/19.
//  Copyright © 2019 Pixel. All rights reserved.
//

import UIKit

class Models: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet weak var CollectionMenu: UICollectionView!
    
    @IBOutlet weak var tableMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionMenu.delegate = self
        CollectionMenu.dataSource = self
        
        tableMenu.delegate = self
        tableMenu.dataSource = self

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "umniahTable", for: indexPath)
        return cell
    }
    
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.frame.width / 1.25
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detected", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "uminahCollectionView", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detected", sender: self)
    }
    

    

    
    
    

}
