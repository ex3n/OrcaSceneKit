//
//  model.m
//  OrcaSceneKit
//
//  Created by joel hansen on 11/5/14.
//  Copyright (c) 2014 OrcaHealth. All rights reserved.
//

#import "Model.h"

@implementation Model



- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    
    return self;
    
}

- (void)setModelName:(NSString *)modelName
{
    _modelName = modelName;
    
    [self loadModels:_modelName];
}

-(void) loadModels:(NSString *)name
{
    self.modelScene = [SCNScene sceneNamed:@"models.scnassets/shoulder_geo.dae" ];
    
 
}

- (SCNScene *)loadAnimations:(NSString *)name
{
    
    if(name == @"Shoulder")
    {
        SCNNode *cameraNode  = [SCNNode node];
        NSString *sceneName = @"shoulder_geo";
     
        NSURL *url = [[NSBundle mainBundle] URLForResource:sceneName withExtension:@"dae" subdirectory:@"models.scnassets"];
        
        self.sceneSource = [SCNSceneSource sceneSourceWithURL:url options:@{SCNSceneSourceConvertToYUpKey : @YES} ];
        
        self.modelScene = [SCNScene scene];
        
        //NSArray *cameraArray = [self.sceneSource identifiersOfEntriesWithClass:[SCNCamera class]];
        
//if (!cameraArray) {
//            SCNNode *cameraNode = [SCNNode node];
        
        
        
       // }
        
//        for (NSString * cameraName in cameraArray)
//            {
//                SCNCamera *foundCamera = [self.sceneSource entryWithIdentifier:cameraName withClass:[SCNCamera class]];
////                SCNNode *cameraNode  = [SCNNode node];
//                cameraNode.camera = foundCamera;
//                [self.modelScene.rootNode addChildNode:cameraNode];
//            }
        
       // NSArray *lightArray = [self.sceneSource  identifiersOfEntriesWithClass:[SCNLight class]];
        cameraNode.camera = [SCNCamera camera];
        
        
            SCNNode *lightNode = [SCNNode node];
            lightNode.light = [SCNLight light];
            lightNode.light.type = SCNLightTypeOmni;
            lightNode.position = SCNVector3Make(0, 10, 10);
            [cameraNode addChildNode:lightNode];
            
            // create and add an ambient light to the scene
            SCNNode *ambientLightNode = [SCNNode node];
            ambientLightNode.light = [SCNLight light];
            ambientLightNode.light.type = SCNLightTypeAmbient;
            ambientLightNode.light.color = [UIColor darkGrayColor];
            [cameraNode addChildNode:ambientLightNode];

        
        
//        for (NSString *lightName in lightArray) {
//            SCNLight *foundLight = [self.sceneSource entryWithIdentifier:lightName withClass:[SCNLight class]];
//            SCNNode *lightNode = [SCNNode node];
//            lightNode.light = foundLight;
//            [cameraNode addChildNode:lightNode];
        
//
//        }
        
        NSArray *geometryArray = [self.sceneSource identifiersOfEntriesWithClass:[SCNGeometry class]];
        SCNNode *nodeForAllGeometry = [SCNNode node];
        for (NSString *geoName in geometryArray) {
            SCNGeometry *foundGeometry = [self.sceneSource entryWithIdentifier:geoName withClass:[SCNGeometry class]];
            SCNNode *geoNode = [SCNNode node];
            geoNode.geometry = foundGeometry;
            [nodeForAllGeometry addChildNode:geoNode];
           
        }
        
        [self.modelScene.rootNode addChildNode:nodeForAllGeometry];
//        self.modelScene = [SCNScene sceneNamed:@"models.scnassets/shoulder_geo.dae"];
//        
//        self.rootNode = self.modelScene.rootNode;
//        
//        NSString *sceneName = @"shoulder_animated";
//        
//        NSURL *url = [[NSBundle mainBundle] URLForResource:sceneName withExtension:@"dae" subdirectory:@"models.scnassets"];
        
        //self.sceneSource = [SCNSceneSource sceneSourceWithURL:url options:@{SCNSceneSourceConvertToYUpKey : @YES} ];
        
    }
    else if (name == @"Heart")
    {
        self.modelScene = [SCNScene sceneNamed:@"models.scnassets/heart_geo.dae"];
        
        self.rootNode = self.modelScene.rootNode;
        
    }
    
    return self.modelScene;
}


@end