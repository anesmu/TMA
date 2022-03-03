//
//  HomeViewController.swift
//  TMA
//
//  Created by Antonio Espino Muñoz on 3/3/22.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "The Movies app"
        
        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()
        
        viewModel.bind(view: self, router: router)
        
        getData()
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "CustomMovieCell", bundle: nil),
                           forCellReuseIdentifier: "CustomMovieCell")
    }
    
    private func getData() {
        return viewModel.getListMovies()
            .subscribe(on: MainScheduler.instance)
            .subscribe(
                onNext: { movies in
                    self.movies = movies
                    self.reloadTableView()
                }, onError: { error in
                    print("Unknown error: " + error.localizedDescription)
                }, onCompleted: {
                    // not necessary
                }).disposed(by: disposeBag)
        // Dar por completado la secuencia de RxSwift
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
        tableView.dequeueReusableCell(withIdentifier:"CustomMovieCell") as! CustomMovieCell
        
        cell.imageMovie.imageFromServerURL(urlString: Constants.URL.urlImages + movies[indexPath.row].image,
                                           placeHolderImage: UIImage(named: "placeHolder")!)
        cell.titleMovie.text = movies[indexPath.row].title
        cell.descriptionMovie.text = movies[indexPath.row].sinopsis
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
