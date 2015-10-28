//
//  ImagePickerManager.m
//  SimpleVideoRecorder
//
//  Created by Alma IT on 28/10/15.
//  Copyright (c) 2015 Alma IT. All rights reserved.
//

#import "ImagePickerManager.h"

#import <MobileCoreServices/UTCoreTypes.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ImagePickerManager () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *camera;

@end

@implementation ImagePickerManager

- (instancetype)init
{
	self = [super init];
	if(self){
		_camera = [self setupImagePicker];
	}
	return self;
}

- (UIImagePickerController *)cameraViewController
{
	return _camera;
}

#pragma mark - Private methods

- (UIImagePickerController *)setupImagePicker
{
	UIImagePickerController *camera;
	if([self isVideoRecordingAvailable]){
		camera = [[UIImagePickerController alloc] init];
		camera.sourceType = UIImagePickerControllerSourceTypeCamera;
		camera.mediaTypes = @[(NSString *)kUTTypeMovie];
		camera.delegate = self;
	}
	return camera;
}

- (BOOL)isVideoRecordingAvailable
{
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
		NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
		if([availableMediaTypes containsObject:(NSString *)kUTTypeMovie]){
			return YES;
		}
	}
	return NO;
}

- (void)configureCustomUIOnImagePicker:(UIImagePickerController *)picker
{
	UIView *cameraOverlay = [[UIView alloc] init];
	picker.showsCameraControls = YES;
	picker.cameraOverlayView = cameraOverlay;
}

#pragma mark - UIImagePickerControllerDelegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)data
{
	ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
	NSURL *recordedVideoURL = [data objectForKey:UIImagePickerControllerMediaURL];
	if ([library videoAtPathIsCompatibleWithSavedPhotosAlbum:recordedVideoURL]) {
		[library writeVideoAtPathToSavedPhotosAlbum:recordedVideoURL
																completionBlock:^(NSURL *assetURL, NSError *error){}
		 ];
	}
	
	[picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
	[picker dismissViewControllerAnimated:YES completion:nil];
}


@end