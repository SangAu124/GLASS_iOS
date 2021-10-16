//
//  SelectJob.swift
//  GLASS_iOS
//
//  Created by DGSW on 2021/10/15.
//

import UIKit
import SnapKit

class SelectJobViewController: UIViewController {
    
    let mainColor = UIColor(named: "Color")
    
    private lazy var GLASSImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GLASSLogo")
        
        return imageView
    }()
    
    private lazy var studentButton: UIButton = {
        let button = UIButton()
//        button.setImage(systemName: )
        button.backgroundColor = .black
        button.layer.cornerRadius = 5.0
        
        return button
    }()
    private lazy var parentsButton: UIButton = {
        let button = UIButton()
//        button.setImage(systemName: )
        button.backgroundColor = .black
        button.layer.cornerRadius = 5.0
        
        return button
    }()
    private lazy var teacherButton: UIButton = {
        let button = UIButton()
//        button.setImage(systemName: )
        button.backgroundColor = .black
        button.layer.cornerRadius = 5.0
        
        return button
    }()
    
//    private lazy var blueHalfView: UIView = {
//        let view = UIView()
//        view.backgroundColor = mainColor
//
//        return view
//    }()
    
    private lazy var ractangle: UIView = {
        let view = Ractangle()
        view.backgroundColor = mainColor
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
}

class Ractangle: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: UIScreen.main.bounds.maxY / 2))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.maxX, y: UIScreen.main.bounds.maxY / 2))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.maxX, y: UIScreen.main.bounds.maxY))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.minX, y: UIScreen.main.bounds.maxY))
        
        path.fill()
        path.close()
    }
    
}

private extension SelectJobViewController{
    
    func setup() {
        
        let BtnStackView = UIStackView(arrangedSubviews: [studentButton, parentsButton,teacherButton])
        BtnStackView.axis = .horizontal
        BtnStackView.distribution = .fillEqually
        BtnStackView.spacing = 3.0
        
        [
            GLASSImageView,
            ractangle,
            BtnStackView
//            blueHalfView
            
        ] .forEach{ self.view.addSubview($0) }
        
        GLASSImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(250)
            $0.leading.equalToSuperview().offset(90)
            $0.trailing.equalToSuperview().inset(90)
            $0.bottom.equalToSuperview().inset(510)
        }
        
//        blueHalfView.snp.makeConstraints{
//            $0.leading.equalToSuperview()
//            $0.trailing.equalToSuperview()
//        }
        
        BtnStackView.snp.makeConstraints{
           $0.centerY.equalToSuperview()
            $0.top.equalTo(GLASSImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(340)
        }
        
        ractangle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(UIScreen.main.bounds.maxY / 2)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
}
