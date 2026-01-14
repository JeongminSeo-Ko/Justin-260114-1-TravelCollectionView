//
//  CityViewController.swift
//  Justin-260114-1-TravelCollectionView
//
//  Created by 서정민 on 1/14/26.
//

import UIKit

class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var cityCollectionView: UICollectionView!
    
    var cityInfo = CityInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        let xib = UINib(nibName: CityCollectionViewCell.identifier, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        
        view.backgroundColor = .white
        cityCollectionView.backgroundColor = .white
        navigationItem.title = "인기 도시"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 240)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        cityCollectionView.collectionViewLayout = layout
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityInfo.city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        
        let item = cityInfo.city[indexPath.item]
        cell.configure(item: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if cityInfo.city[indexPath.item].domestic_travel == false {
            let vc = storyboard!.instantiateViewController(withIdentifier: InternationalCityViewController.identifier) as! InternationalCityViewController
            vc.selectedCity = cityInfo.city[indexPath.item]
            
            let nac = UINavigationController(rootViewController: vc)
            nac.modalPresentationStyle = .fullScreen
            
            present(nac, animated: true)
        } else {
            let vc = storyboard!.instantiateViewController(withIdentifier: DomesticCityViewController.identifier) as! DomesticCityViewController
            vc.selectedCity = cityInfo.city[indexPath.item]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
