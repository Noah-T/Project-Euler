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
    NSLog(@"euler 1 is: %d\n\n", [self eulerProblem1]);
    NSLog(@"euler 2 is: %d\n\n", [self eulerProblem2]);
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


@end
