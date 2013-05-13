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
@synthesize keyTextFeild,choiceSegmented,passesSegmented,data;

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
    char *alphabet1 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .?!:;'<>1234567890,/";
    int i = 0;
    int s = 0;
    int x = 0;
    int z = 0;
    int a = 5;
    int lengthAlpha = strlen(alphabet1);
    char alphabet2[lengthAlpha];
    int array[lengthAlpha];
    int inOrOut = 1;
    NSUInteger length = 5;
    char hi[] = "Hello";
    unichar input[length];
    unichar output[length];
    for (unsigned int i = 0; i < length; i++) {
        input[i] = hi[i];
    }
    for (int b=0; b<length;b++) {
        if (input[b] == '\n') {
            input[b] = ' ';
        }
    }
    x=0;
    int y = 0;
    i = 0;
    while (x < lengthAlpha) {
        srand(a);
        z = rand()%(lengthAlpha - 1);
        // Check the random place in the array for the presence of another char
        while (i < lengthAlpha && x < lengthAlpha) {
            if (z == array[i]) {
                z = (z + 1) % (lengthAlpha + 1);
                i=-1;
            }
            i++;
            y++;
        }
        i=0;
        // Puts it in the new alphabet
        alphabet2[z] = alphabet1[x];
        array[x] = z;
        x++;
    }
    i=0;
    while (array[i] < lengthAlpha) {
        array[i] = 0;
        i++;
    }
    i=0;
    //Encode it
    while (input[i] != '\0' && inOrOut == 1) {
        while (TRUE) {
            if (input[i] == alphabet1[s]) {
                //sets the origanal letter to be the encrypted letter
                output[i] = alphabet2[s];
                break;
            } else if (alphabet1[s] == '\0') {
                //if an unknown character is inputted, it will use this: _
                output[i] = '-';
                break;
            }
            s++;
        }
        i++;
        s=0;
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *plistFolderPath = [[NSBundle mainBundle] pathForResource:@"transfer" ofType:@"plist"];
    NSMutableDictionary *plistDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistFolderPath];
    NSLog(@"%@", plistDict);
    
    [plistDict setObject:[keyTextFeild.text intValue] forKey:@"key"];
    [plistDict setObject:[NSNumber numberWithInt:choiceSegmented.selectedSegmentIndex] forKey:@"inOrOut"];
    [plistDict setObject:[NSNumber numberWithInt:passesSegmented.selectedSegmentIndex] forKey:@"passes"];
    
    NSLog(@"%@ = %@ = %@", [plistDict objectForKey:@"key"], [plistDict objectForKey:@"inOrOut"], [plistDict objectForKey:@"passes"]);
    
    [plistDict writeToFile:[[NSBundle mainBundle] pathForResource:@"transfer" ofType:@"plist"] atomically: YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
