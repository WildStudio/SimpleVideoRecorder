//
//  FileManager.h
//  SimpleVideoRecorder
//
//  Created by Alma IT on 28/10/15.
//  Copyright (c) 2015 Alma IT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

- (NSURL *) tempFileURL;
- (void) removeFile:(NSURL *)outputFileURL;
- (void) copyFileToDocuments:(NSURL *)fileURL;
- (void) copyFileToCameraRoll:(NSURL *)fileURL;

@end
