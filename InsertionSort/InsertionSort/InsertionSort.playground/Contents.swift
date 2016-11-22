import UIKit

/**
 Insertion sort is a simple sorting algorithm that builds the final sorted array (or list) one item at a time.
 It is much less efficient on large lists than more advanced algorithms such as quicksort, heapsort, or merge sort.
 
 O(n^2)
 */

func insertion_sort<E: Comparable>( _ array: inout [E]) {
    for i in 1..<array.count {
        for j in (0..<i).reversed() {
            if array[j + 1] < array[j] {
                let tmp = array[j + 1]
                array[j + 1] = array[j]
                array[j] = tmp
            }
        }
    }
}

var arrayOfInts = [120, -1, 5, 100, 5, 3, 4, 8, 19]
insertion_sort(&arrayOfInts)

var arrayOfStrings = ["z", "a", "h", "m", "ab", "p"]
insertion_sort(&arrayOfStrings)