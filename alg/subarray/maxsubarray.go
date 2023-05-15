package main
import ("fmt"; "math")



func findMaxSubarray(A []int, low int, high int) (int, int, int){
	if high == low{
		return low, high, A[low]
	}else {
		mid := (low + high) / 2
		leftLow, leftHigh, leftSum := findMaxSubarray(A, low, mid)
		rightLow, rightHigh, rightSum := findMaxSubarray(A, mid+1, high)
		crossLow, crossHigh, crossSum := findMaxCrossSubarray(A, low, mid, high)
		
		if leftSum >= rightSum && leftSum >= crossSum{
			return leftLow, leftHigh, leftSum
		}else if rightSum >= leftSum && rightSum >= crossSum{
			return rightLow, rightHigh, rightSum
		}else{
			return crossLow, crossHigh, crossSum
		}
	}
}

func findMaxCrossSubarray(A []int, low int, mid int, high int) (int, int, int){
	maxLeft := mid
	maxRight := mid
	leftSum := math.MinInt64
	sum := 0
	for i := mid; i >= low; i--{
		sum += A[i]
		if sum > leftSum{
			leftSum = sum
			maxLeft = i
		}
	}
	rightSum := math.MinInt64
	sum = 0
	for i := mid + 1; i < high; i++{
		// fmt.Println(sum)
		sum += A[i]
		if sum > rightSum{
			rightSum = sum
			maxRight = i
		}
		// fmt.Println(sum, rightSum)
	}
	// fmt.Println(rightSum)

	//Max Int 64 overflows
	if leftSum < 0 && rightSum < 0 && leftSum + rightSum > 0{
		// fmt.Println("Overflow")
		return maxLeft, maxRight, math.MinInt64	
	}	

	return maxLeft, maxRight, leftSum + rightSum
}

func main(){
	arr := [16]int{13, -3, -25, 20, -3, -16, -23, 18, 20, -7, 12, -5, -22, 15, -4, 7}
	i, j, sum := findMaxSubarray(arr[:], 0, len(arr)-1)
	fmt.Println(arr[:])
	// fmt.Println(i, j, sum)
	fmt.Println("Found Max Subarray at index:", i, j, "with sum: ", sum)
	for k := i; k <= j; k++{
		fmt.Print(arr[k], ", ")
	}
	fmt.Println(sum)
}