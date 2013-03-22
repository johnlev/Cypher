//
//  ViewController.m
//  new
//
//  Created by John Kotz on 3/20/13.
//  Copyright (c) 2013 Kotz Productions. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MessageUI.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize button,label,encrypt,key,choice,clear;
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)paster:(id)sender{
    encrypt.text = [UIPasteboard generalPasteboard].string;
}
-(IBAction)clear:(id)sender{
    encrypt.text = NULL;
}
-(IBAction)copyr:(id)sender{
    [UIPasteboard generalPasteboard].string = label.text;
}
-(IBAction)clicked:(id)sender{
    [self.view endEditing:YES];
    if (choice.selectedSegmentIndex == 0) {
        char *alphabet1 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .?!:;'<>1234567890,/";
        int i = 0;
        int s = 0;
        int x = 0;
        int z = 0;
        int a = [key.text intValue];
        int lengthAlpha = strlen(alphabet1);
        char alphabet2[lengthAlpha];
        int array[lengthAlpha];
        int inOrOut = 1;
        NSUInteger length = [encrypt.text length];
        unichar input[length];
        unichar output[length];
        for (unsigned int i = 0; i < length; i++) {
            input[i] = [encrypt.text characterAtIndex:i];
        }
        x=0;
        printf("%d", a);
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
        NSString* string = [NSString stringWithCharacters:output length:length];
        label.text = string;
    }else if (choice.selectedSegmentIndex == 1){
        char *alphabet1 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .?!:;'<>1234567890,/";
        int i = 0;
        int s = 0;
        int x = 0;
        int z = 0;
        int a = [key.text intValue];
        int lengthAlpha = strlen(alphabet1);
        char alphabet2[lengthAlpha];
        int array[lengthAlpha];
        int inOrOut = 2;
        NSUInteger length = [encrypt.text length];
        unichar input[length];
        unichar output[length];
        for (unsigned int i = 0; i < length; i++) {
            input[i] = [encrypt.text characterAtIndex:i];
        }
        x=0;
        printf("%d", a);
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
        NSString* string = [NSString stringWithCharacters:output length:length];
        label.text = string;
    }
    
}
- (IBAction)showActionsheetButton:(id)sender{
    NSArray *activityItems = @[label.text];
    NSArray *applicationItems = [[NSArray alloc] initWithObjects:/*UIActivityTypePostToFacebook, UIActivityTypePostToTwitter, UIActivityTypePostToWeibo, UIActivityTypeMessage, UIActivityTypeMail, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, */nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:applicationItems];
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact];
    [self presentViewController:activityViewController animated:YES completion:NULL];
}

//- (IBAction)showActionsheetButton:(id)sender{
//    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Email This Message", @"Text Message"/*,@"Share this app"*/, nil];
//    [actionSheet showInView:self.view];
//}
//-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex == 0)
//    {
//        if ([MFMailComposeViewController canSendMail]) {
//            MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
//            controller.mailComposeDelegate = self;
//            [controller setSubject:@"My message"];
//            [controller setMessageBody:[NSString stringWithFormat:@"%@", label.text] isHTML:NO];
//            if (controller) [self presentModalViewController:controller animated:YES];
//        } else {
//            // Handle the error
//        }
//    }
//    
//    if(buttonIndex == 1)
//    {
//        NSArray *activityItems = @[@"Hello",[UIImage imageNamed:@"someimage"]];
//        UIActivityViewController *activityVeiwController = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
//        activityVeiwController.excludedActivityTypes = @[UIActivityTypeMessage,UIActivityTypePostToFacebook,UIActivityTypePrint ];
//        [self presentViewController:activityVeiwController animated:YES completion:NULL];
//    }
//    if(buttonIndex == 2){
//        if ([MFMailComposeViewController canSendMail]) {
//            MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
//            controller.mailComposeDelegate = self;
//            [controller setSubject:@"Check out this app!"];
//            [controller setMessageBody:@"Check out this app Cypher!\n" isHTML:NO];
//            if (controller) [self presentModalViewController:controller animated:YES];
//        } else {
//            // Handle the error
//        }
//    }
//     
//}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    key.text = NULL;
    encrypt.text = NULL;
    label.text = NULL;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    key.text = NULL;
    encrypt.text = NULL;
    label.text = NULL;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
