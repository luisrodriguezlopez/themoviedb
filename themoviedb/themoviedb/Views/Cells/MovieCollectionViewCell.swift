//
//  MovieCollectionViewCell.swift
//  themoviedb
//
//  Created by Luis Rodríguez López on 26/09/21.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    let imageMovie : UIImageView = {
        let image =  UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        return image
    }()
    
    let titleMovie : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.init(name: "AvenirNext-Medium", size: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let viewBckgroundGray : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupViews() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        contentView.addSubview(imageMovie)
        contentView.addSubview(viewBckgroundGray)
        contentView.addSubview(titleMovie)

        imageMovie.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageMovie.rightAnchor.constraint(equalTo:  contentView.rightAnchor).isActive = true
        imageMovie.topAnchor.constraint(equalTo:  contentView.topAnchor).isActive = true
        imageMovie.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor).isActive = true

        viewBckgroundGray.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        viewBckgroundGray.rightAnchor.constraint(equalTo:  contentView.rightAnchor).isActive = true
        viewBckgroundGray.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewBckgroundGray.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor).isActive = true
        
        titleMovie.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        titleMovie.rightAnchor.constraint(equalTo:  contentView.rightAnchor, constant:  -8).isActive = true
        titleMovie.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor, constant: -4 ).isActive = true
        titleMovie.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    override func prepareForReuse() {
        self.imageMovie.image = nil
        self.titleMovie.text = ""
    }

}
