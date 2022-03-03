//
//  ManagerServices.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 3/3/22.
//

import Foundation
import RxSwift

class ManagerServices {

    func getPopularMovies() -> Observable <[Movie]> {

        return Observable.create { observer in

            let session = URLSession.shared
            var request = URLRequest(url:
                URL(string: Constants.URL.main
                    + Constants.Endpoints.urlListPopularMovies
                    + Constants.apiKey)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            session.dataTask(with: request) { (data, response, error) in

                guard let data = data,
                    let response = response as? HTTPURLResponse,
                    error == nil else { return }

                if response.statusCode == 200 {
                    do {
                        let movies = try JSONDecoder().decode(Movies.self, from: data)
                        observer.onNext(movies.listOfMovies)
                    } catch let error {
                        observer.onError(error)
                        print("Unknown error in call: " + "\(error)")
                    }
                }

                observer.onCompleted()
            }.resume()

            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }

    func getDetailsMovie() {
        
    }
}
