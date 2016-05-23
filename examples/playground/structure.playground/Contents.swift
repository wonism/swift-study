//: Playground - noun: a place where people can play

import UIKit

struct Task {
    var title: String?
    var time: Int?

    var owner: Employee
    var participant: Employee?

    var type:TaskType

    enum TaskType {
        case Call
        case Report
        case Meet
        case Support

        var typeTitle: String {
            get {
                let titleString: String
                switch self {
                    case .Call:
                        titleString = "Call"
                    case .Report:
                        titleString = "Report"
                    case .Meet:
                        titleString = "Meet"
                    case .Support:
                        titleString = "Support"
                }

                return titleString
            }
        }
    }
}

class Employee {
    var name: String?
    var phoneNumber: String?
    var boss: Employee?
}

let me:Employee = Employee()
me.name = "Alex"
me.phoneNumber = "010-1234-5678"

let toby = Employee()
toby.name = "Toby"
toby.phoneNumber = "011-1111-1123"

var callTask = Task(title: "Call to Tobby", time: 10 * 60, owner: me, participant: toby, type: .Call)
var reportTask = Task(title: "Report to Boss", time: nil, owner: me, participant: nil, type: Task.TaskType.Report)

callTask.participant?.phoneNumber = "011-1111-1234"

var todayTask: [Task] = []
todayTask += [callTask, reportTask]
todayTask[1].time = 15 * 60

callTask.title = "Call to Tobby"

print("today task = \(todayTask), callTask = \(callTask)")

/*

구조체는 Class와 함께 데이터 모델의 중요한 구성요소 중 하나.

내부에 변수나 상수 또는 함수를 선언한 뒤 인스턴스(Instance)를 만들어서 사용한다.
주로 좌표나 크기처럼 간단한 값을 표현하는 데 많이 사용되어 왔다
Swift에서 Class의 대안으로 그 역할이 커지고 있다

구조체는 Value Type
Value 타입의 인스턴스
Int나 Double 과 같이 직접 값을 가지는 것
Reference 타입의 인스턴스
인스턴스가 있는 메모리 번지를 참조하는 것
Value 타입은 할당시에 인스턴스가 복사되지만
Reference 타입은 할당시에 참조하는 메모리번지만 전달된다

///////////////////////////////////////////////////////////////////////////////////////////////////

데이터 모델의 중요한 구성요소로서 Object를 만든다.
클래스는 객체지향 프로그래밍(OOP, Object Oriented Programming)의 근간을 이룬다.

클래스로 만든 오브젝트는 Reference Type으로 동작하며, 할당시 복사되지 않는다.
하나의 인스턴스에 대한 레퍼런스를 공유한다.
인스턴스를 할당한 뒤 수정하면 원본과 할당된 곳 모두 수정됨
let으로 정의 해도 프라퍼티가 var이면 수정 가능

///////////////////////////////////////////////////////////////////////////////////////////////////

연관성 있는 깂들의 그룹을 만들어 Type-Safe 하게 사용하는 것이다.

여러 다른 언어에서 일련의 값에 일대 일 대응되는 Enum을 정의해서 사용

Task의 상태값을 나타내기 위해 0, 1, 2등의 정수값을 사용
보다 직관적으로 0은 READY, 1은 COUNTING, 2는 PAUSED, 3은 DONE 과 같이 Enum으로 정의해서 사용하는 방식
Swift에서 Enumeration은 보다 강력한 기능을 가진다

1st class type
매개변수나 리턴타입으로 사용
메소드를 가진다거나 프로토콜을 준수

- 출처 : http://tryhelloworld.co.kr/
*/
