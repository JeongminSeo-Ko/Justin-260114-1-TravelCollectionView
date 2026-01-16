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
        
        setNavigationBarButtonItem()
        setTravelSegmentedControl()
        
        let inset: CGFloat = 25
        let itemSpacing: CGFloat = 40
        let lineSpacing: CGFloat = 5
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layout.minimumInteritemSpacing = itemSpacing
        layout.minimumLineSpacing = lineSpacing
        
        let width = UIScreen.main.bounds.width - (inset) * 2 - (itemSpacing)
        layout.itemSize = CGSize(width: width / 2, height: width / 1.3)
        
        cityCollectionView.collectionViewLayout = layout
        
        travelSegmentedControlSelected(travelSegmentedControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationItemTitle()
    }
    
    func setNavigationItemTitle() {
        if let nickname = UserDefaults.standard.string(forKey: "nickname") {
            navigationItem.title = nickname + "님 환영합니다!"
        } else {
            navigationItem.title = "인기 도시"
        }
    }
    
    func setNavigationBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:  UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "flame.fill"), style: .plain, target: self, action: #selector(leftBarButtonItemClicked))
        navigationItem.leftBarButtonItem?.tintColor = .red
    }
    
    @objc func rightBarButtonItemClicked() {
        let vc = storyboard!.instantiateViewController(withIdentifier: ProfileSettingTableViewController.identifier)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func leftBarButtonItemClicked() {
        let vc = storyboard!.instantiateViewController(withIdentifier: SpotListViewController.identifier)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setTravelSegmentedControl() {
        travelSegmentedControl.removeAllSegments()
        travelSegmentedControl.insertSegment(withTitle: "모두", at: 0, animated: false)
        travelSegmentedControl.insertSegment(withTitle: "국내", at: 1, animated: false)
        travelSegmentedControl.insertSegment(withTitle: "해외", at: 2, animated: false)
        travelSegmentedControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "lastSelectedSegmentIndex") // 최초 선택 시 '0'으로 세팅되어 '모두' 선택됨
    }
    
    @IBAction func travelSegmentedControlSelected(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedCities = cityInfo.city
            UserDefaults.standard.set(0, forKey: "lastSelectedSegmentIndex")
            cityCollectionView.reloadData()
        case 1:
            selectedCities = cityInfo.domesticCities
            UserDefaults.standard.set(1, forKey: "lastSelectedSegmentIndex")
            cityCollectionView.reloadData()
        case 2:
            selectedCities = cityInfo.internationalCities
            UserDefaults.standard.set(2, forKey: "lastSelectedSegmentIndex")
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
