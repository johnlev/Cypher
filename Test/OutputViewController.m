//
//  OutputViewController.m
//  Cypher
//
//  Created by John Kotz on 3/29/13.
//  Copyright (c) 2013 Kotz Productions. All rights reserved.
//

#import "OutputViewController.h"

@interface OutputViewController ()

@end

@implementation OutputViewController
@synthesize labelTextView;

-(IBAction)showActionsheetButton:(id)sender{
    NSArray *activityItems = @[labelTextView.text];
    NSArray *applicationItems = [[NSArray alloc] initWithObjects:/*UIActivityTypePostToFacebook, UIActivityTypePostToTwitter, UIActivityTypePostToWeibo, UIActivityTypeMessage, UIActivityTypeMail, UIActivityTypePrint, UIActivityTypeCopyToPasteboard, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, */nil];
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:applicationItems];
    activityViewController.excludedActivityTypes = @[UIActivityTypePostToWeibo, UIActivityTypeAssignToContact, UIActivityTypeCopyToPasteboard];
    [self presentViewController:activityViewController animated:YES completion:NULL];
}

-(IBAction)showText:(id)sender{
    labelTextView.text = label;
}

-(IBAction)backToSettings:(id)sender{
    [self dismissModalViewControllerAnimated:YES];;
}
-(IBAction)copyButton:(id)sender{
    [UIPasteboard generalPasteboard].string = labelTextView.text;
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
    labelTextView.text = label;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
