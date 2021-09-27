//
//  MoviesViewModelList.swift
//  themoviedb
//
//  Created by Luis Rodríguez López on 26/09/21.
//

import Foundation


//struct Movies : Codable {
//
//}

class MoviesViewModelList {
    var movies : Observable<MovieListModel> = Observable(MovieListModel())

    func getMovies() {
        ApiServices().getMovies { response in
            self.movies.value = response
        } onError: { error in
        }
    }
}
