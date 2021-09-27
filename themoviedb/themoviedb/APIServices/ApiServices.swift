//
//  ApiServices.swift
//  themoviedb
//
//  Created by Luis Rodríguez López on 27/09/21.
//

import Foundation


class ApiServices {
    
    func getMovies(success : @escaping (_ movies : MovieListModel) -> () , onError: @escaping(_ error:NSError) -> ()) {
        let apiKey: String = "75da63446392532806d68cbf9cf68d77"
        let baseURL: String = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)"
        self.getCall(url: baseURL) { data in
            guard  let dataJson = try? JSONDecoder().decode(MovieListModel.self, from: data)  else {
                return
            }
            success(dataJson)
        } onError: { error in
            onError(error)
        }
    }

    func getVideos(id: Int,success : @escaping (_ videos : VideosModel) -> () , onError: @escaping(_ error:NSError) -> ()) {
        let apiKey: String = "75da63446392532806d68cbf9cf68d77"
        let baseURL: String = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=\(apiKey)"
        self.getCall(url: baseURL) { data in
            guard  let dataJson = try? JSONDecoder().decode(VideosModel.self, from: data)  else {
                return
            }
            success(dataJson)
        } onError: { error in
            onError(error)
        }
    }
    func getCall(url: String ,success : @escaping (_ data : Data) -> () , onError: @escaping(_ error:NSError) -> ()){
        let baseURL = URL(string: url)
        var request = URLRequest(url: baseURL!)
        let jsonHeader = "application/json"
        request.setValue(jsonHeader, forHTTPHeaderField: "Accept")
        request.setValue(jsonHeader, forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, httpResponse, error in
            guard let status = httpResponse as? HTTPURLResponse, (200...299).contains(status.statusCode) else {
                return
            }
            guard error == nil else {
                onError(error! as NSError)
                return
            }
            success(data!)
            
        }
        task.resume()
    }
}

