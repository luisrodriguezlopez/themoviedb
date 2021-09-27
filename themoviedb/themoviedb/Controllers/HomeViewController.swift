//
//  ViewController.swift
//  themoviedb
//
//  Created by Luis Rodríguez López on 26/09/21.
//

import UIKit

class HomeViewController: UIViewController {

    private let collectionView : UICollectionView  = {
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 100, height: 180)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    private var viewModel = MoviesViewModelList()
    private var videosViewModel = VideoListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        setupCV()
        
        self.viewModel.getMovies()
        viewModel.movies.bind { [weak self ] _ in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        videosViewModel.videos.bind { [weak self ] _ in
            DispatchQueue.main.async { [self] in
                guard self?.videosViewModel.selectRow != nil else {
                    return 
                }
                let detailVC = DetailViewController()
                detailVC.videosModel = self!.videosViewModel.videos.value
                self?.showDetailViewController(detailVC, sender: nil)
            }
        }
        
    }
    
    func setupCV() {
        collectionView.frame = view.bounds
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
    }
    
}


extension HomeViewController :  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.value.movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        cell.imageMovie.setCustomImage("https://image.tmdb.org/t/p/w500/\(self.viewModel.movies.value.movies![indexPath.row].poster_path ??  "")")
        cell.titleMovie.text = self.viewModel.movies.value.movies![indexPath.row].title
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = self.viewModel.movies.value.movies![indexPath.row].id
        videosViewModel.selectRow = indexPath.row
        self.videosViewModel.getMovies(id: id!)
             
    }
}
