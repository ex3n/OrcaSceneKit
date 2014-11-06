//
//  ModelsViewController.m
//  OrcaSceneKit
//
//  Created by Gary Robinson on 11/4/14.
//  Copyright (c) 2014 OrcaHealth. All rights reserved.
//

#import "ModelsViewController.h"
#import "SceneViewController.h"
#import "Model.h"

@interface ModelsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *models;
@property (nonatomic) NSString *pickedModel;

@end

@implementation ModelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.models = [NSArray arrayWithObjects:@"Heart", @"Shoulder", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *modelCellID = @"ModelCellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:modelCellID];
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:modelCellID];
    
    cell.textLabel.text = self.models[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"selected row %ld", indexPath.row);
    
    self.pickedModel = self.models[indexPath.row];
    [self performSegueWithIdentifier:@"sceneKit" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SceneViewController *sceneVC = (SceneViewController *)([segue destinationViewController]);
    sceneVC.title = self.pickedModel;
    Model *model = [[Model alloc]init];
    model.modelName = self.pickedModel;
    sceneVC.model = model;
    
    
}

@end
