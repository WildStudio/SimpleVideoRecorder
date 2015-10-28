//
//  ViewController.h
//  SimpleVideoRecorder
//
//  Created by Alma IT on 28/10/15.
//  Copyright (c) 2015 Alma IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(IBAction)recordWithImagePicker:(id)sender;
-(IBAction)recorWithAVFoundation:(id)sender;
-(void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void*)contextInfo;

@end

