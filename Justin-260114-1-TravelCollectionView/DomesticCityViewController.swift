//
//  DomesticCityViewController.swift
//  Justin-260114-1-TravelCollectionView
//
//  Created by 서정민 on 1/14/26.
//

import UIKit

import Kingfisher

class DomesticCityViewController: UIViewController {
    
    static let identifier = "DomesticCityViewController"
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    @IBOutlet var explorationButton: UIButton!
    
    var selectedCity: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "국내 인기 도시 화면"
        
        setCityImageView()
        setNameLabel()
        setExplainLabel()
        setExplorationButton()
        
    }
    
    func setCityImageView() {
        cityImageView.backgroundColor = .black
        cityImageView.layer.borderColor = UIColor.clear.cgColor
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 20
        cityImageView.clipsToBounds = true
        
        if let selectedCity {
            if let url = URL(string: selectedCity.city_image) {
                cityImageView.kf.setImage(with: url)
            }
        }
    }
    
    func setNameLabel() {
        cityNameLabel.backgroundColor = .clear
        cityNameLabel.textColor = .black
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = .boldSystemFont(ofSize: 24)
        
        if let selectedCity {
            cityNameLabel.text = selectedCity.city_name + "  |  " + selectedCity.city_english_name
        } else {
            cityNameLabel.text = ""
        }
    }
    
    func setExplainLabel() {
        cityExplainLabel.backgroundColor = .clear
        cityExplainLabel.textColor = .systemGray
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.font = .systemFont(ofSize: 14)
        cityExplainLabel.numberOfLines = 2
        
        if let selectedCity {
            cityExplainLabel.text = selectedCity.city_explain
        } else {
            cityExplainLabel.text = ""
        }
    }
    
    func setExplorationButton() {
        explorationButton.backgroundColor = .tintColor
        explorationButton.setTitle("다른 관광지 보러 가기", for: .normal)
        explorationButton.setTitleColor(.white, for: .normal)
        explorationButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .heavy)
        explorationButton.layer.cornerRadius = 20
        explorationButton.clipsToBounds = true
    }
    
    @IBAction func explorationButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
