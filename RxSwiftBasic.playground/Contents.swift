import UIKit
import RxSwift
import RxCocoa
import Combine

//let disposeBag = DisposeBag()
//
//let helloRx = Observable.just("Hello RxSwift")
//helloRx.subscribe { val in
//    print(val)
//}

let iOS = 1
//let android = 2
//let flutter = 3
//
let observable1 = Observable<Int>.just(iOS)
//let observable2 = Observable.of(iOS, android, flutter)
//let observable3 = Observable.of([iOS, android, flutter])
//let observable4 = Observable.from([iOS, android, flutter])
//
observable1.subscribe { event in
//    if let element = event.element {
//        print(element)
//    }
    print("observable1:", event)
}
//
//
//observable2.subscribe { print("observable:", $0) }
//
//observable4.subscribe(onNext: { (value) in
//        print(value)
//    }, onError: { (error) in
//        print(error.localizedDescription)
//    }, onCompleted: {
//        print("Completed")
//    }) {
//        print("Disposed")
//    }
//

//let bag = DisposeBag()
//
//enum MyError: Error {
//    case anError
//}
//
//func convertNumber(_ str: String?) -> Maybe<Any> {
//    return Maybe<Any>.create { maybe in
//        if let str = str {
//            if let number = Int(str) {
//                maybe(.success(number))
//            } else {
//                maybe(.error(MyError.anError))
//            }
//        } else {
//            maybe(.completed)
//        }
//        return Disposables.create {}
//    }
//}
//func printResult(_ str: String? = nil) {
//    convertNumber(str).subscribe { event in
//        switch event {
//        case .completed:
//            print("Completed!")
//        case .success(let str):
//            print("Success: \(str)")
//        case .error(let error):
//            print("Error: \(error.localizedDescription)")
//        }
//    }
//}
//
//printResult()
//printResult("1")
//printResult("a")

//let disposeBag = DisposeBag()
//let subject = PublishSubject<String>()
//
//subject.onNext("1")
//
//    // subscribe 1
//subject
//    .subscribe(onNext: { value in
//        print("Sub 1: ", value)
//    }, onCompleted: {
//        print("sub 1: completed")
//    }).disposed(by: disposeBag)
//
//    // emit
//subject.onNext("2")
//
//    // subscribe 2
//let subscription2 = subject
//    .subscribe(onNext: { value in
//        print("Sub 2: ", value)
//    }, onCompleted: {
//        print("sub 2: completed")
//    })
////    .disposed(by: disposeBag)
//
//    // emit
//subject.onNext("3")
//subject.onNext("4")
//subject.onNext("5")
//
//// dispose subscription2
//subscription2.dispose()
//
//    // emit
//subject.onNext("6")
//subject.onNext("7")
//
//// completed
//subject.onCompleted()
//    // emit
//subject.onNext("8")
//
//    // subscribe 3
//subject .subscribe {
//    print("sub 3: ", $0.element ?? $0)
//}
//.disposed(by: disposeBag)

//let disposeBag = DisposeBag()
//
//enum MyError: Error {
//  case anError
//}
//
//let subject = BehaviorSubject(value: "0")
//
////Subscribe 1
//subject .subscribe {
//    print("🔵 ", $0)
//  }
//.disposed(by: disposeBag)
//
//// emit
//subject.onNext("1")
//
////Subscribe 2
//subject .subscribe {
//    print("🔴 ", $0)
//  }
//.disposed(by: disposeBag)
//
//// error
//subject.onError(MyError.anError)
//
////Subscribe 3
//subject .subscribe {
//    print("🟠 ", $0)
//  }
//.disposed(by: disposeBag)

//let subject = PublishSubject<String>()
//let disposeBag = DisposeBag()
//
//subject
////.ignoreElements()
////    .elementAt(2)
//    .compactMap { Int($0) }
//    .filter { $0 % 2 == 0 }
//    .subscribe {
//        print("Result: \($0)")
//    }
//    .disposed(by: disposeBag)
//
//subject.onNext("1")
//subject.onNext("2")
//subject.onNext("3")

//subject.onCompleted()

