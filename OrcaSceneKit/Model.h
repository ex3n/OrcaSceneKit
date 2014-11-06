//
//  model.h
//  OrcaSceneKit
//
//  Created by joel hansen on 11/5/14.
//  Copyright (c) 2014 OrcaHealth. All rights reserved.
//

#import <SceneKit/SceneKit.h>


@interface Model : SCNNode

@property (nonatomic) SCNNode *rootNode;

@property (nonatomic) NSString *modelName;
@property (nonatomic) SCNScene *modelScene;
@property (nonatomic) SCNSceneSource *sceneSource;

- (CAAnimation *) loadAnimations:(NSString*)name;

-(void) loadModels:(NSString *)name;

- (void)activateAnimationByName:(NSString *)name;



@end
