//
//  ChatViewController.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/28.
//

import UIKit
import SocketIO

class ChatViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var ChatTableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var myChat: [chatType] = []
    var socket: SocketIOClient!
    
    var ketboardHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.socket = SocketIOManager.shared.socket
        bindMsg()
        
        self.ChatTableView.delegate = self
        self.ChatTableView.dataSource = self
        
//        initGestureRecognizer()
//        registerForKeyboardNotifications()
        
    }
    
    //뒤로가기시 소켓 종료
    override func viewWillDisappear(_ animated: Bool) {
        SocketIOManager.shared.closeConnection()
//        unregisterForKeyboardNotifications()
    }
    
    //서버로부터 메시지 받을 때 채팅창 업데이트
    func bindMsg() {
        self.socket.on("test") { (dataArray, socketAck) in
            var chat = chatType()
            print("***************************************")
            print(type(of: dataArray))
            let data = dataArray[0] as! NSDictionary
            
            chat.type = data["type"] as! Int
            chat.message = data["message"] as! String
            self.myChat.append(chat)
            print(chat)
            
            self.updateChat(count: self.myChat.count) { print("Get Message") }
        }
    }
    
    //채팅 업데이트
    func updateChat(count: Int, completion: @escaping ()->Void) {
        let indexPath = IndexPath(row: count-1, section: 0)
        
        self.ChatTableView.beginUpdates()
        self.ChatTableView.insertRows(at: [indexPath], with: .none)
        self.ChatTableView.endUpdates()
        
        self.ChatTableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
        
        //필요한경우 escaping closure를 이용한 데이터 전달
                    completion()
    }
    
    @IBAction func sendMsgButtonClick(_ sender: UIButton) {
        let text = self.textField.text!
        self.socket.emit("test", text)
        
        self.myChat.append(chatType(type: 0, message: text))
        
        self.updateChat(count: self.myChat.count) {
            print("Senf Message")
        }
    }
}

struct chatType {
    var type = -1
    var message = ""
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let chat = myChat[indexPath.row]
        
        //좌우마진 122, 40이 최대값이므로 최댓값 가로길이는 아래와 같음
        let widthOfText = view.frame.width - 122 - 40
        let size = CGSize(width: widthOfText, height: 1000)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        let estimatedFrame = NSString(string: chat.message).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        //위아래마진 14, 14 + 여유공간 4
        return estimatedFrame.height + 14 + 14 + 4
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myChat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = self.myChat[indexPath.row].type == 0 ? "MyCell" : "YourCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatTableViewCell
        cell.chatLabel.text = self.myChat[indexPath.row].message
        return cell
    }
    
}