//Observable.of("1", "B", "2", "D", "3", "F")
////        .skip(3)
////        .skipWhile { Int($0) != nil }
//    .take(3)
//        .subscribe(onNext: {
//            print(Int($0))
//        })
//        .disposed(by: disposeBag)
//
//
//Observable.of("1", "B", "2", "D", "3", "F")
////        .skip(3)
////        .skipWhile { Int($0) != nil }
//    .takeWhile { Int($0) ?? 0 < 4 }
//        .subscribe(onNext: {
//            print($0)
//        })
//        .disposed(by: disposeBag)

//struct Point {
//        var x: Int
//        var y: Int
//    }
//
//    let disposeBag = DisposeBag()

//    let array = [ Point(x: 0, y: 1),
//                  Point(x: 0, y: 2),
//                  Point(x: 1, y: 0),
//                  Point(x: 1, y: 1),
//                  Point(x: 1, y: 3),
//                  Point(x: 2, y: 1),
//                  Point(x: 2, y: 2),
//                  Point(x: 0, y: 0),
//                  Point(x: 3, y: 3),
//                  Point(x: 0, y: 1)]
//
//    Observable.from(array)
//    .distinctUntilChanged { (p1, p2) -> Bool in
//        (p1.x == p2.x && p1.y == p2.y)
//        }
//        .subscribe(onNext: { point in
//            print("Point (\(point.x), \(point.y))")
//        })
//        .disposed(by: disposeBag)
//
//let formatter = NumberFormatter()
//    formatter.numberStyle = .spellOut
//
//    Observable<Int>.of(1, 2, 3, 4, 5, 10, 999, 9999, 1000000)
//        .map { formatter.string(for: $0) ?? "" }
//        .subscribe(onNext: { string in
//            print(string)
//        })
//        .disposed(by: disposeBag)
//let bag = DisposeBag()
//
//enum FileError: Error {
//    case pathError
//    case failedCaching
//}
//
//func cacheLocally() -> Completable {
//    return Completable.create { completable in
//       // Store some data locally
//       //...
//       //...
//
//        let success = true
//
//       guard success else {
//           completable(.error(FileError.failedCaching))
//           return Disposables.create {}
//       }
//
//       completable(.completed)
//       return Disposables.create {}
//    }
//}
//
//cacheLocally().subscribe { print($0) }
//    .disposed(by: bag)
//
//let disposeBag = DisposeBag()
//enum MyError: Error {
//  case anError
//}
//
//let subject = ReplaySubject<String>.create(bufferSize: 2)
//
//// emit
//subject.onNext("1")
//subject.onNext("2")
//subject.onNext("3")
//
//// subcribe 1
//subject
//  .subscribe { print("🔵 ", $0) }
//  .disposed(by: disposeBag)
//
//// emit
//subject.onNext("4")
//
//// subcribe 2
//subject
//  .subscribe { print("🔴 ", $0) }
//  .disposed(by: disposeBag)
//
//// error
//subject.onError(MyError.anError)
//
//// dispose
//subject.dispose()
//
//// subcribe 3
//subject
//  .subscribe { print("🟠 ", $0) }
//  .disposed(by: disposeBag)


//let disposeBag = DisposeBag()
//
//enum MyError: Error {
//  case anError
//}
//
//let subject = BehaviorSubject(value: "0")
//
////Subscribe 1
//subject .subscribe {
//    print("🔵 ", $0)
//  }
//.disposed(by: disposeBag)
//
//// emit
//subject.onNext("1")
//
////Subscribe 2
//subject .subscribe {
//    print("🔴 ", $0)
//  }
//.disposed(by: disposeBag)
//
//// error
//subject.onError(MyError.anError)
//
////Subscribe 3
//subject .subscribe {
//    print("🟠 ", $0)
//  }
//.disposed(by: disposeBag)

