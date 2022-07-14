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
    
    lazy var LogoImage = UIImageView().then {
        $0.image = UIImage(named: "LogoImage")
        //$0.layer.shadowOpacity = 0.1
        //$0.layer.shadowPath = 1
        //$0.layer.shadowColor = UIColor.black.cgColor
    }
    
    lazy var LogoText = UILabel().then {
        $0.text = "Who Are You"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 26, weight: .bold)
    }
    
    lazy var Logo = UIImageView().then {
        $0.image = UIImage(named: "Logo")
    }
    
    lazy var Explain = UILabel().then {
        $0.numberOfLines = 3
        $0.text = "Who Are You 는 익명의상대와 편하게 대화할 수 있는  익명 채팅 서비스입니다."
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 22, weight: .light)
        $0.textAlignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGround
        addView()
        setLayout()
    }
    
    private func addView() {
        [LogoImage,Explain,Logo,LogoText].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        
        LogoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
        }

        LogoText.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.center.equalTo(LogoImage.snp.center).offset(0)
        }
        
        Logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(300)
        }
        
        Explain.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(550)
        }
    
    }
    

}

extension UIColor {
    class var backGround: UIColor? {return UIColor(named: "backGround")}
}

