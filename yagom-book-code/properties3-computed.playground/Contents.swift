import UIKit

var greeting = "Hello, playground"

struct CoordinatePoint {
    var x: Int
    var y: Int
    
    var oppositePoint: Self {
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var testPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 15)
print(testPosition)
print(testPosition.oppositePoint)

testPosition.oppositePoint = CoordinatePoint(x: 2, y: 3)
print(testPosition)

// :::::::::::::::::::::::::::::::::::::::::::::::::::

class Account {
    // 저장 프로퍼티
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.") // 3
        }
        
        didSet{
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.") // 4
        }
    }
    
    // 연산 프로퍼티
    var dollarValue: Double {
        get {
            return Double(credit) / 1000.0
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.") // 2
        }
    }
    
}

class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
            print("!잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정!") // 1
        }
        
        didSet {
            print("!잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경됨!") // 5
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()
myAccount.credit = 1000

myAccount.dollarValue = 2
