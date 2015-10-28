//
//  ViewController.m
//  SimpleVideoRecorder
//
//  Created by Alma IT on 28/10/15.
//  Copyright (c) 2015 Alma IT. All rights reserved.
//

#import "ViewController.h"
#import "ImagePickerManager.h"

@interface ViewController ()

@property (nonatomic, strong) ImagePickerManager *imagePickerMgr;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(IBAction)recordAndPlay:(id)sender {
	NSLog(@"Button Pressed");
	self.imagePickerMgr = [[ImagePickerManager alloc] init];
	[self presentViewController:[_imagePickerMgr cameraViewController] animated:YES completion:nil];
}

@end
