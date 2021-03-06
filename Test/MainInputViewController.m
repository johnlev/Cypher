//
//  ViewControllerNew.m
//  Cypher1
//
//  Created by John Kotz on 3/28/13.
//  Copyright (c) 2013 Kotz Productions. All rights reserved.
//

#import "MainInputViewController.h"
#import "AppDelegate.h"

@interface MainInputViewController ()

@end

@implementation MainInputViewController
@synthesize encryptTextVeiw,choiceSeg,scroll;

-(IBAction)gotoSettings:(id)sender{
    [self performSegueWithIdentifier:@"settings" sender:self];
}
-(IBAction)clicked:(id)sender{
    NSString *path = [(NSString *) [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"transfer.plist"];
    printf("\n\n------------Preparing-------------\n");
    NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSUInteger length = [encryptTextVeiw.text length];
    unichar input[length];
    unichar output[length];
    int passed = 0;
    [self.view endEditing:YES];
    NSString* string = encryptTextVeiw.text;
    
    int passes = [[plistDict objectForKey:@"passes"]intValue];
    int key = [[plistDict objectForKey:@"key"]intValue];
    int choice = choiceSeg.selectedSegmentIndex;
    if ([plistDict objectForKey:@"defaultSettings"]) {
        key = 11;
    }
    
    NSLog(@"Passes = %d", passes);
    NSLog(@"Input = %@", string);
    NSLog(@"Key = %d", key);
    //encrypt
    printf("++++++++++++++++Starting+++++++++++++++++\n");
    while (passed <= passes) {
        //Create variables
        char *alphabet1 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .?!:;'<>1234567890,/";
        int i = 0;
        int s = 0;
        int x = 0;
        int z = 0;
        int lengthAlpha = strlen(alphabet1);
        char alphabet2[lengthAlpha];
        
        //convert
        for (unsigned int i = 0; i < length; i++) {
            input[i] = [string characterAtIndex:i];
        }
        
        //replace new lines with spaces
        for (int b=0; b<[string length];b++) {
            if (input[b] == '\n') {
                input[b] = ' ';
            }
        }
        x=0;
        i = 0;
        
        //Clear Alphabet just in case
        while (i < lengthAlpha) {
            alphabet2[i] = 0;
            i++;
        }
        i=0;
        
        //Write random alphabet
        srand(key);
        while (alphabet1[x] != '\0') {
            z = rand()%(lengthAlpha - 1) +1;
            // Check the random place in the array for the presence of another char
            while (i < lengthAlpha) {
                if (alphabet1[z] == alphabet2[i]) {
                    z = (z + 1) % lengthAlpha;
                    i=-1;
                }
                i++;
            }
            i=0;
            // Write in the new alphabet
            alphabet2[x] = alphabet1[z];
            x++;
        }
        i=0;
        
        //Translate
        while (input[i] != '\0' && choice == 0) {
            while (TRUE) {
                if (input[i] == alphabet1[s]) {
                    //sets the encrypted letter to be the origanal letter
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
        i=0;
        while (input[i] != '\0' && choice == 1) {
            while (TRUE) {
                if (input[i] == alphabet2[s]) {
                    //sets the encrypted letter to be the origanal letter
                    output[i] = alphabet1[s];
                    break;
                } else if (alphabet2[s] == '\0') {
                    //if an unknown character is inputted, it will use this: _
                    output[i] = '-';
                    break;
                }
                s++;
            }
            i++;
            s=0;
        }
        string = [NSString stringWithCharacters:output length:length];
        passed++;
    }
    NSLog(@"Passed = %d",passed);
    printf("===============Done=================\n");
    NSLog(@"Output = %@", string);
    
    
    label = string;
    
    [plistDict setValue:label forKey:@"text"];
    
    [plistDict writeToFile:path atomically:YES];
    
    [self performSegueWithIdentifier:@"Go" sender:self];
}

-(IBAction)paster:(id)sender{
    encryptTextVeiw.text = [UIPasteboard generalPasteboard].string;
    [self.view endEditing:YES];
}
-(IBAction)clear:(id)sender{
    encryptTextVeiw.text = NULL;
}



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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
