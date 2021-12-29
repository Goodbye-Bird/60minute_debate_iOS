//
//  ListViewController.swift
//  60_debate_iOS
//
//  Created by 김상은 on 2021/12/28.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var debateListView: UITableView!
    
    @IBOutlet weak var nowDebate: UILabel!
    
    var debateList: devate?
    lazy var completion: ((devate?) -> Void) = { data in
        self.debateList = data
        self.debateListView.reloadData()
        guard let nowTitle = self.debateList?.devates![0].room else {
            let now = ""
            return
        }
        self.nowDebate.text = "\(nowTitle)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDebateData(completion)
        self.debateListView.reloadData()
    }
    
    @IBAction func addBarButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func joinDebateButton(_ sender: UIButton) {
        debugPrint("push join button")
    }
    
}


extension ListViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.debateList?.devates!.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "debateCell", for: indexPath)
        guard let title = self.debateList!.devates![indexPath.row].room else {
            cell.textLabel?.text = ""
            return cell
        }
        cell.textLabel?.text = "\(title)"
        
        
        return cell
    }
    
    
}
