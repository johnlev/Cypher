//
//  OutputViewController.h
//  Cypher
//
//  Created by John Kotz on 3/29/13.
//  Copyright (c) 2013 Kotz Productions. All rights reserved.
//

#import "MainInputViewController.h"
#import <UIKit/UIKit.h>

@interface OutputViewController : MainInputViewController


@property (nonatomic,retain) IBOutlet UITextView *labelTextView;
-(IBAction)copyButton:(id)sender;
-(IBAction)showActionsheetButton:(id)sender;
-(IBAction)showText:(id)sender;

@end
