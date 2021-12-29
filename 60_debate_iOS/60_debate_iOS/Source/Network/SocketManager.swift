//
//  SocketManager.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/29.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    var manager = SocketManager(socketURL: URL(string: "\(Constants.SERVER_IP)")!, config: [.log(true), .compress])
    var socket: SocketIOClient!
    override init() {
        super.init()
        socket = self.manager.socket(forNamespace: "connection")
        
        socket.on("test") { dataArray, ack in
            print(dataArray)
        }
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func sendMessage(message: String) {
        socket.emit("sendMessage", ["message": message])
    }
}
