/*************************************************************************/
/* ABEViewController.m
/*************************************************************************/
/* Copyright (c) 2014-present, UberBeta
/*
/* This source code is licensed under the GNU GPL v2.0 license found in the
/* LICENSE file in the root directory of this source tree.
/*************************************************************************/

#import "ABEViewController.h"

@interface ABEViewController ()

@property (nonatomic) double total;
@property (nonatomic) NSString *expression;
@property (nonatomic) NSMutableArray *stack;
@property (nonatomic) BOOL operatorPushed;
@property (nonatomic) BOOL dotPushed;
@property (nonatomic) BOOL equalsPressed;

@end

@implementation ABEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.stack = [[NSMutableArray alloc] init];
    self.total = 0;
    self.expression = @"";
    self.operatorPushed = self.dotPushed = self.equalsPressed = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"1"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
}

- (IBAction)button2:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"2"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
}

- (IBAction)button3:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"3"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
}

- (IBAction)button4:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"4"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];}


- (IBAction)button5:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"5"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
}

- (IBAction)button6:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"6"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
}

- (IBAction)button7:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"7"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
}

- (IBAction)button8:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"8"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
}

- (IBAction)button9:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"9"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
}

- (IBAction)button0:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    self.operatorPushed = NO;
    self.expression = [self.expression stringByAppendingString:@"0"];
    self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
}

- (IBAction)buttonDot:(id)sender {
    if (self.equalsPressed) {
        [self.stack removeAllObjects];
        self.equalsPressed = NO;
    }
    
    if (!self.dotPushed) {
        self.expression = [self.expression stringByAppendingString:@"."];
        self.displayLabel.text = [NSString stringWithFormat:@"%@",self.expression];
    }
    
    self.dotPushed = YES;
}

- (IBAction)buttonEquals:(id)sender {
    if (!self.operatorPushed) {
        [self.stack addObject:self.expression];
        [self.stack addObject:@"+"];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    if ([self.stack count] == 4) {
        if ([self.stack[1]  isEqual: @"+"])
            self.total = [self.stack[0] floatValue] + [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"-"])
            self.total = [self.stack[0] floatValue] - [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"*"])
            self.total = [self.stack[0] floatValue] * [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"/"])
            self.total = [self.stack[0] floatValue] / [self.stack[2] floatValue];
        
        [self.stack removeAllObjects];
        [self.stack addObject:[NSString stringWithFormat:@"%g", self.total]];
        [self.stack addObject:@"+"];
        self.displayLabel.text = [NSString stringWithFormat:@"%g",self.total];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    else {
        [self.stack removeLastObject];
        [self.stack addObject:@"+"];
    }
    
    self.dotPushed = NO;
    self.equalsPressed = YES;
}

- (IBAction)buttonPlus:(id)sender {
    if (!self.operatorPushed) {
        [self.stack addObject:self.expression];
        [self.stack addObject:@"+"];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    if ([self.stack count] == 4) {
        if ([self.stack[1]  isEqual: @"+"])
            self.total = [self.stack[0] floatValue] + [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"-"])
            self.total = [self.stack[0] floatValue] - [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"*"])
            self.total = [self.stack[0] floatValue] * [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"/"])
            self.total = [self.stack[0] floatValue] / [self.stack[2] floatValue];
        
        [self.stack removeAllObjects];
        [self.stack addObject:[NSString stringWithFormat:@"%g", self.total]];
        [self.stack addObject:@"+"];
        self.displayLabel.text = [NSString stringWithFormat:@"%g",self.total];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    else {
        [self.stack removeLastObject];
        [self.stack addObject:@"+"];
    }
    
    self.dotPushed = self.equalsPressed = NO;
}

- (IBAction)buttonMinus:(id)sender {
    if (!self.operatorPushed) {
        [self.stack addObject:self.expression];
        [self.stack addObject:@"-"];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    if ([self.stack count] == 4) {
        if ([self.stack[1]  isEqual: @"+"])
            self.total = [self.stack[0] floatValue] + [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"-"])
            self.total = [self.stack[0] floatValue] - [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"*"])
            self.total = [self.stack[0] floatValue] * [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"/"])
            self.total = [self.stack[0] floatValue] / [self.stack[2] floatValue];
        
        [self.stack removeAllObjects];
        [self.stack addObject:[NSString stringWithFormat:@"%g", self.total]];
        [self.stack addObject:@"-"];
        self.displayLabel.text = [NSString stringWithFormat:@"%g",self.total];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    else {
        [self.stack removeLastObject];
        [self.stack addObject:@"-"];
    }
    
    self.dotPushed = self.equalsPressed = NO;
}

- (IBAction)buttonMultiply:(id)sender {
    if (!self.operatorPushed) {
        [self.stack addObject:self.expression];
        [self.stack addObject:@"*"];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    if ([self.stack count] == 4) {
        if ([self.stack[1]  isEqual: @"+"])
            self.total = [self.stack[0] floatValue] + [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"-"])
            self.total = [self.stack[0] floatValue] - [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"*"])
            self.total = [self.stack[0] floatValue] * [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"/"])
            self.total = [self.stack[0] floatValue] / [self.stack[2] floatValue];
        
        [self.stack removeAllObjects];
        [self.stack addObject:[NSString stringWithFormat:@"%g", self.total]];
        [self.stack addObject:@"*"];
        self.displayLabel.text = [NSString stringWithFormat:@"%g",self.total];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    else {
        [self.stack removeLastObject];
        [self.stack addObject:@"*"];
    }
    
    self.dotPushed = self.equalsPressed = NO;
}

- (IBAction)buttonDivide:(id)sender {
    if (!self.operatorPushed) {
        [self.stack addObject:self.expression];
        [self.stack addObject:@"/"];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    if ([self.stack count] == 4) {
        if ([self.stack[1]  isEqual: @"+"])
            self.total = [self.stack[0] floatValue] + [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"-"])
            self.total = [self.stack[0] floatValue] - [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"*"])
            self.total = [self.stack[0] floatValue] * [self.stack[2] floatValue];
        
        else if ([self.stack[1]  isEqual: @"/"])
            self.total = [self.stack[0] floatValue] / [self.stack[2] floatValue];
        
        [self.stack removeAllObjects];
        [self.stack addObject:[NSString stringWithFormat:@"%g", self.total]];
        [self.stack addObject:@"/"];
        self.displayLabel.text = [NSString stringWithFormat:@"%g",self.total];
        self.expression = @"";
        self.operatorPushed = YES;
    }
    
    else {
        [self.stack removeLastObject];
        [self.stack addObject:@"/"];
    }
    
    self.dotPushed = self.equalsPressed = NO;
}

- (IBAction)buttonClear:(id)sender {
    self.total = 0;
    self.displayLabel.text = @"0";
    self.expression = @"";
    self.operatorPushed = self.dotPushed = self.equalsPressed = NO;
    [self.stack removeAllObjects];
}
@end
