//
//  ViewController.swift
//  Counter
//
//  Created by Владислав Соколов on 29.06.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var refreshButton: UIButton!
    @IBOutlet weak private var historyView: UITextView!
    
    // MARK: - Private properties
    private var countNumber: Int = 0
    private let currentDate = Date.now.formatted()
    
    // MARK: - View LC
    override func viewDidLoad() {
        super.viewDidLoad()
        showStartNumber()
        historySettings()
    }
    
    // MARK: - IB Actions
    @IBAction private func increaseCounter(sender: Any) {
        countNumber += 1
        counterLabel.text = "Значение счетчика: " + String(countNumber)
            historyView.text += "\n \(currentDate) значение изменено на +1"
    }
    
    @IBAction private func decreaseCounter(_ sender: Any) {
        if countNumber > 0 {
            countNumber -= 1
            counterLabel.text = "Значение счетчика: " + String(countNumber)
            historyView.text += "\n \(currentDate) значение изменено на -1"
        }
        else
        {
            historyView.text += "\n \(currentDate) попытка уменьшить значение счетчика ниже 0"
        }
    }
    
    @IBAction private func setCounterToZero(_ sender: Any) {
        if countNumber > 0 {
            countNumber = 0
            counterLabel.text = "Значение счетчика: " + String(countNumber)
            historyView.text += "\n \(currentDate) значение сброшено"
        }
        else
        {
            historyView.text += "\n \(currentDate) значение уже равно 0, сброс невозможен"
        }
    }
    
    // MARK: - Private Methods
    private func historySettings () {
        historyView.isEditable = false
        historyView.isScrollEnabled = true
    }
    
    private func showStartNumber () {
        counterLabel.text = "Значение счетчика: 0"
    }
}
    
