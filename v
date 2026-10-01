/* cleanstr
package main

import (
	"os"

	"github.com/01-edu/z01"
)

func printString(s string) {
	for _, r := range s {
		z01.PrintRune(r)
	}
}

func main() {
	if len(os.Args) != 2 {
		z01.PrintRune('\n')
		return
	}

	str := os.Args[1]
	inWord := false
	firstWord := true

	for _, r := range str {
		if r == ' ' || r == '\t' {
			inWord = false
		} else {
			if !inWord {
				if !firstWord {
					z01.PrintRune(' ')
				}
				firstWord = false
				inWord = true
			}

			z01.PrintRune(r)
		}
	}

	z01.PrintRune('\n')
}*/

/*
expandstr
package main

import (
	"os"

	"github.com/01-edu/z01"
)

func main() {
	if len(os.Args) != 2 {
		return
	}

	str := os.Args[1]
	inWord := false
	firstWord := true

	for _, r := range str {
		if r == ' ' || r == '\t' {
			inWord = false
		} else {
			if !inWord {
				if !firstWord {
					z01.PrintRune(' ')
					z01.PrintRune(' ')
					z01.PrintRune(' ')
				}
				firstWord = false
				inWord = true
			}

			z01.PrintRune(r)
		}
	}

	if !firstWord {
		z01.PrintRune('\n')
	}
}

package main

func FindPrevPrime(nb int) int {
	if nb < 2 {
		return 0
	}

	for n := nb; n >= 2; n-- {
		prime := true

		for i := 2; i*i <= n; i++ {
			if n%i == 0 {
				prime = false
				break
			}
		}

		if prime {
			return n
		}
	}

	return 0
}
package piscine

func FromTo(from int, to int) string {
	if from < 0 || from > 99 || to < 0 || to > 99 {
		return "Invalid\n"
	}

	result := ""
	step := 1

	if from > to {
		step = -1
	}

	for i := from; ; i += step {
		if i < 10 {
			result += "0"
		}

		result += string(rune('0' + i/10))
		result += string(rune('0' + i%10))

		if i == to {
			break
		}

		result += ", "
	}

	result += "\n"
	return result
}
package piscine

func IsCapitalized(s string) bool {
	if s == "" {
		return false
	}

	startWord := true

	for _, r := range s {
		if r == ' ' || r == '\t' {
			startWord = true
			continue
		}

		if startWord {
			if r >= 'a' && r <= 'z' {
				return false
			}
			startWord = false
		}
	}

	return true
}
package piscine

func Itoa(n int) string {
	if n == 0 {
		return "0"
	}

	negative := false
	if n < 0 {
		negative = true
		n = -n
	}

	result := ""

	for n > 0 {
		digit := n % 10
		result = string(rune('0'+digit)) + result
		n /= 10
	}

	if negative {
		result = "-" + result
	}

	return result
}
package piscine

import "github.com/01-edu/z01"

func PrintMemory(arr [10]byte) {
	for i, b := range arr {
		hex := "0123456789abcdef"

		z01.PrintRune(rune(hex[b/16]))
		z01.PrintRune(rune(hex[b%16]))

		if i%4 == 3 {
			z01.PrintRune('\n')
		} else {
			z01.PrintRune(' ')
		}
	}

	// Print ASCII representation
	for _, b := range arr {
		if b >= 32 && b <= 126 {
			z01.PrintRune(rune(b))
		} else {
			z01.PrintRune('.')
		}
	}

	z01.PrintRune('\n')
}
package main

import "github.com/01-edu/z01"

func main() {
	first := true

	for a := 9; a >= 0; a-- {
		for b := 9; b >= 0; b-- {
			for c := 9; c >= 0; c-- {
				if a > b && b > c {
					if !first {
						z01.PrintRune(',')
						z01.PrintRune(' ')
					}

					z01.PrintRune(rune('0' + a))
					z01.PrintRune(rune('0' + b))
					z01.PrintRune(rune('0' + c))

					first = false
				}
			}
		}
	}

	z01.PrintRune('\n')
}
package piscine

func ThirdTimeIsACharm(str string) string {
	result := ""

	count := 0

	for _, r := range str {
		count++

		if count == 3 {
			result += string(r)
			count = 0
		}
	}

	return result + "\n"
}

package piscine

func WeAreUnique(str1, str2 string) int {
	if str1 == "" && str2 == "" {
		return -1
	}

	unique := ""

	// Characters that appear only in str1
	for _, r := range str1 {
		if contains(str2, r) == false && contains(unique, r) == false {
			unique += string(r)
		}
	}

	// Characters that appear only in str2
	for _, r := range str2 {
		if contains(str1, r) == false && contains(unique, r) == false {
			unique += string(r)
		}
	}

	return len([]rune(unique))
}

func contains(str string, target rune) bool {
	for _, r := range str {
		if r == target {
			return true
		}
	}
	return false
}
package piscine

func ZipString(s string) string {
	result := ""

	for i := 0; i < len(s); {
		count := 1

		for i+count < len(s) && s[i] == s[i+count] {
			count++
		}

		result += numberToString(count)
		result += string(s[i])

		i += count
	}

	return result
}

func numberToString(n int) string {
	if n == 0 {
		return "0"
	}

	result := ""

	for n > 0 {
		result = string(rune('0'+n%10)) + result
		n /= 10
	}

	return result
}
package main

import (
	"os"

	"github.com/01-edu/z01"
)

func isPrime(n int) bool {
	if n < 2 {
		return false
	}

	for i := 2; i*i <= n; i++ {
		if n%i == 0 {
			return false
		}
	}

	return true
}

func main() {
	if len(os.Args) != 2 {
		printNumber(0)
		z01.PrintRune('\n')
		return
	}

	n, ok := parseNumber(os.Args[1])

	if !ok || n <= 0 {
		printNumber(0)
		z01.PrintRune('\n')
		return
	}

	sum := 0

	for i := 2; i <= n; i++ {
		if isPrime(i) {
			sum += i
		}
	}

	printNumber(sum)
	z01.PrintRune('\n')
}

func parseNumber(s string) (int, bool) {
	if s == "" {
		return 0, false
	}

	n := 0

	for _, r := range s {
		if r < '0' || r > '9' {
			return 0, false
		}

		n = n*10 + int(r-'0')
	}

	return n, true
}

func printNumber(n int) {
	if n == 0 {
		z01.PrintRune('0')
		return
	}

	if n < 0 {
		z01.PrintRune('-')
		n = -n
	}

	digits := []rune{}

	for n > 0 {
		digits = append(digits, rune('0'+n%10))
		n /= 10
	}

	for i := len(digits) - 1; i >= 0; i-- {
		z01.PrintRune(digits[i])
	}
}
https://github.com/new