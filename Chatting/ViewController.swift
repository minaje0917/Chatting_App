//
//  ViewController.swift
//  Login_WithServer
//
//  Created by 선민재 on 2022/07/12.
//

import UIKit
import Then
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    private let bounds = UIScreen.main.bounds
    
    lazy var Logo = UILabel().then {
        $0.text = "Who Are You"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 25)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
    }
    
    private func addView() {
        [Logo].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        Logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(250)
        }
    }
    

}

