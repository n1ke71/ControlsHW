//
//  ViewController.h
//  ControlsHW
//
//  Created by Ivan Kozaderov on 14.05.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    TransformTypeRotation       = 1,
    TransformTypeScale          = 2,
    TransformTypeTranslation    = 3,
    TransformTypeAll            = 4,
    TransformTypeNone           = 0
    
}TransformType;

@interface ViewController : UIViewController
@property(assign,nonatomic) TransformType type;

@end

