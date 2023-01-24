//
//  ViewController.swift
//  OP.GG Clone
//
//  Created by 송영훈 on 2023/01/08.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DUBUG: HomeVC did load")
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        navigationViewCustom()
    }
    
    // MARK: - Funtion
    func navigationViewCustom() {
        let navigationBarHeight = self.navigationController!.navigationBar.frame.height
        let naviBarImageView = UIImageView(image: UIImage(named: "Logo"))
        
        naviBarImageView.contentMode = .scaleAspectFit
        let leftBarBtn = UIBarButtonItem(customView: naviBarImageView)
        
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
    }
}



extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
