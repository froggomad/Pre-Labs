//: Data Model Test

import Foundation

enum SurveyType: String {
    case typical
}

enum Frequency: String {
    case daily
    case weekly
    case monthly
    case none
}

protocol User {
    var identifier: UUID { get }
    var firstName: String { get set }
    var lastName: String { get set }
}

struct Member: User, Equatable {

    let identifier: UUID
    var firstName: String
    var lastName: String

    init(identifier: UUID, firstName: String, lastName: String) {
        self.identifier = identifier
        self.firstName = firstName
        self.lastName = lastName
    }

    static func ==(lhs: Member, rhs: Member) {
        lhs.identifier == rhs.identifier
    }

}

struct Leader: User, Equatable {
    let identifier: UUID
    var firstName: String
    var lastName: String
    var isEditing: Bool = false

    static func ==(lhs: Leader, rhs: Leader) {
        lhs.identifier == rhs.identifier
    }
}

struct Topic {
    let type: SurveyType
    let joinCode: UUID
    let leader: Leader
    var frequency: Frequency
    var leaderQuestions: [Question]
    var memberQuestions: [Question]
    var members: [UUID: Member]
}

struct Question {
    let identifier: UUID
    let author: User
    let title: String
    let message: String
}

struct Thread {
    let identifier: UUID
    let author: User
    let title: String
    let message: String
}


let leader = Leader(identifier: UUID(), firstName: "Mobile", lastName: "Leader")
let maliciousMember = Member(identifier: UUID(), firstName: "Mobile", lastName: "Malicious")
let member = Member(identifier: UUID(), firstName: "Mobile", lastName: "User")

var topic = Topic(type: .typical, joinCode: UUID(), leader: leader, frequency: .daily, leaderQuestions: [], memberQuestions: [], members: [:])
topic.members[member.identifier] = member
topic.members[maliciousMember.identifier] = maliciousMember

print(topic.leader == leader)

func removeMemberFromTopic(removerId: UUID, memberToRemove: Member, topic: Topic) -> Topic? {
    var topic = topic
    if removerId == topic.leader.identifier || removerId == memberToRemove.identifier {
        let member = topic.members[memberToRemove.identifier]
        if member != nil {
            topic.members.removeValue(forKey: memberToRemove.identifier)
        } else {
            print("member not in dictionary")
        }
    }  else {
        print("removing member is not a leader")
    }
    return topic
}

print(removeMemberFromTopic(removerId: member.identifier, memberToRemove: member, topic: topic))


//: [Next](@next)
