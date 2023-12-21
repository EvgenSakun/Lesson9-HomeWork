//
//  ViewController.swift
//  HomeWork9
//
//  Created by Evgeny Sakun on 21.12.23.
//
import SnapKit
import UIKit

class ViewController: UIViewController {

    let circleView = UIView()
    let squareGreenView = UIView()
    let squareYellowView = UIView()
    let squareBlueView = UIView()
    
    let upButton = UIButton(type: .system)
    let downButton = UIButton(type: .system)
    let leftButton = UIButton(type: .system)
    let rightButton = UIButton(type: .system)
    
    let squareButton = UIButton(type: .system)
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupButtonsConstraints()
        setupSquareButton()
        setupButtons(button: upButton)
        setupButtons(button: downButton)
        setupButtons(button: leftButton)
        setupButtons(button: rightButton)
        setupCircleView()
        setupSquareGreen1View()
        setupSquareGreen2View()
        setupSquareGreen3View()
        
    }

    func setupSquareGreen1View() {
        squareGreenView.backgroundColor = UIColor.systemGreen
        squareGreenView.isHidden = true
    }
    func setupSquareGreen2View() {
        squareYellowView.backgroundColor = UIColor.systemGreen
        squareYellowView.isHidden = true
    }
    func setupSquareGreen3View() {
        squareBlueView.backgroundColor = UIColor.systemGreen
        squareBlueView.isHidden = true
    }
    
    func setupCircleView() {
        let viewCenterX = Int(view.center.x)
        let viewCenterY = Int(view.center.y)
        let circleSide = 130
        
        let frameCircle = CGRect(x: viewCenterX - circleSide / 2, y: viewCenterY - circleSide / 2, width: circleSide, height: circleSide)
        
        circleView.backgroundColor = UIColor.systemRed
        circleView.frame = frameCircle
        circleView.layer.cornerRadius = circleView.bounds.size.width / 2
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(circleViewTapped))
        circleView.addGestureRecognizer(gesture)
    }
    
    func setupSquareButton() {
        squareButton.setTitle("Squares", for: .normal)
        squareButton.setTitleColor(.black, for: .normal)
        squareButton.backgroundColor = UIColor.systemYellow
        squareButton.layer.cornerRadius = 5
        squareButton.translatesAutoresizingMaskIntoConstraints = false
        
        squareButton.addTarget(self, action: #selector(squareButtonTapped), for: .touchUpInside)
    }
    
    func setupButtons(button: UIButton) {
        switch button {
        case upButton:
            button.setTitle("Top", for: .normal)
            button.addTarget(self, action: #selector(upButtonTapped), for: .touchUpInside)
        case downButton:
            button.setTitle("Bot", for: .normal)
            button.addTarget(self, action: #selector(downButtonTapped), for: .touchUpInside)
        case leftButton:
            button.setTitle("Left", for: .normal)
            button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        case rightButton:
            button.setTitle("Right", for: .normal)
            button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        default:
            button.setTitle("No button", for: .normal)
        }
        
        button.backgroundColor = UIColor.systemYellow
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews() {
        view.addSubview(circleView)
        
        view.addSubview(squareButton)
        view.addSubview(upButton)
        view.addSubview(downButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        view.addSubview(squareGreenView)
        view.addSubview(squareYellowView)
        view.addSubview(squareBlueView)
    }
    
    func setupButtonsConstraints() {
        upButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(UIScreen.main.bounds.size.width / 4 - 50)
            make.top.equalToSuperview().offset(70)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        
        downButton.snp.makeConstraints { make in
            make.left.equalTo(upButton.snp.rightMargin).offset(40)
            make.top.equalTo(upButton.snp.top)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        
        leftButton.snp.makeConstraints { make in
            make.left.equalTo(downButton.snp.rightMargin).offset(40)
            make.top.equalTo(upButton.snp.top)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        
        rightButton.snp.makeConstraints { make in
            make.left.equalTo(leftButton.snp.rightMargin).offset(40)
            make.top.equalTo(upButton.snp.top)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        
        squareButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.size.height - 100)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(70)
        }
    }
    
    @objc func circleViewTapped() {
        let safeAreaWidth = Int(view.safeAreaLayoutGuide.layoutFrame.size.width)
        let upButtonBottom = Int(upButton.frame.maxY)
        let squareButtonTop = Int(squareButton.frame.minY)
        
        let circleSide = Int(circleView.bounds.size.width)
        
        circleView.frame = CGRect(x: Int.random(in: 1..<(safeAreaWidth - circleSide)), y: Int.random(in: (upButtonBottom + circleSide)..<(squareButtonTop - circleSide)), width: circleSide, height: circleSide)
    }
    
    @objc func upButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        
        if circleTop > Int(upButton.frame.maxY + 10) {
            circleView.frame = CGRect(x: circleLeft, y: circleTop - 10, width: circleSide, height: circleSide)
        }
    }
    
    @objc func downButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleBottom = Int(circleView.frame.maxY)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        
        if circleBottom < Int(squareButton.frame.minY - 10) {
            circleView.frame = CGRect(x: circleLeft, y: circleTop + 10, width: circleSide, height: circleSide)
        }
    }
    
    @objc func leftButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        if circleLeft > 10 {
            circleView.frame = CGRect(x: circleLeft - 10, y: circleTop, width: circleSide, height: circleSide)
        }
    }
    
    @objc func rightButtonTapped() {
        let circleLeft = Int(circleView.frame.minX)
        let circleRight = Int(circleView.frame.maxX)
        let circleTop = Int(circleView.frame.minY)
        let circleSide = Int(circleView.bounds.size.width)
        if circleRight < Int(UIScreen.main.bounds.size.width) - 10 {
            circleView.frame = CGRect(x: circleLeft + 10, y: circleTop, width: circleSide, height: circleSide)
        }
    }
    
    @objc func squareButtonTapped() {
        let screenWidth = Int(UIScreen.main.bounds.size.width)
        let upButtonBottom = Int(upButton.frame.maxY)
        let squareButtonTop = Int(squareButton.frame.minY)
        let squareSide = 70
        
        squareGreenView.isHidden = false
        repeat{
            squareGreenView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (upButtonBottom + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareGreenView.frame.intersects(squareBlueView.frame) || squareGreenView.frame.intersects(squareYellowView.frame)
        
        squareYellowView.isHidden = false
        repeat {
            squareYellowView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (upButtonBottom + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareYellowView.frame.intersects(squareGreenView.frame) || squareYellowView.frame.intersects(squareBlueView.frame)
        
        squareBlueView.isHidden = false
        repeat {
            squareBlueView.frame = CGRect(x: Int.random(in: 1..<(screenWidth - squareSide)), y: Int.random(in: (upButtonBottom + squareSide)..<(squareButtonTop - squareSide)), width: squareSide, height: squareSide)
        } while squareBlueView.frame.intersects(squareYellowView.frame) || squareBlueView.frame.intersects(squareGreenView.frame)
    }

    
    
    
    
    
    
    
    
    
    

}

