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
    
    private let backView = UIView().then {
        $0.backgroundColor = .backView
    }
    
    private let chattingField = UITextField().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 16
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
        [navigationBarButton,backView,chattingField].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        navigationBarButton.snp.makeConstraints {
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
        backView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().offset(0)
            $0.height.equalTo(80)
        }
        chattingField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(backView.snp.bottom).offset(-36 )
            $0.trailing.equalToSuperview().offset(-59)
            $0.leading.equalToSuperview().offset(16)
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
