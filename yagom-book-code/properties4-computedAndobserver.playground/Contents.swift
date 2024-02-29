import UIKit

var greeting = "Hello, playground"

/* 저장변수의 감시자와 연산변수 */
// 저장변수의 감시자
var wonInPocket: Int = 2000 {
    willSet {
        print("주머니의 돈이 \(wonInPocket)에서 \(newValue)로 변경될 예정입니다.") // 2
    }
    
    didSet{
        print("주머니의 돈이 \(oldValue)에서 \(wonInPocket)으로 변경되었습니다.") // 3
    }
}

// 연산변수
var dollarInPocket: Double {
    get {
        return Double(wonInPocket) / 1000.0
    }
    
    set {
        wonInPocket = Int(newValue * 1000.0)
        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.") // 1
    }
}


dollarInPocket = 3.5
print(wonInPocket)
