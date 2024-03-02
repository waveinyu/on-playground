import UIKit

var greeting = "Hello, playground"

class Person {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let wave: Person = Person(name: "wave")
print(wave.name, wave.age)

wave.age = 100
print(wave.name, wave.age) // Optional(100)
if let age = wave.age {
    print(age) // 100
}

wave.name = "유영"
print(wave.name)


// 상수 프로퍼티
// 클래스 인스턴스의 상수 프로퍼티는 프로퍼티가 정의된 클래스에서만 초기화될 수 있다.
// 해당 클래스를 상속 받은 자식클래스의 이니셜라이저에는 부모클래스의 상수 프로퍼티 값을 초기화할 수 없다.
class Person2 {
    let name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let whale: Person2 = Person2(name: "whale")
whale.name = "고래" // 에러 발생
