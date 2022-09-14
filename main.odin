package main

import "core:fmt"

width :: 230
height :: 60

rule :: proc(state: [width]int) -> [width]int {
	state1 := [width]int{}

	// Rules: https://en.wikipedia.org/wiki/Rule_110
	for i := 0; i < width; i += 1 {
		start := clamp(i-1, 0, width-1)
		end := clamp(i+1, 0, width-1)
		if      state[start] == 0 && state[i] == 0 && state[end] == 0 do state1[i] = 0
		else if state[start] == 0 && state[i] == 0 && state[end] == 1 do state1[i] = 1
		else if state[start] == 0 && state[i] == 1 && state[end] == 0 do state1[i] = 1
		else if state[start] == 0 && state[i] == 1 && state[end] == 1 do state1[i] = 1
		else if state[start] == 1 && state[i] == 0 && state[end] == 0 do state1[i] = 0
		else if state[start] == 1 && state[i] == 0 && state[end] == 1 do state1[i] = 1
		else if state[start] == 1 && state[i] == 1 && state[end] == 0 do state1[i] = 1
		else if state[start] == 1 && state[i] == 1 && state[end] == 1 do state1[i] = 0
	}

	return state1
}

main :: proc() {
	state := [width]int{} // Make state variable
	for i := width-1; i > 0; i -= 60 do state[i] = 1

	for i := 0; i < height; i += 1 {
		state = rule(state)
		for j := 0; j < width; j += 1 {
			fmt.print((state[j] == 1) ? "<" : " ")
		}
		fmt.println("");
	}
}
