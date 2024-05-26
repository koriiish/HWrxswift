//
//  ViewModel.swift
//  HWlesson35
//
//  Created by Карина Дьячина on 26.05.24.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    
    var counter = BehaviorSubject<Int>(value: 0)
    
    func addOne() {
        guard let counterValue = try? counter.value() else { return }
        counter.onNext(min(counterValue + 1, 10))
    }
    
    func subtractOne() {
        guard let counterValue = try? counter.value() else { return }
        counter.onNext(max(counterValue - 1, -10))
    }
}
