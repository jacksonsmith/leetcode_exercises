import Cocoa

class FirstAndLastPosition {
    //34. Find First and Last Position of Element in Sorted Array

    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        let firstPosition = binarySearchFirst(nums, target)
        let lastPosition = binarySearchLast(nums, target)
        
        return [firstPosition, lastPosition]
    }
    
    func binarySearchFirst(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        var targetPosition = -1
        
        while (right >= left) {
            let mid = left + (right - left) / 2
            
            if (nums[mid] == target) {
                if (!nums.indices.contains(mid - 1) || nums[mid - 1] != target) {
                    targetPosition = mid
                    break;
                } else {
                    right = mid - 1
                }
            } else if (nums[mid] < target ) {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
                
        return targetPosition
    }
    
    func binarySearchLast(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        var targetPosition = -1
        
        while (right >= left) {
            let mid = left + (right - left) / 2
            
            if (nums[mid] == target) {
                if !nums.indices.contains(mid + 1) || (nums[mid + 1] != target) {
                    targetPosition = mid
                    break;
                } else {
                    left = mid + 1
                }
            } else if (nums[mid] < target ) {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }
        }
                
        return targetPosition
    }
}

let firstAndLastPosition = FirstAndLastPosition()
let firstTestCase = firstAndLastPosition.searchRange([5,7,7,8,8,10], 8)
let secondTestCase = firstAndLastPosition.searchRange([5,7,7,8,8,10], 6)
let thirdTestCase = firstAndLastPosition.searchRange([], 0)

print(firstTestCase == [3,4])
print(secondTestCase == [-1,-1])
print(thirdTestCase == [-1,-1])
