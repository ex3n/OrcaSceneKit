//
//  SceneViewController.m
//  OrcaSceneKit
//
//  Created by Gary Robinson on 11/4/14.
//  Copyright (c) 2014 OrcaHealth. All rights reserved.
//

#import "SceneViewController.h"

@interface SceneViewController ()

@end

@implementation SceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sceneView.backgroundColor = [UIColor blueColor];
    
    // set the scene to the view
    self.sceneView.scene = self.model.modelScene;
    self.sceneView.allowsCameraControl = NO;
    self.sceneView.showsStatistics = YES;
    self.sceneView.allowsCameraControl = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setModel:(Model *)model
{
    _model = model;
    
    // create a new scene
    self.scene = [SCNScene scene];
    
    
    // create and add a camera to the scene
    SCNNode *cameraNode = [SCNNode node];
    cameraNode.camera = [SCNCamera camera];
    [self.scene.rootNode addChildNode:cameraNode];
    
    // place the camera
    cameraNode.position = SCNVector3Make(0, 0, 100);
    cameraNode.camera.zFar = 800;
    
    
    
//    // create and add a light to the scene
//    SCNNode *lightNode = [SCNNode node];
//    lightNode.light = [SCNLight light];
//    lightNode.light.type = SCNLightTypeOmni;
//    lightNode.position = SCNVector3Make(0, 10, 10);
//    [self.scene.rootNode addChildNode:lightNode];
//    
//    // create and add an ambient light to the scene
//    SCNNode *ambientLightNode = [SCNNode node];
//    ambientLightNode.light = [SCNLight light];
//    ambientLightNode.light.type = SCNLightTypeAmbient;
//    ambientLightNode.light.color = [UIColor darkGrayColor];
//    [self.scene.rootNode addChildNode:ambientLightNode];
    
    [self.scene.rootNode addChildNode:model.modelScene.rootNode];
    
    [self setCameraToBoundingSphere:model.modelScene.rootNode cameraNode:cameraNode];

    
    if(self.sceneView)
        self.sceneView.scene = model.modelScene;

}


-(void) setCameraToBoundingSphere:(SCNNode *)modelNode cameraNode:(SCNNode*)cameraNode;
{
    SCNVector3 center;
    CGFloat radius;
    [modelNode getBoundingSphereCenter:&center radius:&radius];
    CGFloat zval = center.z + 2*radius;
    center.z = zval;
    cameraNode.position = center;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
