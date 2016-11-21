import UIKit

/**
 In computer science, a stack is an abstract data type that serves as a collection of elements, with two
 principal operations: push, which adds an element to the collection, and pop, which removes the most 
 recently added element that was not yet removed. The order in which elements come off a stack gives
 rise to its alternative name, LIFO (for last in, first out). Additionally, a peek operation may give 
 access to the top without modifying the stack.
 */

class Node<E> {
    let element: E
    let next: Node?

    init(with element: E, next: Node? = nil) {
        self.element = element
        self.next = next
    }
}

class Stack<E> {
    var topNode: Node<E>?

    func push(_ element: E) {
        topNode = Node(with: element, next: topNode)
    }

    func pop() -> E? {
        guard let topNode = topNode else {
            return nil
        }
        self.topNode = topNode.next
        return topNode.element
    }

    func peek() -> E? {
        return topNode?.element
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        var result = ""

        var currentNode = topNode
        while currentNode != nil {
            result.append("\(currentNode?.element)-")
            currentNode = currentNode?.next
        }

        return result
    }
}

let stackOfInt = Stack<Int>()
stackOfInt.push(1)
stackOfInt.push(2)
stackOfInt.push(3)

stackOfInt.pop()
stackOfInt
stackOfInt.pop()
stackOfInt

stackOfInt.peek()
stackOfInt

stackOfInt.pop()
stackOfInt

stackOfInt.pop()
stackOfInt
