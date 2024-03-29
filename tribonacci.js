function tribonacci(n) { 
    if (n == 0 || n == 1)
        return 0;
    
    if (n == 2)
        return 1;

    return tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3);
} 
  
console.log(tribonacci(37)); 