//
//  ViewController.swift
//  OP.GG Clone
//
//  Created by 송영훈 on 2023/01/08.
//

import UIKit
import Tabman
import Pageboy

// 기존 UIViewController 대신 TabmanViewController을 상속받음
class HomeViewController: TabmanViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    // MARK: Main view
    @IBOutlet weak var summonerView: UIView!
    @IBOutlet weak var BMSummonerView: UIView!
    @IBOutlet weak var patchNotesView: UIView!
    @IBOutlet weak var champTierView: UIView!
    @IBOutlet weak var BMChampView: UIView!
    @IBOutlet weak var todayTMIView: UIView!
    @IBOutlet weak var weakSaleView: UIView!
    @IBOutlet weak var anotherGameView: UIView!
    @IBOutlet weak var moreInformationView: UIView!
    
    // MARK: Summoner view
    @IBOutlet weak var registSummonerView: UIView!
    @IBOutlet weak var registSummonerImageView: UIImageView!
    @IBOutlet weak var registSummonerButton: UIButton!
    
    // MARK: BM summoner view
    @IBOutlet weak var BMSummonerTitleLabel: UILabel!
    @IBOutlet weak var BMSummonerListView: UIView!
    @IBOutlet weak var searchSummonerButton: UIButton!
    
    // MARK: Patch notes view
    @IBOutlet weak var champTierInnerView: UIView!
    @IBOutlet weak var patchNotesCollectionView: UICollectionView!
    
    // MARK: Champ tier view
    var champTierViewControllers: Array<UIViewController> = []
    let topChampVC = TopChampTierViewController()
    let jugChampVC = JugChampTierViewController()
    let midChampVC = MidChampTierViewController()
    let adcChampVC = AdcChampTierViewController()
    let supChampVC = SupChampTierViewController()
    
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
        // 검색한 소환사명이 있을때와 없을때에 대한 반응 추가
        
        self.summonerView.backgroundColor = .opggBgColor
        // sub view 테두리 설정
        self.registSummonerView.backgroundColor = .opggRegiSommonerColor
        self.registSummonerView.layer.cornerRadius = 5
        self.registSummonerView.layer.borderWidth = 0.5
        self.registSummonerView.layer.borderColor = UIColor.darkGray.cgColor
        // sub view 이미지 테두리 설정
        self.registSummonerImageView.layer.cornerRadius = 5
        // sub view 소환사 등록 버튼 설정
        self.registSummonerButton.titleLabel?.font =
        UIFont.systemFont(ofSize: 14)
        self.registSummonerButton.backgroundColor = .opggBtnColor
    }
    func setBMSummonerVuew() {
        // 캐시되어있는 몇몇 소환사를 해당 뷰 위에 올림
        self.BMSummonerView.backgroundColor = .opggBgColor
        
        // list view 내부 구성 설계
        // 컬렉션뷰로 구성해준다
        // 기본 뷰는 즐겨찾기한 소환사가 없다는 구성
        // 캐시에 즐겨찾기 정보가 있다면 컬렉션뷰 리로딩
        
        // sub view 소환사 검색 버튼 설정
        // 기능은 상단 서치바 터치시 불려지는 화면과 동일할것으로 보임
        self.searchSummonerButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.searchSummonerButton.backgroundColor = .opggBtnColor
        // 버튼 폰트, 컬러 설정 일정하게 세팅하는 클래스 구현하기
        
    }
    func setPatchNotesView() {
        self.patchNotesView.backgroundColor = .opggBgColor
        // 서버에서 최근 패지에 대한 썸네일 요소정도만 가져옴
        // 컬렉션뷰로 구성(좌우 스크롤 필요)
        // 기존 앱에서는 최신화가 앱 업데이트와 같이 진행되는 것으로 보임
        
        self.patchNotesCollectionView.delegate = self
        self.patchNotesCollectionView.dataSource = self
        
        
    }
    func setChampTierView() {
        self.champTierView.backgroundColor = .opggBgColor
        // 페이지 처리 필요, 좌우 스크롤시 탭도 이동 -> Tabman 처리
        // 챔피언 섬네일 적인 부분은 캐시
        // 티어마크는 서버에서 불러올 필요 있음
        champTierViewControllers.append(topChampVC)
        champTierViewControllers.append(jugChampVC)
        champTierViewControllers.append(midChampVC)
        champTierViewControllers.append(adcChampVC)
        champTierViewControllers.append(supChampVC)
    }
    func setBMChampView() {
        self.BMChampView.backgroundColor = .opggBgColor
        // 즐겨찾기시 뷰가 어떻게 처리되는지 확인 필요
        
    }
}

// MARK: - TableView Delegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
    
    
}

// MARK: - CollectionView Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

// MARK: - Tabman Delegate
extension HomeViewController: TMBarDataSource {
    
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "탑")
        case 1:
            return TMBarItem(title: "정글")
        case 2:
            return TMBarItem(title: "미드")
        case 3:
            return TMBarItem(title: "바텀")
        case 4:
            return TMBarItem(title: "서폿")
        default:
            return TMBarItem(title: "Page No.\(index)")
        }
    }
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        //위에서 선언한 vc array의 count를 반환합니다.
        return champTierViewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return champTierViewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func settingTabBar (lineTabbar : TMBar.ButtonBar) {
        lineTabbar.layout.transitionStyle = .snap
        // 왼쪽 여백주기
        lineTabbar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 13.0, bottom: 0.0, right: 20.0)
        
        // 간격
        lineTabbar.layout.interButtonSpacing = 35
        
        lineTabbar.backgroundView.style = .blur(style: .light)
        
        // 선택 / 안선택 색 + font size
        lineTabbar.buttons.customize { (button) in
            button.tintColor = .defaultInverse
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 16)
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
        
        // 인디케이터 (영상에서 주황색 아래 바 부분)
        lineTabbar.indicator.weight = .custom(value: 2)
        lineTabbar.indicator.tintColor = .defaultInverse
    }
}
