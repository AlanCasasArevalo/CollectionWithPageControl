//
//  HomeTableViewCell.swift
//  CollectionWithPageControl
//
//  Created by Alan Casas on 24/05/2020.
//  Copyright © 2020 Alan Casas. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let imageArray = ["Alan&Sol", "Bibi&Arik", "BibiExplicando", "BibiSenalando1", "BibiSenalando2", "Los3", "Montana", "Sol"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollection()
    }
    
    func setupCollection () {
        setupRegister()
        setupCollectionDelegate()
        setupPageControl()
    }
    
    func setupRegister () {
        cardCollectionView.register(UINib.init(nibName: NibName.homeCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: NibName.homeCollectionViewCell)
    }
    
    func setupCollectionDelegate () {
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
    }
    
    func setupPageControl () {
        pageControl.numberOfPages = imageArray.count
        pageControl.pageIndicatorTintColor = .magenta
        pageControl.currentPageIndicatorTintColor = .cyan
    }
}

extension HomeTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NibName.homeCollectionViewCell, for: indexPath) as! HomeCollectionViewCell
        let imageToShow = imageArray[indexPath.row]
        cell.cardImageView.image = UIImage(named: imageToShow)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //top, left, bottom, right
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / cardCollectionView.frame.size.width)
        pageControl.currentPage = index
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pag = pageControl.currentPage
        cardCollectionView.scrollToItem(at: IndexPath(item: pag , section: 0), at: .centeredHorizontally, animated: true)
        cardCollectionView.layoutSubviews() // **Sin esta linea el efecto no será visible.**
    }
}
