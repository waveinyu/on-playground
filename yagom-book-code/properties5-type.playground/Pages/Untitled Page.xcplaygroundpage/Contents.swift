//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

/* 타입 프로퍼티의 이용 */
class Account {
    // 프로퍼티 타입을 상수로 사용할 수도 있다.
    static let dollarExchangeRate: Double = 1000.0 // 타입 상수
    var credit: Int = 0 // 저장 인스턴스 프로퍼티
    
    var dollarValue: Double { // 연산 인스턴스 프로퍼티
        get {
            return Double(credit) / Self.dollarExchangeRate
        }
        
        set {
            credit = Int(newValue * Account.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

var myAccount: Account = Account()
myAccount.credit = 3000
print(myAccount.credit)
print(myAccount.dollarValue)

myAccount.dollarValue = 3
print(myAccount.dollarValue)
print(myAccount.credit)

// :::::::::::::::::::::::::::::::::::::::::::::::::::::::
/* 키 경로 */
func someFunction(paramA: Any, paramB: Any) {
    print("someFunction called...")
}

// 변수에 참조를 할당(상수에도 가능)
var functionRefence = someFunction
functionRefence("A", "B") // = another function
// 함수를 참조해두고 원하는 때에 호출할 수도 있고, 다른 함수를 참조하도록 할 수도 있다.


// 키 경로 타입(특정 속성의 위치를 나타내는 타입) 확인
// 속성의 메모리 위치나 속성에 대한 접근 방식을 추상화하는 타입 정보를 담고 있다.
// 즉, 속성의 타입과 접근성에 대한 메타데이터를 제공
// 속성에 대한 간접 참조를 얻을 수 있다. 속성에 접근하거나 속성의 값을 수정하는데 사용
// 초기화, 초깃값과는 별개
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

print(type(of: \Person.name)) // ReferenceWritableKeyPath<Person, String>
print(type(of: \Stuff.name)) // WritableKeyPath<Stuff, String>


/* 키 경로 타입의 경로 연결 */
let keyPath = \Stuff.owner
let nameKeyPath = keyPath.appending(path: \.name)
print(1, keyPath) // \Stuff.owner
print(2, nameKeyPath) // \Stuff.owner.<computed 0x0000000100c19df8 (String)>



