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
@synthesize encryptTextVeiw;

-(IBAction)gotoSettings:(id)sender{
    [self performSegueWithIdentifier:@"settings" sender:self];
}
-(IBAction)clicked:(id)sender{
    NSString *plistFolderPath = [[NSBundle mainBundle] pathForResource:@"Selected" ofType:@"plist"];
    NSMutableDictionary *plistDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistFolderPath];
    NSString *encrypt;
    encrypt = encryptTextVeiw.text;
    NSUInteger length = [encrypt length];
    unichar input[length];
    unichar output[length];
    int passed = 0;
    [self.view endEditing:YES];
    NSString* string = encrypt;
    int passes = [[NSUserDefaults standardUserDefaults] objectForKey:@"passes"];
    int key = [[NSUserDefaults standardUserDefaults] objectForKey:@"key"];
    int choice = [[NSUserDefaults standardUserDefaults] objectForKey:@"inOrOut"];
    
    
    NSLog(@"%@ : %@ : %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"inOrOut"], [[NSUserDefaults standardUserDefaults] objectForKey:@"passes"], [[NSUserDefaults standardUserDefaults] objectForKey:@"key"]);
    //encrypt
    while (passed < passes + 1 && choice == 0) {
        char *alphabet1 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .?!:;'<>1234567890,/";
        int i = 0;
        int s = 0;
        int x = 0;
        int z = 0;
        int a = key;
        int lengthAlpha = strlen(alphabet1);
        char alphabet2[lengthAlpha];
        int array[lengthAlpha];
        int inOrOut = 1;
        for (unsigned int i = 0; i < length; i++) {
            input[i] = [string characterAtIndex:i];
        }
        for (int b=0; b<[encrypt length];b++) {
            if (input[b] == '\n') {
                input[b] = ' ';
            }
        }
        x=0;
        printf("[%d]", a);
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
        string = [NSString stringWithCharacters:output length:length];
        passed++;
    }
    
    //Decrypt
    while (passed < passes + 1 && choice == 1) {
        char *alphabet1 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .?!:;'<>1234567890,/";
        int i = 0;
        int s = 0;
        int x = 0;
        int z = 0;
        int a = key;
        int lengthAlpha = strlen(alphabet1);
        char alphabet2[lengthAlpha];
        int array[lengthAlpha];
        int inOrOut = 2;
        NSUInteger length = [encrypt length];
        unichar input[length];
        unichar output[length];
        for (unsigned int i = 0; i < length; i++) {
            input[i] = [string characterAtIndex:i];
        }
        x=0;
        printf("[%d]", a);
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
        //        while (input[i] != '\0' && inOrOut == 1) {
        //            while (TRUE) {
        //                if (input[i] == alphabet1[s]) {
        //                    //sets the origanal letter to be the encrypted letter
        //                    output[i] = alphabet2[s];
        //                    break;
        //                } else if (alphabet1[s] == '\0') {
        //                    //if an unknown character is inputted, it will use this: _
        //                    output[i] = '-';
        //                    break;
        //                }
        //                s++;
        //            }
        //            i++;
        //            s=0;
        //        }
        while (input[i] != '\0' && inOrOut == 2) {
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
    
    
    
    label = string;
    NSLog(@"%@ : %@", string, label);
    
    
    [self performSegueWithIdentifier:@"Go" sender:self];
}

-(IBAction)paster:(id)sender{
    encryptTextVeiw.text = [UIPasteboard generalPasteboard].string;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
