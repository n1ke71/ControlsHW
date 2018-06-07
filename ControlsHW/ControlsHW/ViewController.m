//
//  ViewController.m
//  ControlsHW
//
//  Created by Ivan Kozaderov on 14.05.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UISwitch *rotationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *translationSwitch;
@property (weak, nonatomic) IBOutlet UISlider *valueSlider;



- (IBAction)actionPictureControl:(UISegmentedControl *)sender;

- (IBAction)actionValueSlider:(UISlider *)sender;

- (IBAction)actionRotationSwitch:(UISwitch *)sender;

- (IBAction)actionScaleSwitch:(UISwitch *)sender;

- (IBAction)actionTranslationSwitch:(UISwitch *)sender;

@property (assign, nonatomic) CGPoint startPoint;
@property (assign, nonatomic) CGAffineTransform transform;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.startPoint = self.testView.center;
    self.transform  = self.testView.transform;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)actionPictureControl:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.testView.backgroundColor = [UIColor redColor];
            break;
        case 1:
            self.testView.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            self.testView.backgroundColor = [UIColor blueColor];
            break;
        default:
            self.testView.backgroundColor = [UIColor redColor];
            break;
    }
    
    
}

- (IBAction)actionValueSlider:(UISlider *)sender {
    
    
    
}

- (IBAction)actionRotationSwitch:(UISwitch *)sender {
    
    
    [self animateView:self.testView withTransformType:[self transformType]];
    
    
}

- (IBAction)actionScaleSwitch:(UISwitch *)sender {
    
    [self animateView:self.testView withTransformType:[self transformType]];
    
}

- (IBAction)actionTranslationSwitch:(UISwitch *)sender {
    
    [self animateView:self.testView withTransformType:[self transformType]];
}



-(void) animateView:(UIView*) view withTransformType:(TransformType) transformType{
    
    
    __block CGAffineTransform currentTransform = view.transform;
    
    if (transformType == TransformTypeRotation) {
        
        currentTransform = CGAffineTransformConcat(currentTransform,
                                                   CGAffineTransformMakeRotation(M_PI));
        
    }
    
    if (transformType == TransformTypeScale) {
        
        
        currentTransform = CGAffineTransformConcat(currentTransform,
                                                   CGAffineTransformMakeScale(1.2f, 1.2f));
        
    }
    
    if (transformType == TransformTypeTranslation) {
        
        currentTransform = CGAffineTransformConcat(currentTransform,
                                                   CGAffineTransformMakeTranslation(20, 0));
        
    }
    
    if (transformType == TransformTypeNone) {
        
        [view.layer removeAllAnimations];
        
    }
    
    [UIView animateWithDuration:(1.f / self.valueSlider.value)
                          delay:0.f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         view.transform = currentTransform;
                         
                     }
     
     
                     completion:^(BOOL finished) {
                         
                         
                         [self  animateView:self.testView withTransformType:[self transformType]];
                         
                         
                     }];
    
    
}

-(TransformType) transformType{
    
    
    TransformType currentType = TransformTypeNone;
    
    if (!(self.rotationSwitch.isOn && self.scaleSwitch.isOn && self.translationSwitch.isOn)) {
        
        currentType  = TransformTypeNone;
        self.testView.center    =  self.startPoint;
        self.testView.transform =  self.transform;
    }
    
    if ((self.rotationSwitch.isOn ) && (!self.scaleSwitch.isOn) && (!self.translationSwitch.isOn )) {
        
        currentType  = TransformTypeRotation;
        
    }
    if ((!self.rotationSwitch.isOn ) && (self.scaleSwitch.isOn) && (!self.translationSwitch.isOn )) {
        
        currentType  = TransformTypeScale;
        
    }
    
    if ((!self.rotationSwitch.isOn ) && (!self.scaleSwitch.isOn) && (self.translationSwitch.isOn )) {
        
        currentType  = TransformTypeTranslation;
        
    }
    
    if (self.rotationSwitch.isOn && self.scaleSwitch.isOn && self.translationSwitch.isOn) {
        
        currentType  = TransformTypeAll;
        
        
    }
    
    
    return currentType;
    
}


@end
