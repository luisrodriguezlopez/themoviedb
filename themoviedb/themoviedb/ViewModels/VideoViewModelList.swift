//
//  VideoViewModelList.swift
//  themoviedb
//
//  Created by Luis Rodríguez López on 27/09/21.
//

import Foundation


class VideoListViewModel {
    var videos : Observable<VideosModel> = Observable(VideosModel())
    var selectRow : Int!

    func getMovies(id : Int) {
        ApiServices().getVideos(id: id) { response in
            self.videos.value = response
        } onError: { error in
        }
    }
         
}
