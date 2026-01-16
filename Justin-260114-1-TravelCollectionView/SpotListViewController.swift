//
//  SpotListViewController.swift
//  Justin-260114-1-TravelCollectionView
//
//  Created by 서정민 on 1/15/26.
//

import UIKit

class SpotListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let identifier = "SpotListViewController"
    
    @IBOutlet var spotListCollectionView: UICollectionView!
    
    let touristSpot = TouristSpotInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spotListCollectionView.delegate = self
        spotListCollectionView.dataSource = self
        let spotXib = UINib(nibName: SpotCollectionViewCell.identifier, bundle: nil)
        let adXib = UINib(nibName: AdCollectionViewCell.identifier, bundle: nil)
        spotListCollectionView.register(spotXib, forCellWithReuseIdentifier: SpotCollectionViewCell.identifier)
        spotListCollectionView.register(adXib, forCellWithReuseIdentifier: AdCollectionViewCell.identifier)
        
        view.backgroundColor = .white
        spotListCollectionView.backgroundColor = .white
        navigationItem.title = "Hot 명소"
        
        let inset: CGFloat = 4
        let spacing: CGFloat = 0
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        let width = UIScreen.main.bounds.width - (inset) * 2 - (spacing) * 2 - 3
        layout.itemSize = CGSize(width: width / 3, height: width / 3.5)
        
        spotListCollectionView.collectionViewLayout = layout
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return touristSpot.spots.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if touristSpot.spots[indexPath.item].ad == false {
            let cell = spotListCollectionView.dequeueReusableCell(withReuseIdentifier: SpotCollectionViewCell.identifier, for: indexPath) as! SpotCollectionViewCell
            cell.spotNameLabel.text = touristSpot.spots[indexPath.item].koreanName
            cell.cityLabel.text = touristSpot.spots[indexPath.item].city
            return cell
        } else {
            let cell = spotListCollectionView.dequeueReusableCell(withReuseIdentifier: AdCollectionViewCell.identifier, for: indexPath) as! AdCollectionViewCell
            cell.adContentLabel.text = touristSpot.spots[indexPath.item].koreanName
            return cell
        }
        
    }

}
