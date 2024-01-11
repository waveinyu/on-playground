import UIKit

var greeting = "Hello, playground"

struct Student {
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티
    // 1) 읽기 쓰기 전용
    var westernAge: Int {
        get {
            return koreanAge - 1
        }
        
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    
//    // 인스턴스 메서드
//    // 반환 타입이 없을 경우(Void) 읽기 전용 연산 프로퍼티로 변환 가능하다
//    func selfIntroduce() {
//        print("저는 \(self.class)반 \(name)입니다") // self.name도 되는가?
//    }
    
    
    // 인스턴스 연산 프로퍼티
    // 2) 읽기 전용
    var selfIntroduce: String {
        get {
            return "저는 \(self.class)반 \(name)입니다"
        }
    }
    
    
//    // 타입 메서드
//    static func selfIntroduction() {
//        print("학생 타입입니다")
//    }
    
    static var selfIntroduction: String {
        return "학생 타입입니다."
    }
}


print(Student.selfIntroduction)

// 인스턴스 생성
var yuyu: Student = Student()
yuyu.westernAge = 30
yuyu.name = "유영"

print(yuyu.name)
print(yuyu.selfIntroduce)
print("제 한국 나이는 \(yuyu.koreanAge)이고 미국 나이는 \(yuyu.westernAge)살입니다")


// 값이 변경 되기 전 로그를 찍거나, 데이터베이스 저장을 하는 등의 작업에 사용
struct Money {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)로 변경될 예정")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)로 변경됨")
        }
    }
}


var money: Money = Money()
money.currencyRate = 1150
