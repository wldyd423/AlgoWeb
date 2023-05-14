package main

import ("fmt"; "math")

func merge(A []int, p int, q int, r int){
	n1 := q - p + 1
	n2 := r - q
	L := make([]int, n1+1)
	R := make([]int, n2+1)
	for i := 0; i < n1; i++ {
		L[i] = A[p+i]
	}	
	for j := 0; j < n2; j++ {
		R[j] = A[q+j+1]
	}
	L[n1] = math.MaxInt64
	R[n2] = math.MaxInt64
	i := 0
	j := 0
	for k := p; k <= r; k++ {
		if L[i] <= R[j] {
			A[k] = L[i]
			i = i + 1
		}else{
			A[k] = R[j]
			j = j + 1
		}
	}
}

func mergeSort(A []int, p int, r int, debug bool){
	if p < r {
		q := (p + r) / 2
		mergeSort(A, p, q, debug)
		mergeSort(A, q+1, r, debug)
		merge(A, p, q, r)
		if debug {
			fmt.Println("Sorting: (", p, q, r, ")", A)
		}
	}
}

func main() {
	tobesorted := [10]int{3, 5, 1, 2, 4, 9, 8, 7, 6, 0}
	mergeSort(tobesorted[:], 0, len(tobesorted)-1, true)
	fmt.Println(tobesorted[:])
	
}