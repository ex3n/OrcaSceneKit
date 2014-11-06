//
//  SceneViewController.h
//  OrcaSceneKit
//
//  Created by Gary Robinson on 11/4/14.
//  Copyright (c) 2014 OrcaHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import "Model.h"

@interface SceneViewController : UIViewController

@property (strong, nonatomic) IBOutlet SCNView *sceneView;

@property (strong, nonatomic) Model *model;

@property (nonatomic) SCNScene *scene;

-(void) setCameraToBoundingSphere:(SCNNode *)modelNode cameraNode:(SCNNode *) cameraNode;

@end
