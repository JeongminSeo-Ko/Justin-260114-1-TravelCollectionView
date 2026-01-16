//
//  CityCollectionViewCell.swift
//  Justin-260114-1-TravelCollectionView
//
//  Created by 서정민 on 1/14/26.
//

import UIKit

import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {
    static let identifier = "CityCollectionViewCell"
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setCityImageView()
        setNameLabel()
        setExplainLabel()
    }
    
    func setCityImageView() {
        cityImageView.backgroundColor = .black
        cityImageView.layer.borderColor = UIColor.clear.cgColor
        cityImageView.contentMode = .scaleAspectFill
        DispatchQueue.main.async {
            self.cityImageView.layer.cornerRadius = (self.cityImageView.frame.width) / 2
        }
        cityImageView.clipsToBounds = true
    }
    
    func setNameLabel() {
        cityNameLabel.backgroundColor = .clear
        cityNameLabel.text = "cityName"
        cityNameLabel.textColor = .black
        cityNameLabel.textAlignment = .center
        cityNameLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    func setExplainLabel() {
        cityExplainLabel.backgroundColor = .clear
        cityExplainLabel.text = "cityExplain"
        cityExplainLabel.textColor = .systemGray
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.font = .systemFont(ofSize: 12)
        cityExplainLabel.numberOfLines = 2
    }
    
    func configure(item: City) {
        if let url = URL(string: item.city_image) {
            cityImageView.kf.setImage(with: url)
        }
        cityNameLabel.text = item.city_name + " | " + item.city_english_name
        cityExplainLabel.text = item.city_explain
    }
}
