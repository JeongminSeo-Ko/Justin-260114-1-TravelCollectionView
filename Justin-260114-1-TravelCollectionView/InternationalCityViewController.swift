//
//  InternationalCityViewController.swift
//  Justin-260114-1-TravelCollectionView
//
//  Created by 서정민 on 1/14/26.
//

import UIKit

class InternationalCityViewController: UIViewController {
    
    static let identifier = "InternationalCityViewController"
    
    @IBOutlet var cityNameLabel: UILabel!
    
    var selectedCity: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "해외 인기 도시 이름"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(rightBarButtonItemClicked))
        
        setCityNameLabel()
    }
    
    func setCityNameLabel() {
        cityNameLabel.backgroundColor = .clear
        cityNameLabel.textColor = .black
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = .systemFont(ofSize: 13)
        cityNameLabel.layer.borderColor = UIColor.clear.cgColor
        
        if let selectedCity {
            cityNameLabel.text = "해외 명소: " + selectedCity.city_name + " | " + selectedCity.city_english_name
        } else {
            cityNameLabel.text = ""
        }
    }
    
    @objc func rightBarButtonItemClicked() {
        dismiss(animated: true)
    }
    
}
