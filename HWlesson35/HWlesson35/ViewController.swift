//
//  ViewController.swift
//  HWlesson35
//
//  Created by Карина Дьячина on 26.05.24.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var counterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Optima", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let incrementButton: UIButton = {
        let plusButton = UIButton()
        plusButton.setTitle("+", for: .normal)
        plusButton.backgroundColor = .blue
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        return plusButton
    }()
    
    let decrementButton: UIButton = {
        let minusButton = UIButton()
        minusButton.setTitle("-", for: .normal)
        minusButton.backgroundColor = .blue
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        return minusButton
    }()
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        setupButtons()
        
        viewModel.counter.map({String($0)}).bind(to: counterLabel.rx.text).disposed(by: disposeBag)
    }
    
    func setupLabel() {
        view.addSubview(counterLabel)
        
        NSLayoutConstraint.activate([
            counterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            counterLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 200)
        ])
    }
        func setupButtons() {
            view.addSubview(incrementButton)
            view.addSubview(decrementButton)
    
            NSLayoutConstraint.activate([
                incrementButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                incrementButton.leftAnchor.constraint(equalTo: counterLabel.rightAnchor, constant: 20),
                decrementButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                decrementButton.rightAnchor.constraint(equalTo: counterLabel.leftAnchor, constant: -20)
            ])
            
            
            incrementButton.addTarget(self, action: #selector(incrementCounter), for: .touchUpInside)
            decrementButton.addTarget(self, action: #selector(decrementCounter), for: .touchUpInside)
        }
    
    @objc func decrementCounter() {
        viewModel.subtractOne()
    }
    
    @objc func incrementCounter() {
        viewModel.addOne()
    }
}
