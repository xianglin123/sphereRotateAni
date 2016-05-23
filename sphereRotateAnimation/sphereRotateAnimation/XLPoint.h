//
//  XLSphereView.h
//  sphereRotateAnimation
//
//  Created by xianglin on 16/5/23.
//  Copyright © 2016年 xianglin. All rights reserved.
//

#ifndef sphereTagCloud_XLPoint_h
#define sphereTagCloud_XLPoint_h

struct XLPoint {
    CGFloat x;
    CGFloat y;
    CGFloat z;
};

typedef struct XLPoint XLPoint;


XLPoint XLPointMake(CGFloat x, CGFloat y, CGFloat z) {
    XLPoint point;
    point.x = x;
    point.y = y;
    point.z = z;
    return point;
}

#endif
