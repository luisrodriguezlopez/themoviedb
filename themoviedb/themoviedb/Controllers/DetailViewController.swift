//
//  DetailViewController.swift
//  themoviedb
//
//  Created by Luis Rodríguez López on 27/09/21.
//

import UIKit
import AVKit
//import AVPlayer
class DetailViewController: UIViewController {
    var videosModel : VideosModel!
    private let collectionView : UICollectionView  = {
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 300, height: 300)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DetailVideoCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(collectionView)
        collectionView.frame = view.bounds
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}


extension DetailViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videosModel.listVideos.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailVideoCollectionViewCell
        cell.webView.load(withVideoId: videosModel.listVideos[indexPath.row].key!)
        cell.isUserInteractionEnabled = true
       return cell
   }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=\(videosModel.listVideos[indexPath.row].key!)")!, options: [:])    }

    
}
