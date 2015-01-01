//
//  ViewController.m
//  Project Euler
//
//  Created by Noah Teshu on 12/21/14.
//  Copyright (c) 2014 Noah Teshu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"the return value from euler10 is: %lu", [self eulerProblem10]);
    //NSLog(@"the return value from euler6 is: %lu", [self eulerProlbem6]);
    //NSLog(@"the return value from euler5 is: %lu", [self eulerProblem5]);
    //NSLog(@"the return value from euler4 is: %lu", [self eulerProblem4]);
    //NSLog(@"euler 1 is: %d\n\n", [self eulerProblem1]);
    //NSLog(@"euler 2 is: %d\n\n", [self eulerProblem2]);
    //NSLog(@"NSUIntegerMax is: %lu", NSUIntegerMax);
    
    //NSLog(@"maxPrimeFactor is: %lu",[self eulerProblem3]);
    //NSLog(@"hello from after the function");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int)eulerProblem1
{
    int finalSum;
    for (int i = 0; i < 1000; i++) {
        if (i % 3 == 0 && i % 5 ==0) {
            finalSum += i;
        } else if (i % 3 == 0){
            finalSum += i;
        } else if (i % 5 ==0){
            finalSum +=i;
        }
    }
    return finalSum;
}

-(int)eulerProblem2
{
    NSMutableArray *fibonacciArray = [NSMutableArray array];
    [fibonacciArray addObject:@1];
    [fibonacciArray addObject:@2];
    
    int newFibonacci;
    int evenSum = 2;
    for (int i = 2; newFibonacci < 4000000 ; i++) {
        
        
        newFibonacci = [[fibonacciArray objectAtIndex:i-2]intValue] + [[fibonacciArray objectAtIndex:i-1]intValue];
        if (newFibonacci > 4000000) {
            NSLog(@"fibonacci array: %@", fibonacciArray);
            return evenSum;
        }
        
        
        [fibonacciArray addObject:[NSNumber numberWithInt:newFibonacci]];
        if (newFibonacci % 2 == 0) {
            evenSum += newFibonacci;
            NSLog(@"this one is even\n");
        }
    }
    NSLog(@"fibonacci array: %@", fibonacciArray);
    return evenSum;
    
}

-(NSUInteger)eulerProblem3{
    NSLog(@"hi from the start of euler 3");
    NSUInteger maxPrimeFactor = 0;
    NSUInteger numberFromProblem = 600851475143;
    
    for (NSUInteger i = 2; i<numberFromProblem; i++) {
        //if the number is divisble by i
        if (numberFromProblem % i == 0) {
            //if i is prime
            if ([self isItPrime:i] == 1) {
                //if i is greater than the current max prime factor
                if (i > maxPrimeFactor) {
                    maxPrimeFactor = i;
                    NSLog(@"the max prime factor from inside the function is: %lu", maxPrimeFactor);
                }
            }
        }
    }
    return maxPrimeFactor;
}

-(NSUInteger)eulerProblem4{
    int maxPalindrome = 0;
    for (int i = 1; i < 1000; i++) {
        for (int j = i; j < 1000; j++) {
            if ([self isNumberAPalindrome:i*j]) {
                if (i*j > maxPalindrome) {
                    maxPalindrome = i*j;
                }
            }
        }
    }
    return maxPalindrome;
}

-(NSUInteger)eulerProblem5
{
    BOOL evenlyDivisibleForOneThroughTwenty;
    for (NSUInteger i = 2520; evenlyDivisibleForOneThroughTwenty == NO; i++) {
        evenlyDivisibleForOneThroughTwenty = NO;
        for (NSUInteger j = 1; j <= 20; j++) {
            if (i % j != 0) {
                evenlyDivisibleForOneThroughTwenty = NO;
                j = 21;
            } else {
                evenlyDivisibleForOneThroughTwenty = YES;
                if (j == 20) {
                    return i;
                }
            }
        }
    }
    return 1;
}

-(NSUInteger)eulerProlbem6
{
    NSUInteger runningSum = 0;
    NSUInteger runningSquareSum = 0;
    
    for (NSUInteger i = 1; i <=100; i++) {
        runningSum += i;
        runningSquareSum += i*i;
    }
    
    NSUInteger finalAnswer =  (runningSum * runningSum) - runningSquareSum;

    return finalAnswer;
}

-(NSUInteger)eulerProblem10
{
    NSUInteger runningSumOfPrimeNumbers = 2;
    for (NSUInteger i = 2; i <2000000; i++) {
        if ([self isItPrime:i]) {
            runningSumOfPrimeNumbers += i;
        }
    }
    return runningSumOfPrimeNumbers;
}

-(BOOL)isItPrime:(NSUInteger)num
{
    BOOL isPrime = NO;
    
    if (num < 2) {
        NSLog(@"%lu is not prime, because it's less than 2", num);
        return NO;
    }
    for (NSUInteger i = 2; i<num; i++) {
        if (num % i == 0) {
            isPrime = NO;
            i = num-1;
        } else {
            isPrime = YES;
        }
        
        if (i == num-1) {
            if (isPrime == YES) {
                NSLog(@"%lu is prime", num);
            } else {
                NSLog(@"%lu is not prime", num);
            }
        }
    }
    return isPrime;
}

-(BOOL)isNumberAPalindrome:(int)number
{
    BOOL isAPalindrome;
    NSString *stringWithNumber = [NSString stringWithFormat:@"%d", number];
    unichar firstChar = [stringWithNumber characterAtIndex:0];
    unichar lastChar = [stringWithNumber characterAtIndex:stringWithNumber.length-1];
    
    unsigned long halfTheLengthOfTheString = stringWithNumber.length/2;
    
    for (int i = 0; i <= halfTheLengthOfTheString ; i++) {
        if ([stringWithNumber characterAtIndex:i] != [stringWithNumber characterAtIndex: stringWithNumber.length-1-i]) {
            isAPalindrome = NO;
            return isAPalindrome;
        }
    }
    
    if (firstChar == lastChar) {
        NSLog(@"these are the same");
    }
    NSLog(@"%@", stringWithNumber);
    isAPalindrome = YES;
    return isAPalindrome;
}


-(void)EulerProblem13
{
    
}






@end
