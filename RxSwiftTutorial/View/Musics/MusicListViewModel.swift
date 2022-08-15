//
//  MusicListViewModel.swift
//  RxSwiftTutorial
//
//  Created by An Nguyen Q. VN.Danang on 05/08/2022.
//  Copyright © 2022 MBA0217. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

final class MusicListViewModel {
    var behaviorRelay: BehaviorRelay<[Music]> = .init(value: [])
    var loadingReplay: BehaviorRelay<Bool> = .init(value: false)
    var musics: [Music] = []

    func getApiMusic() -> Single<FeedResults> {
        return ApiManager.shared.loadAPI(method: .get)
    }
}
