//
//  ViewController.swift
//  Counter
//
//  Created by Владислав Соколов on 29.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterImage: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var historyView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStartNumber()
        historySettings()
    }
    
    var countNumber: Int = 0
    let currentDate = Date.now.formatted()
    
    func historySettings () {
        historyView.isEditable = false
        historyView.isScrollEnabled = true
    }
    
    func showStartNumber () {
        counterImage.text = "Значение счетчика: 0"
    }
    
    @IBAction func increaseCounter(sender: Any) {
        countNumber += 1
        counterImage.text = "Значение счетчика: " + String(countNumber)
            historyView.text += "\n \(currentDate) значение изменено на +1"
    }
    
    @IBAction func decreaseCounter(_ sender: Any) {
        if countNumber > 0 {
            countNumber -= 1
            counterImage.text = "Значение счетчика: " + String(countNumber)
            historyView.text += "\n \(currentDate) значение изменено на -1"
        }
        else
        {
            historyView.text += "\n \(currentDate) попытка уменьшить значение счетчика ниже 0"
        }
    }
    
    @IBAction func setCounterToZero(_ sender: Any) {
        if countNumber > 0 {
            countNumber = 0
            counterImage.text = "Значение счетчика: " + String(countNumber)
            historyView.text += "\n \(currentDate) значение сброшено"
        }
        else
        {
            historyView.text += "\n \(currentDate) значение уже равно 0, сброс невозможен"
        }
    }
}
    
