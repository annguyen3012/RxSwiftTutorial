//
//  MusicListViewController.swift
//  RxSwiftTutorial
//
//  Created by An Nguyen Q. VN.Danang on 05/08/2022.
//  Copyright © 2022 MBA0217. All rights reserved.
//

import UIKit
import RxSwift

final class MusicListViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var disposedBag: DisposeBag = DisposeBag()
    let viewModel = MusicListViewModel()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        callAPI()
    }
    
    // MARK: - Private functions
    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rx.setDelegate(self)
            .disposed(by: disposedBag)

        viewModel.behaviorRelay.bind(to: tableView.rx.items(cellIdentifier: "cell")) { (index, element, cell) in
            cell.textLabel?.text = element.name
            if let urlString = element.artworkUrl100 {
                cell.imageView?.image = UIImage(url: URL(string: urlString))
            }
            cell.detailTextLabel?.text = element.artistName
        }
        .disposed(by: disposedBag)
        
        tableView.rx.modelDeselected(Music.self)
            .subscribe { event in
                print(event.element)
            }
            .disposed(by: disposedBag)
    }
    
    private func setupUI() {
        title = "My Musics"
        searchBar.rx.text
            .throttle(0.7, scheduler: MainScheduler.instance)
            .subscribe(onNext: { element in
                if let element = element {
                    print("search:", element)
                    self.search(element)
                }
            })
            .disposed(by: disposedBag)
    
    }
    
    private func callAPI() {
        viewModel.getApiMusic()
            .subscribe { [weak self] data in
                guard let this = self else { return }
                this.viewModel.musics = data.results ?? []
                this.viewModel.behaviorRelay.accept(this.viewModel.musics)
            } onError: { error in
                print(error.localizedDescription)
            }
            .disposed(by: disposedBag)
    }
    
    private func search(_ query: String) {
        if !query.isEmpty {
            viewModel.behaviorRelay.accept(viewModel.musics.filter { $0.name?.uppercased().contains(query.uppercased()) ?? false })
        } else {
            viewModel.behaviorRelay.accept(viewModel.musics)
        }
    }
}

extension MusicListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

enum APIError: Error {
    case pathError
    case error(String)
    
    var localizedDescription: String {
        switch self {
        case .pathError:
            return "URL not found"
        case .error(let errorMessage):
            return errorMessage
        }
    }
}