//let disposeBag = DisposeBag()
//let subject = PublishSubject<String>()
//
//subject.onNext("1")
//
//    // subscribe 1
//let subscription1 = subject
//    .subscribe(onNext: { value in
//        print("Sub 1: ", value)
//    }, onCompleted: {
//        print("sub 1: completed")
//    })
//
//    // emit
//subject.onNext("2")
//
//    // subscribe 2
//let subscription2 = subject
//    .subscribe(onNext: { value in
//        print("Sub 2: ", value)
//    }, onCompleted: {
//        print("sub 2: completed")
//    })
//
//    // emit
//subject.onNext("3")
//subject.onNext("4")
//subject.onNext("5")
//
//// dispose subscription2
//subscription2.dispose()
//
//    // emit
//subject.onNext("6")
//subject.onNext("7")
//
//// completed
//subject.on(.completed)
//    // emit
//subject.onNext("8")
//
//    // subscribe 3
//subject .subscribe {
//    print("sub 3: ", $0.element ?? $0)
//}
//.disposed(by: disposeBag)

//let disposeBage = DisposeBag()
//
//enum MyError: Error {
//    case anError
//}
//
//let publishRelay = PublishRelay<String>()
//
//publishRelay.accept("0")
//
//publishRelay.subscribe { print("🔵 ", $0)}
//
//publishRelay.accept("1")
//publishRelay.accept("2")
//publishRelay.accept("3")
//
//publishRelay.subscribe{ print("🔴 ", $0) }
//
//publishRelay.accept("4")

//let disposeBag = DisposeBag()
//
//Observable.of("A", "B", "C", "D", "E", "F")
//    .skip(3)
//    .subscribe(onNext: {
//        print($0) })
//    .disposed(by: disposeBag)

//let bag = DisposeBag()
//
//Observable.of(2, 4, 8, 9, 2, 4, 5, 7, 0, 10)
//    .skipWhile { $0 % 2 == 0 }
//    .subscribe(onNext: {
//        print($0) })
//    .disposed(by: bag)

//let bag = DisposeBag()
//
//let subject = PublishSubject<String>()
//let trigger = PublishSubject<String>()
//
//subject
//    .skipUntil(trigger)
//    .subscribe(onNext: { value in
//        print(value)
//    })
//    .disposed(by: bag)
//
//subject.onNext("1")
//subject.onNext("2")
//subject.onNext("3")
//subject.onNext("4")
//subject.onNext("5")
//
//trigger.onNext("Stop")
//
//subject.onNext("6")
//subject.onNext("7")

//let bag = DisposeBag()
//
//Observable.of(2, 4, 6, 8, 0, 12, 1, 3, 4, 6, 2)
//    .enumerated()
//    .takeWhile { index, value in
//        value % 2 == 0 && index < 3
//    }
//    .subscribe(onNext: { (value) in
//        print(value)
//    })
//    .disposed(by: bag)

//let asyncSubject = AsyncSubject<Int>()
//
//asyncSubject.onNext(1)
//
//asyncSubject.subscribe { print($0) }
//    .disposed(by: bag)
//
//asyncSubject.onNext(2)
//
//asyncSubject.onCompleted()
////asyncSubject.onError(MyError.anError)
//
//asyncSubject.onNext(3)

//let bag = DisposeBag()
//
//Observable.of("1", "1", "2", "1", "3",nil, nil, "1", "1")
//    .distinctUntilChanged()
//    .subscribe { print($0)}
//    .disposed(by: bag)

//struct Point {
//    var x: Int
//    var y: Int
//}
//
//let disposeBag = DisposeBag()
//
//let array = [ Point(x: 0, y: 1),
//              Point(x: 0, y: 2),
//              Point(x: 1, y: 0),
//              Point(x: 1, y: 1),
//              Point(x: 1, y: 3),
//              Point(x: 2, y: 1),
//              Point(x: 2, y: 2),
//              Point(x: 0, y: 0),
//              Point(x: 3, y: 3),
//              Point(x: 0, y: 1)]
//
//Observable.from(array)
//    .distinctUntilChanged { (p1, p2) -> Bool in
//        p1.x == p2.x
//    }
//    .subscribe(onNext: { point in
//        print("Point (\(point.x), \(point.y))")
//    })
//    .disposed(by: disposeBag)
//let bag = DisposeBag()
//enum MyError: Error {
//    case anError
//}
//Observable.of(1, 2, 3, 4, 5, 6)
//    .toArray()
//    .subscribe{ value in
//        print(value)
//    }
//    .disposed(by: bag)

