//
//  ViewController.swift
//  OP.GG Clone
//
//  Created by 송영훈 on 2023/01/08.
//

import UIKit

class HomeViewController: UIViewController {

    static let bgColor = UIColor(named: "Background color")
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var summonerView: UIView!
    @IBOutlet weak var BMSummonerView: UIView!
    @IBOutlet weak var patchNotesView: UIView!
    @IBOutlet weak var champTierView: UIView!
    @IBOutlet weak var BMChampView: UIView!
    @IBOutlet weak var todayTMIView: UIView!
    @IBOutlet weak var weakSaleView: UIView!
    @IBOutlet weak var anotherGameView: UIView!
    @IBOutlet weak var moreInformationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DUBUG: HomeVC did load")
        mainView.backgroundColor = .darkGray
        
        navigationViewCustom()
        setSummonerView()
        setBMSummonerVuew()
        setPatchNotesView()
        setChampTierView()
    }
    
    // MARK: - Funtion
    func navigationViewCustom() {
        let naviBarImageView = UIImageView(image: UIImage(named: "Logo"))
        
        naviBarImageView.contentMode = .scaleAspectFit
        let leftBarBtn = UIBarButtonItem(customView: naviBarImageView)
        
        self.navigationItem.leftBarButtonItem = leftBarBtn
        self.navigationController?.navigationBar.backgroundColor = self.mainView.backgroundColor
    }
    func setSummonerView() {
        // 즐겨찾기 소환사가 있을때와 없을때로 구분 필요
        // 혹은 기본 뷰를 두고, 즐겨찾기가 있는경우 해당 뷰를 지워서 올리기
        // 1안이 딜레이에서 기본뷰가 잠깐 보이는 현상이 있을 수 있으므로 1안이 좋은 선택으로 보임
        
        self.summonerView.backgroundColor = .opggBgColor
    }
    func setBMSummonerVuew() {
        // 캐시되어있는 몇몇 소환사를 해당 뷰 위에 올림
        self.BMSummonerView.backgroundColor = .opggBgColor
        
    }
    func setPatchNotesView() {
        self.patchNotesView.backgroundColor = .opggBgColor
        // 서버에서 최근 패지에 대한 썸네일 요소정도만 가져옴
        // 컬렉션뷰로 구성(좌우 스크롤 필요)
        
    }
    func setChampTierView() {
        self.champTierView.backgroundColor = .opggBgColor
        // 페이지 처리 필요, 좌우 스크롤시 탭도 이동
        // 챔피언 섬네일 적인 부분은 캐시
        // 티어마크는 서버에서 불러올 필요 있음
    }
    func setBMChampView() {
        self.BMChampView.backgroundColor = .opggBgColor
        // 즐겨찾기시 뷰가 어떻게 처리되는지 확인 필요
        
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
    
    
}
