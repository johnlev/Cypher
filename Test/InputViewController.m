//
//  InputViewController.m
//  Cypher1
//
//  Created by John Kotz on 3/28/13.
//  Copyright (c) 2013 Kotz Productions. All rights reserved.
//

#import "MainInputViewController.h"
#import "InputViewController.h"

@interface InputViewController ()

@end

@implementation InputViewController
@synthesize keyTextFeild,passesSegmented;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"transfer" ofType:@"plist"]];
    
    keyTextFeild.text = [NSString stringWithFormat:@"%@",[plistDict objectForKey:@"key"]];
    passesSegmented.selectedSegmentIndex = [[plistDict objectForKey:@"passes"] intValue] -1;
}

-(IBAction)save:(id)sender{
    NSNumber *key;
    NSNumber *passes;
    key = [NSNumber numberWithInt:[keyTextFeild.text intValue]];
    passes = [NSNumber numberWithInt:passesSegmented.selectedSegmentIndex + 1];
    
    NSLog(@"%@ - %@", key,passes);
    
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"transfer" ofType:@"plist"]];
    
    [plistDict setValue:key forKey:@"key"];
    [plistDict setValue:passes forKey:@"passes"];
    
    [plistDict writeToFile:[[NSBundle mainBundle] pathForResource:@"transfer" ofType:@"plist"] atomically: YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
