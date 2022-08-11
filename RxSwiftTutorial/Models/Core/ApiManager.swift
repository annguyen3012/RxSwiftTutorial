//
//  ApiManager.swift
//  RxSwiftTutorial
//
//  Created by An Nguyen Q. VN.Danang on 08/08/2022.
//  Copyright © 2022 MBA0217. All rights reserved.
//

import Foundation
import RxSwift

class ApiManager {
    static let shared: ApiManager = ApiManager()
    let baseUrl: String = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
    let disposedBag: DisposeBag = DisposeBag()
    
    func loadAPI<T: Decodable>(method: Method) -> Single<T> {
        return Single<T>.create { [weak self] single -> Disposable in
            guard let this = self,
                  let path = URL(string: this.baseUrl) else {
                single(.error(APIError.pathError))
                return Disposables.create()
            }
            let observable = Observable<URL>.just(path)
                .map { URLRequest(url: $0) }
                .flatMap { urlRequest -> Observable<(response: HTTPURLResponse, data: Data)> in
                    return URLSession.shared.rx.response(request: urlRequest)
                }
            
//            var request = URLRequest(url: path)
//            request.httpMethod = method.rawValue
//            request.addValue("application/json", forHTTPHeaderField: "Content-type")
            
//            let task = URLSession.shared.rx.response(request: request)
            
            observable.subscribe { (response, data) in
                do {
                    let modal: T = try JSONDecoder().decode(T.self, from: data)
                    single(.success(modal))
                } catch {
                    single(.error(APIError.error("Fail parse data")))
                }
            } onError: { error in
                single(.error(error))
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("disposed")
            }
            .disposed(by: this.disposedBag)
            
            return Disposables.create()
        }
        .observeOn(MainScheduler.instance)
    }
}

extension ApiManager {
    enum Method: String {
        case get
        case post
        case put
        case delete
    }
}

