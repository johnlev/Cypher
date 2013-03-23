//
//  ViewController.h
//  Test
//
//  Created by John Kotz on 3/21/13.
//  Copyright (c) 2013 Kotz Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,retain) IBOutlet UIButton *button;
@property (nonatomic,retain) IBOutlet UITextView *encrypt;
@property (nonatomic,retain) IBOutlet UITextView *label;
@property (nonatomic,retain) IBOutlet UITextField *key;
@property (nonatomic,retain) IBOutlet UISegmentedControl *choice;
@property (nonatomic,retain) IBOutlet UIButton *clear;
@property (nonatomic,retain) IBOutlet UISegmentedControl *passes;
-(IBAction)clicked:(id)sender;
-(IBAction)copyr:(id)sender;
-(IBAction)clear:(id)sender;
-(IBAction)paster:(id)sender;
-(IBAction)showActionsheetButton:(id)sender;
-(IBAction)hide:(id)sender;
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
-(IBAction)clearAndExit:(id)sender;
@end
