 .data
  str_start: .asciiz "Calculation of the Greatest Common Division of two integers using Eclidi's algorithm"
  str_give1: .asciiz "\nGive number one:"
  str_give2: .asciiz "\nGive number two:"
  str_midle: .asciiz "The Greatest Common Divisionis:" 
  str_end: .asciiz "Both numbers are zeros!!!"
 
 .text
  ## Print of the str_start
  li $v0, 4
  la $a0, str_start
  syscall
  
  
############################################################################################
 start_print: 
  ## Program wants the user to enter the first number   
  ## Print of the str_give1
  li $v0, 4
  la $a0, str_give1
  syscall
  li $v0, 5
  syscall
  
  move $t0, $v0 ## Store of the first num that the user enters in the register $t0
  
  ## Program wants the user to enter the second number 
  ## Print of the str_give2
  li $v0, 4
  la $a0, str_give2
  syscall
  li $v0, 5
  syscall
  
  move $t1, $v0 ## Store of the second value that the user enters in the $t1 
  
#######################################################################################################  
  checkForFirstZeros:  ## Check if the first num that the user enters is zero
  beq $t0, 0 , printErrorForZeros
#######################Check if one of the two nums is zero, Get the other non zero num as ÌÊÄ####################################  
  ## If the first num is ZERO, the MKÄ is the second num
  checkIfFirstNumIsEqualWithZero:
  beq $t0, 0 , Print_IfFirstNumIsEqualWithZero
  ## If the Second num is ZERO, the MKÄ is the first num
  checkIfSecondNumIsEqualWithZero:
  beq $t1, 0, Print_IfSecondNumIsEqualWithZero
############################################################################################ 
  
#######################Convert negative nums to  postitve nums###################################
  convertNegativeNums:
  blt $t0, 0, FirstConvertNum
  blt $t1, 0, SecondConvertNum
############################################################################################   
  loop_1:
   div $t0, $t1 ## HI == remainder 
   mfhi $t3 ## $t3 == reaminder
   move $t8, $t3
   beq $t3, 0 ,loop1_end
  loop_2:
   div $t1, $t3 ## HI == Remainder of the Doivision of $t1 with $t3
   mfhi $t4 ## $t4 == remainder
   move $t8, $t3
   beq $t4, 0, loop1_end
  loop_3:
   div $t3, $t4
   mfhi $t5
   move $t8, $t4
   beq $t5, 0, loop1_end
  loop_4:
   div $t4, $t5
   mfhi $t6
   move $t8, $t6
   beq $t6, 0, loop1_end
  
   
   j loop_1
############################################################################################ 

  
  loop1_end:
   ## Print of str_middle
   li $v0, 4
   la $a0, str_midle
   syscall
   move $a0, $t8
   li $v0, 1
   syscall
   
  j start_print 

############################################################################################    
  Print_IfFirstNumIsEqualWithZero:
  li $v0, 4
  la $a0, str_midle
  syscall
  move $a0, $t1
  li $v0 ,1
  syscall
  
  li $v0, 10
  syscall
  
  Print_IfSecondNumIsEqualWithZero:
  li $v0, 4
  la $a0, str_midle
  syscall
  move $a0, $t0
  li $v0 ,1
  syscall
  
  li $v0, 10
  syscall
############################################################################################
  FirstConvertNum:
  mul $t0, $t0, -1  ## negative to positive, with mull -1...
  SecondConvertNum:
  mul $t1, $t1, -1
  
  j loop_1 
############################################################################################   
  printErrorForZeros:
  ## Check if the second num that the user enters is zero  
  bne $t1, 0 , checkIfFirstNumIsEqualWithZero ## If the second num is NON zero go up and continue, else print  "Both numbers are zeros!!!"
  
  li $v0, 4
  la $a0, str_end
  syscall
   
  j start_print
  
  
 
