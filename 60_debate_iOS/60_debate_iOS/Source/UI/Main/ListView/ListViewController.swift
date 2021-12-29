//
//  ListViewController.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/28.
//

import UIKit

class ListViewController: UIViewController {

    var debateList: [devate] = []
    
    override func viewDidLoad() {
         super.viewDidLoad()
        getDebateData()
        print()
    }
    
    @IBAction func addBarButton(_ sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var debateListView: UITableView!
    
    
}


extension ListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.debateList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DebateListCell", for: indexPath) as? DebateListCell
        
        debugPrint(self.debateList[indexPath.row].devates?[0].room)
        cell!.topicLabel.text = "\(self.debateList[indexPath.row].devates?[0].room)"
        
        return cell ?? UITableViewCell()
    }
    
    
}
