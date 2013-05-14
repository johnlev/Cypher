//
//  InputViewController.h
//  Cypher1
//
//  Created by John Kotz on 3/28/13.
//  Copyright (c) 2013 Kotz Productions. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface InputViewController : UIViewController{
}

@property (nonatomic,retain,readwrite) NSArray *data;
@property int myInt;
@property (nonatomic,retain) IBOutlet UISegmentedControl *passesSegmented;
@property (nonatomic,retain) IBOutlet UISegmentedControl *choiceSegmented;
@property (nonatomic,retain) IBOutlet UITextField *keyTextFeild;


@end
