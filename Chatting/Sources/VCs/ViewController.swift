//
//  ViewController.swift
//  Login_WithServer
//
//  Created by 선민재 on 2022/07/12.
//

import UIKit
import Then
import SnapKit

final class ViewController: UIViewController, UITextFieldDelegate {
    private let bounds = UIScreen.main.bounds
    
    lazy var LogoImage = UIImageView().then {
        $0.image = UIImage(named: "LogoImage")
        //$0.layer.shadowOpacity = 0.1
        //$0.layer.shadowPath = 1
        //$0.layer.shadowColor = UIColor.black.cgColor
    }
    
    lazy var LogoText = UILabel().then {
        $0.text = "Who Are You"
        //$0.textColor = .black
        //$0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        let attributedString = NSMutableAttributedString(string: ($0.text!), attributes: [.font: UIFont(name: "NotoSansKR-Medium", size: 24)!, .foregroundColor: UIColor.black,])
        attributedString.addAttribute(.font, value: UIFont(name: "NotoSansKR-Medium", size: 30)!, range: ($0.text! as NSString).range(of: "W"))
        attributedString.addAttribute(.font, value: UIFont(name: "NotoSansKR-Medium", size: 30)!, range: ($0.text! as NSString).range(of: "A"))
        attributedString.addAttribute(.font, value: UIFont(name: "NotoSansKR-Medium", size: 30)!, range: ($0.text! as NSString).range(of: "Y"))
        $0.attributedText = attributedString
        
    }
    
    lazy var startButton = UIButton().then {
        let text = NSAttributedString(string: "시작하기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "NotoSansKR-Medium", size: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .mainColor
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    }
    
    lazy var Logo = UIImageView().then {
        $0.image = UIImage(named: "Logo")
    }
    
    lazy var Explain = UILabel().then {
        $0.numberOfLines = 3
        $0.text = "Who Are You 는 익명의상대와 편하게 대화할 수 있는  익명 채팅 서비스입니다."
        $0.textColor = .black
        //$0.font = UIFont(name: "NotoSansKR-Light", size: 22)
        $0.textAlignment = .center
        
        let attributedString = NSMutableAttributedString(string: ($0.text!), attributes: [.font: UIFont(name: "NotoSansKR-Light", size: 22)!, .foregroundColor: UIColor.black, .kern: 1.0])
        attributedString.addAttribute(.font, value: UIFont(name: "NotoSansKR-Regular", size: 22)!, range: ($0.text! as NSString).range(of: "익명"))
        attributedString.addAttribute(.font, value: UIFont(name: "NotoSansKR-Regular", size: 22)!, range: ($0.text! as NSString).range(of: "익명 채팅 서비스"))
        $0.attributedText = attributedString
    }   
    
    @objc func startAction() {
        //self.navigationController?.popViewController(animated: true)
        let lvc = NickNameViewController()
        lvc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(lvc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGround
        addView()
        setLayout()
    }
    
    private func addView() {
        [LogoImage,Explain,Logo,LogoText, startButton].forEach {
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
            $0.trailing.equalTo(LogoImage.snp.trailing).offset(-57)
        }
        
        Logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(300)
        }
        
        Explain.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(550)
        }
        
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(700)
            $0.size.equalTo(bounds.height * 0.06)
            $0.trailing.equalToSuperview().offset(-50)
        }
    
    }
    

}

extension UIColor {
    class var backGround: UIColor? {return UIColor(named: "backGround")}
    class var mainColor: UIColor? {return UIColor(named: "mainColor")}
    class var wrong: UIColor? {return UIColor(named: "wrong")}
    class var placeholder: UIColor? {return UIColor(named: "placeholder")}
    class var backView: UIColor? {return UIColor(named: "backView")}
}


//extension UIFont {
//    enum Family: String {
//        case Black, Bold, Light, Medium, Regular, Thin
//    }
//
//    static func NotoSansKR(size: CGFloat = 10, Family = .Regular) -> UIFont {
//        return UIFont(name: "NotoSansKR-\(family)", size: size)
//    }
//}
