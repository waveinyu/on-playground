//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
/* 키 경로(keyPath) 서브스크립트와 키 경로 활용 
 키 경로를 잘 활용하면 프로토콜과 마찬가지로 타입 간의 의존성을 낮추는 데 많은 도움을 준다.
 애플의 프레임워크는 키-값 등 많은 곳에 키 경로(keyPath)를 활용하므로 숙지해두는 게 좋다.
 */

/*
 CustomStringConvertible
  스위프트는 클래스 인스턴스를 출력할 때, 'CustomStringConvertible' 프로토콜이 구현되어 있는지 확인한다.
 'CustomStringConvertible' 프로토콜 안에는 'description'이라는 프로퍼티가 존재하는데, 이를 구현하여 인스턴스를 문자열로 어떻게 표현할지 정의할 수 있다.

 print 함수는 기본적으로 CustomStringConvertible 프로토콜을 채택하고 있지 않기 때문에, 메모리 주소값이 출력된다.
 */
class Person: CustomStringConvertible {
    let name: String
    var age: Int = 100
    
    init(name: String) {
        self.name = name
    }
    
    // 문자열 보간법으로 해당 클래스, 구조체, 열거형의 인스턴스에 대한 설명을 문자열 형태로 제공하는 역할
    // 로깅, 디버깅, 사용자 인터페이스의 텍스트 표시 등 다양한 상황의 인스턴스 상태를 보다 쉽게 이해하고 설명 가능
    // 해당 구현은 전적으로 개발자에게 달려있으며 가독성광 유지보수성을 향상 시킬 수 있다.
    var description: String {
        return "name is \(name), age is \(age)"
    }
}

struct Stuff {
    var name: String
    var owner: Person // Person 클래스 타입이라 주소값을 참조
}

let wave = Person(name: "wave")
let whale = Person(name: "whale")

let macbook = Stuff(name: "MacBook Pro", owner: wave)
var iMac = Stuff(name: "iMac", owner: wave)
let iPhone = Stuff(name: "iPhone", owner: whale)

let stuffNameKeyPath = \Stuff.name
let ownerkeyPath = \Stuff.owner

// \Stuff.owner.name와 같은 표현이된다.
let ownerNameKeyPath = ownerkeyPath.appending(path: \.name) // 더 깊은 키 패스를 얻는 방법(해당 구조체, 클래스의 프로퍼티명을 명시)
print(ownerNameKeyPath)

// 키 경로와 서브 스크립트를 이용해 프로퍼티에 접근하여 값을 가져온다.
print(macbook[keyPath: stuffNameKeyPath], macbook[keyPath: ownerkeyPath]) // MacBook Pro, 인스턴스의 메모리 주소 출력 -> 프로토콜 사용으로 description 프로퍼티 출력
print(iMac[keyPath: stuffNameKeyPath], iMac[keyPath: ownerkeyPath]) // iMac, 인스턴스의 메모리 주소 출력 -> 이하 동문
print(iPhone[keyPath: stuffNameKeyPath], iPhone[keyPath: ownerkeyPath]) // iPhone, 인스턴스의 메모리 주소 출력 -> 이하 동문


// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 변경한다.
iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerkeyPath] = whale
print(iMac[keyPath: stuffNameKeyPath]) // "iMac Pro"
print(iMac[keyPath: ownerNameKeyPath]) // whale


// 상수로 지정한 값 타입과 읽기 전용 프로퍼티는 키 경로 서브스크립트로도 값을 바꿔줄 수 없다.
//macbook[keyPath: stuffNameKeyPath] = "macbook pro space black" // 에러 발생
//wave[keyPath: \Person.name] = "cake" // 에러 발생

