//
//  DetailVideoCollectionViewCell.swift
//  themoviedb
//
//  Created by Luis Rodríguez López on 27/09/21.
//

import UIKit
import YoutubePlayer_in_WKWebView
class DetailVideoCollectionViewCell: UICollectionViewCell {
    let webView : WKYTPlayerView = {
        let webView =  WKYTPlayerView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupViews() {
        self.addSubview(webView)
        webView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        webView.rightAnchor.constraint(equalTo:  contentView.rightAnchor).isActive = true
        webView.topAnchor.constraint(equalTo:  contentView.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor).isActive = true
     
     }
}
