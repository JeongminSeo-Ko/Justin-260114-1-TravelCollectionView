//
//  SpotCollectionViewCell.swift
//  Justin-260114-1-TravelCollectionView
//
//  Created by 서정민 on 1/15/26.
//

import UIKit

class SpotCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SpotCollectionViewCell"
    
    @IBOutlet var spotNameLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var spotButton: UIButton!
    @IBOutlet var linkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setSpotNameLabel()
        setCityLabel()
        setSpotButton()
        setLinkImageView()
        
    }
        
    func setSpotNameLabel() {
        spotNameLabel.backgroundColor = .clear
        spotNameLabel.text = "spotName"
        spotNameLabel.textColor = .black
        spotNameLabel.textAlignment = .center
        spotNameLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        spotNameLabel.layer.borderColor = UIColor.clear.cgColor
    }
    
    func setCityLabel() {
        cityLabel.backgroundColor = .clear
        cityLabel.text = "city"
        cityLabel.textColor = .systemGray
        cityLabel.textAlignment = .center
        cityLabel.font = .systemFont(ofSize: 12)
        cityLabel.layer.borderColor = UIColor.clear.cgColor
    }
    
    func setSpotButton() {
        spotButton.setTitle("", for: .normal)
        spotButton.backgroundColor = .opaqueTint
        spotButton.layer.cornerRadius = 10
        spotButton.clipsToBounds = true
        spotButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    func setLinkImageView() {
        linkImageView.image = UIImage(systemName: "link")
        linkImageView.contentMode = .scaleAspectFit
        linkImageView.tintColor = .tintColor
        linkImageView.backgroundColor = .clear
        linkImageView.layer.borderColor = UIColor.clear.cgColor
    }

}
