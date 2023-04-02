#Name: CS 2640.02 Joseph Bui
#Date: 03/26/23
#Objectives:
# -Ask the user for two integers, and store them into registers
# -Print out both integers that the user has inputted
# -Perform basic arithmetic operations on the two integers
# -Compare the two integers and print out a message specifying if they are equal or not

.data
getInt1: .asciiz "Please enter an integer: "
getInt2: .asciiz "Please enter another integer: "
printInt1: .asciiz "\nThe first integer is: "
printInt2: .asciiz "\nThe second integer is: "

addition: .asciiz "\nThe sum is: "
subtraction: .asciiz "\nThe difference between the first int and the second int is: "
multiplication: .asciiz "\nThe product is: "
division: .asciiz "\nThe quotient of the first int divided by the second int is: "
remainder: .asciiz "\nThe remainder is: "

areEqual: .asciiz "\nUser inputs are the same"
notEqual: .asciiz "\nUser inputs are different"

.text
main:
	#prompt user for the first integer
	li $v0, 4
	la $a0, getInt1
	syscall
	
	#get user input for first integer
	li $v0, 5
	syscall
	move $s0, $v0 #store the first integer into $s0
	
	#prompt user for second integer
	li $v0, 4
	la $a0, getInt2
	syscall
	
	#get user input for second integer
	li $v0, 5
	syscall
	move $s1, $v0 #store the second integer into $s1
	
	#print out first integer
	li $v0, 4
	la $a0, printInt1
	syscall #print out label first
	li $v0, 1
	move $a0, $s0
	syscall
	
	#print out second integer
	li $v0, 4
	la $a0, printInt2
	syscall #print out label first
	li $v0, 1
	move $a0, $s1
	syscall
	
	#add the two values
	li $v0, 4
	la $a0, addition
	syscall #print label
	add $t0, $s0, $s1 #add numbers and store result in $t0
	li $v0, 1
	move $a0, $t0
	syscall
	
	#subtract the two values
	li $v0, 4
	la $a0, subtraction
	syscall #print label
	sub $t0, $s0, $s1 #subtract numbers and store result in $t0
	li $v0, 1
	move $a0, $t0
	syscall
	
	#multiply the two values
	li $v0, 4
	la $a0, multiplication
	syscall #print label
	mul $t0, $s0, $s1 #multiply numbers and store result into $t0
	li $v0, 1
	move $a0, $t0
	syscall
	
	#divide the two values
	li $v0, 4
	la $a0, division
	syscall #print label for quotient
	
	div $s0, $s1
	mflo $t0 #store quotient into $t0
	mfhi $t1 #store remainder into $t1
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, remainder
	syscall #print label for remainder
	li $v0, 1
	move $a0, $t1
	syscall
	
	#check whether the numbers are the same or not
	beq $s0, $s1, equal
	bne $s0, $s1, not_equal
	
	
equal:
	#print message if the numbers are equal
	li $v0, 4
	la $a0, areEqual
	syscall
	j exit
	
not_equal:
	#print message if numbers are not equal
	li $v0, 4
	la $a0, notEqual
	syscall
	
exit:
	#exit the program
	li $v0, 10
	syscall	
	
