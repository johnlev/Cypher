//
//  ViewControllerNew.h
//  Cypher1
//
//  Created by John Kotz on 3/28/13.
//  Copyright (c) 2013 Kotz Productions. All rights reserved.
//

#import "InputViewController.h"
#import <UIKit/UIKit.h>

@interface  MainInputViewController : InputViewController{
    NSString *label;
}

@property (nonatomic,retain) IBOutlet UITextView *encryptTextVeiw;
@property int *data;
-(IBAction)clicked:(id)sender;
-(IBAction)paster:(id)sender;
-(IBAction)clear:(id)sender;
-(IBAction)gotoSettings:(id)sender;

@end
