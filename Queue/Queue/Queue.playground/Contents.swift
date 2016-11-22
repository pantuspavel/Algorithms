import UIKit

/**
 In computer science, a queue is a particular kind of abstract data type or collection
 in which the entities in the collection are kept in order and the principal (or only) operations on
 the collection are the addition of entities to the rear terminal position, known as enqueue, and
 removal of entities from the front terminal position, known as dequeue. This makes the queue a
 First-In-First-Out (FIFO) data structure. In a FIFO data structure, the first element added to the
 queue will be the first one to be removed. This is equivalent to the requirement that once a new
 element is added, all elements that were added before have to be removed before the new element can
 be removed. Often a peek or front operation is also entered, returning the value of the front
 element without dequeuing it. A queue is an example of a linear data structure, or more abstractly a
 sequential collection.
 
 front(enqueue)                         back(dequeue)
           +-----+   +-----+   +-----+
           |     |   |     |   |     |
  ->       +     +<--+     +<--+     +    ->
           |     |   |     |   |     |
           +-----+   +-----+   +-----+
 
 */

class Node<E> {
    let element: E
    var next: Node?

    init(with element: E, next: Node? = nil) {
        self.element = element
        self.next = next
    }
}

class Queue<E> {
    var front: Node<E>?
    var back: Node<E>?

    func enqueue(_ element: E) {
        let node = Node(with: element)
        front?.next = node
        front = node
        if back == nil {
            back = front
        }
    }

    func dequeue() -> E? {
        guard let back = back else {
            return nil
        }

        let element = back.element

        if back === front {
            self.front = nil
            self.back = nil
        } else {
            self.back = back.next
        }

        return element
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        var current = back
        var description = ""

        while current != nil {
            description = "\(current?.element)-" + description
            current = current?.next
        }

        return description
    }
}

let queueOfStrings = Queue<String>()
queueOfStrings.enqueue("a")
queueOfStrings.enqueue("b")
queueOfStrings.enqueue("c")

queueOfStrings.dequeue()
queueOfStrings

queueOfStrings.dequeue()
queueOfStrings

queueOfStrings.dequeue()
queueOfStrings

queueOfStrings.dequeue()