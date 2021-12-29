//
//  addDebateView.swift
//  60_debate_iOS
//
//  Created by 손민 on 2021/12/30.
//

import UIKit

class addDateViewController: UIViewController{
    
    let ableNums = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
    var selectNum:Int = 0
    
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        timeTextField.tintColor = .clear
        timeTextField.inputView = pickerView
    }
    
    
}

extension addDateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ableNums.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(ableNums[row])시"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectNum = ableNums[row]
    }
}
