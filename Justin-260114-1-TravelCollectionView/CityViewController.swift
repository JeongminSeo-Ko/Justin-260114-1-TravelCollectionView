//
//  CityViewController.swift
//  Justin-260114-1-TravelCollectionView
//
//  Created by 서정민 on 1/14/26.
//

import UIKit

class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var travelSegmentedControl: UISegmentedControl!
    @IBOutlet var cityCollectionView: UICollectionView!
    
    var cityInfo = CityInfo()
    var selectedCities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        let xib = UINib(nibName: CityCollectionViewCell.identifier, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        
        view.backgroundColor = .white
        cityCollectionView.backgroundColor = .white
        navigationItem.title = "인기 도시"
        setTravelSegmentedControl()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 240)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        cityCollectionView.collectionViewLayout = layout
        
        selectedCities = cityInfo.city
    }
    
    func setTravelSegmentedControl() {
        travelSegmentedControl.removeAllSegments()
        travelSegmentedControl.insertSegment(withTitle: "모두", at: 0, animated: false)
        travelSegmentedControl.insertSegment(withTitle: "국내", at: 1, animated: false)
        travelSegmentedControl.insertSegment(withTitle: "해외", at: 2, animated: false)
        travelSegmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func travelSegmentedControlSelected(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedCities = cityInfo.city
            cityCollectionView.reloadData()
        case 1:
            selectedCities = cityInfo.domesticCities
            cityCollectionView.reloadData()
        case 2:
            selectedCities = cityInfo.internationalCities
            cityCollectionView.reloadData()
        default:
            break
        }
        if selectedCities.count > 0 {
            cityCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedCities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        
        let item = selectedCities[indexPath.item]
        cell.configure(item: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedCities[indexPath.item].domestic_travel == false {
            let vc = storyboard!.instantiateViewController(withIdentifier: InternationalCityViewController.identifier) as! InternationalCityViewController
            vc.selectedCity = selectedCities[indexPath.item]
            
            let nac = UINavigationController(rootViewController: vc)
            nac.modalPresentationStyle = .fullScreen
            
            present(nac, animated: true)
        } else {
            let vc = storyboard!.instantiateViewController(withIdentifier: DomesticCityViewController.identifier) as! DomesticCityViewController
            vc.selectedCity = selectedCities[indexPath.item]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
