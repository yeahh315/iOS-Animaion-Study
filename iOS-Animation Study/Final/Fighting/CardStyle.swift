//
//  CardStyle.swift
//  iOS-Animation Study
//
//  Created by 김다예 on 12/21/23.
//

import UIKit

protocol CardStyleProtocol {
    var cardName: String { get }
    var cardFrontColor: UIColor { get }
    var cardBackColor: UIColor { get }
}

struct LemonBlueCardStyle: CardStyleProtocol {
    var cardName: String = "레몬블루가"
    var cardFrontColor: UIColor = .systemYellow
    var cardBackColor: UIColor = .systemBlue
}

struct OrangeMilkCardStyle: CardStyleProtocol {
    var cardName: String = "오렌지밀크가"
    var cardFrontColor: UIColor = .systemOrange
    var cardBackColor: UIColor = .systemGray6
}

struct NightPinkCardStyle: CardStyleProtocol {
    var cardName: String = "나이트핑크가"
    var cardFrontColor: UIColor = .black
    var cardBackColor: UIColor = .systemPink
}

struct PurpleGreenCardStyle: CardStyleProtocol {
    var cardName: String = "퍼플그린이"
    var cardFrontColor: UIColor = .systemPurple
    var cardBackColor: UIColor = .systemGreen
}
