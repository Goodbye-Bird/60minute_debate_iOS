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
        createPickerView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            
            self.view.endEditing(true)
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        timeTextField.tintColor = .clear
        timeTextField.inputView = pickerView
        
        
        let toolBar = UIToolbar()
            toolBar.sizeToFit()
        
        
        let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(onPickDone))
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancel))
            toolBar.setItems([btnCancel , space , btnDone], animated: true)
            toolBar.isUserInteractionEnabled = true
        
        timeTextField.inputView = pickerView
        timeTextField.inputAccessoryView = toolBar
        
    }
    @objc func onPickDone() {
        timeTextField.text = "\(selectNum)시"
        
        timeTextField.resignFirstResponder() /// 피커뷰 내림
    }
         
    // 피커뷰 > 취소 클릭
    @objc func onPickCancel() {
        timeTextField.resignFirstResponder() /// 피커뷰 내림
    }
    
    
    @IBAction func cornfirmDebateButton(_ sender: UIButton) {
        debateNetworking()
    }
    
}
extension addDateViewController {
    
    func debateNetworking() {
        let completion: ((resdebates?) -> Void) = { data in
            debugPrint("ㅜㅜㅜㅜㅜ")
        }
        let para = ["name": nameTextField.text!, "room": topicTextField.text!, "time": "\(selectNum)"]
        APImanager.doRequest("\(Constants.SERVER_IP)/debate/postdebate", method: .post, parameters: para, completion: completion)
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
