//
//  chattingViewController.swift
//  Chatting
//
//  Created by 선민재 on 2022/07/15.
//

import UIKit
import Then
import SnapKit

final class ChattingViewController: UIViewController {
    private let bounds = UIScreen.main.bounds
    
    private let navigationTitleLabel = UILabel().then {
        $0.text = "Who Are You"
        $0.font = UIFont(name: "NotoSansKR-Medium", size: 22)
        $0.textColor = .black
    }
    private let navigationBarButton = UIButton().then {
        let text = NSAttributedString(string: "퇴장")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .wrong
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGround
        configNavigation()
        addView()
        setLayout()

    }
    
    private func addView() {
        [navigationBarButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        navigationBarButton.snp.makeConstraints {
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
    }
    
}

private extension ChattingViewController {
    func configNavigation() {
        self.navigationItem.titleView = navigationTitleLabel
        let rightBarButton = UIBarButtonItem(customView: navigationBarButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
}
