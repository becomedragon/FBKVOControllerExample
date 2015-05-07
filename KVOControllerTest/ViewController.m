//
//  ViewController.m
//  KVOControllerTest
//
//  Created by lawrence on 5/6/15.
//  Copyright (c) 2015 lawrence. All rights reserved.
//

#import "ViewController.h"
#import <KVOController/FBKVOController.h>
#import "DataModel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@property (nonatomic,strong) FBKVOController * kvoController;
@property (nonatomic,strong) DataModel * model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.kvoController = [FBKVOController controllerWithObserver:self];
    self.model = [[DataModel alloc] init];
    [self.kvoController observe:_model keyPath:@"colorString" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(ViewController * observer, id object, NSDictionary *change) {
        [observer changeBgColor];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textDidChange{
    self.model.colorString = self.colorTextField.text;
}



-(void)changeBgColor{
    if ([self.model.colorString isEqualToString:@"green"]) {
        self.view.backgroundColor = [UIColor greenColor];
    }
    else if ([self.model.colorString isEqualToString:@"red"])
    {
        self.view.backgroundColor = [UIColor redColor];
    }
    else if ([self.model.colorString isEqualToString:@"black"]){
        self.view.backgroundColor = [UIColor blackColor];
    }
    else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
}
@end
