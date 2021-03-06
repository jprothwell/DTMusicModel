//
//  DTMusicModelAppDelegate.m
//  DTMusicModel
//
//  Created by Daniel Tull on 31.08.2009.
//  Copyright Daniel Tull 2009. All rights reserved.
//

#import "DTMusicModelAppDelegate.h"
#import "DTMenuViewController.h"
#import "DTUpdatingViewController.h"
#import "DTMusicModelController.h"

@implementation DTMusicModelAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(musicModelWillBeginUpdating:) name:DTMusicModelWillBeginUpdatingNotification object:nil];
	
	DTMenuViewController *menuVC = [[DTMenuViewController alloc] init];
	
	navController = [[UINavigationController alloc] initWithRootViewController:menuVC];
	
	[menuVC release];
	
	[window addSubview:navController.view];
	
    [window makeKeyAndVisible];
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
    [window release];
    [super dealloc];
}

#pragma mark DTMusicModelController Notifications

- (void)musicModelWillBeginUpdating:(NSNotification *)notification {	
	DTUpdatingViewController *uvc = [[DTUpdatingViewController alloc] init];
	uvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	[navController presentModalViewController:uvc animated:YES];
	[uvc release];
}

@end
