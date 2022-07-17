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
    private let navigationTitleLabel = UILabel().then {
        $0.text = "Who Are You"
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGround
        configNavigation()
    }
    
}

private extension ChattingViewController {
    func configNavigation() {
        self.navigationItem.titleView = navigationTitleLabel
    }
}