//struct User {
//    var name: String
//    var message: PublishSubject<String>
//
//    init(name: String, message: PublishSubject<String>) {
//        self.name = name
//        self.message = message
//    }
//}
//
//
//let staff = User(name: "Staff", message: PublishSubject<String>())
//let customer = User(name: "Customer", message: PublishSubject<String>())
//let owner = User(name: "Owner", message: PublishSubject<String>())
//
//let userSubject = PublishSubject<User>()
//let subject = PublishSubject<PublishSubject<User>>()
//
//subject.flatMap { $0.materialize() }
//    .subscribe(onNext: { value in
//        value.element?.message.subscribe(onNext: { msg in
//            print("\(value.element?.name): \(msg)")
//        }).disposed(by: bag)
//
//    })
//    .disposed(by: bag)
//
//subject.onNext(userSubject)
//userSubject.onNext(staff)
//userSubject.onNext(customer)
//
//staff.message.onNext("Hello! Can I help you?")
//customer.message.onNext("Hi! Can I order a cup of coffee?")
//staff.message.onError(MyError.anError)
//staff.message.onNext("Please, wait for a few minutes")
//
//
//userSubject.onNext(owner)
//
//owner.message.onNext("We're out of this kind of coffe. Please choose something else")


//let cities = [ "Mien Bac" : Observable.of("Ha Noi", "Hai Phong"),
//               "Mien Trung" : Observable.of("Hue", "Da Nang"),
//               "Mien Nam" : Observable.of("Ho Chi Minh", "Can Tho"),
//               "Nam Trung Bo": Observable.error(MyError.anError)]
//
//let observable = Observable.of("Mien Bac", "Mien Trung", "Nam Trung Bo", "Mien Nam")
//    .concatMap { name in
//        cities[name] ?? Observable.just("Khong co")
//    }
//
//observable
//    .subscribe(onNext: { (value) in
//        print(value)
//    })
//    .disposed(by: bag)

//let chu = PublishSubject<String>()
//let so = PublishSubject<String>()
//
//let source = Observable.combineLatest(chu, so) { chu, so in
//    "\(chu): \(so)"
//}
//
//
//source
//    .subscribe(onNext: { (value) in
//        print(value)
//    })
//    .disposed(by: bag)
//
//chu.onNext("Một")
//so.onNext("1")
//chu.onNext("Hai")
//so.onNext("2")
//chu.onNext("Ba")
//so.onNext("3")
//so.onCompleted()
//chu.onNext("Bốn")
//chu.onCompleted()

//let chu = PublishSubject<String>()
//let so = PublishSubject<String>()
//
//
//Observable.zip(chu, so) { chu, so in
//    "\(chu): \(so)"
//}
//    .subscribe(onNext: { (value) in
//        print(value)
//    })
//    .disposed(by: bag)
//
//chu.onNext("Một")
//so.onNext("1")
//chu.onNext("Hai")
//so.onNext("2")
//chu.onNext("Ba")
//so.onNext("3")
//so.onCompleted()
//chu.onNext("Bốn")
//chu.onCompleted()
//let button = PublishSubject<Void>()
//let textField = PublishSubject<String>()
//
//let observable = button.withLatestFrom(textField)
//
//_ = observable
//    .subscribe(onNext: { value in
//        print(value)
//    })
//
//textField.onNext("Đa")
//textField.onNext("Đà Na")
//
//button.onNext(())
//textField.onNext("Đà Nẵng")
//
//button.onNext(())

let bag = DisposeBag()

let chu = PublishSubject<String>()
let so = PublishSubject<String>()
let dau = PublishSubject<String>()

let observable = PublishSubject<Observable<String>>()

observable
    .switchLatest()
    .subscribe(onNext: { (value) in
        print(value)
    }, onCompleted: {
        print("completed")
    })
.disposed(by: bag)

observable.onNext(so)

so.onNext("1")
so.onNext("2")
so.onNext("3")

observable.onNext(chu)

chu.onNext("Một")
chu.onNext("Hai")
chu.onNext("Ba")

so.onNext("4")
so.onNext("5")
so.onNext("6")

observable.onNext(dau)

dau.onNext("+")
dau.onNext("-")
   
observable.onNext(chu)
chu.onNext("Bốn")
chu.onNext("Năm")
chu.onNext("Sáu")
