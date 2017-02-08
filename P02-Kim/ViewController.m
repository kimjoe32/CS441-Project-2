//
//  ViewController.m
//  P02-Kim
//
//  Created by ETS Admin on 1/27/17.
//  Copyright © 2017 Joe. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@end

//note to self pastel brown = 836953
@implementation ViewController
- (void)viewDidLoad {
    //load the grid/board of the game
    NSArray *imageNames = @[@"red.png", @"orange.png", @"yellow.png", @"green.png",
                            @"blue.png", @"light_blue.png", @"purple.png"];
    //declare array
    NSMutableArray *images = [[NSMutableArray alloc] init];
    
    //fill array
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    _boardImage.animationImages = images;
    _boardImage.animationDuration = 10;
    
    [self.view addSubview:_boardImage];
    [_boardImage startAnimating];
    
    [self createRandomSquares];
}

//makes a 2 square at the location of img
- (void) make2or4:(UIImageView*) img secondArg:(int*) numOfAddedSqrs{
    int i = (arc4random() %5);
    if (i>0)
        [img setImage:[UIImage imageNamed:@"2.png"]];
    else
        [img setImage:[UIImage imageNamed:@"4.png"]];
    
    img.alpha=1;
    (*numOfAddedSqrs)--;
}

//called to make sure there are freesquares to add new 2's
- (BOOL) freeSquares{
    if (_view11.alpha == 0 ||_view12.alpha == 0 ||_view13.alpha == 0 ||_view14.alpha == 0
        ||_view21.alpha == 0 ||_view22.alpha == 0 ||_view23.alpha == 0 ||_view24.alpha == 0
        ||_view31.alpha == 0 ||_view32.alpha == 0 ||_view33.alpha == 0 ||_view34.alpha == 0
        ||_view41.alpha == 0 ||_view42.alpha == 0 ||_view43.alpha == 0 ||_view44.alpha == 0)
        return true;
    return false;
}

- (void) createRandomSquares {
    int numberOfAddedSquares = (arc4random() % 2)+1;// include 1-3 squares
    while (numberOfAddedSquares > 0 && [self freeSquares]) {
        switch ((arc4random() %16)) {
            case 0:
                if (_view11.alpha==0)
                    [self make2or4:_view11 secondArg:&numberOfAddedSquares];
            case 1:
                if (_view12.alpha==0)
                    [self make2or4:_view12 secondArg:&numberOfAddedSquares];
                break;
            case 2:
                if (_view13.alpha==0)
                    [self make2or4:_view13 secondArg:&numberOfAddedSquares];
                break;
            case 3:
                if (_view14.alpha==0)
                    [self make2or4:_view14 secondArg:&numberOfAddedSquares];
                break;
            case 4:
                if (_view21.alpha==0)
                    [self make2or4:_view21 secondArg:&numberOfAddedSquares];
                break;
            case 5:
                if (_view22.alpha==0)
                    [self make2or4:_view22 secondArg:&numberOfAddedSquares];
                break;
                
            case 6:
                if (_view23.alpha==0)
                    [self make2or4:_view23 secondArg:&numberOfAddedSquares];
                break;
            case 7:
                if (_view24.alpha==0)
                    [self make2or4:_view24 secondArg:&numberOfAddedSquares];
                break;
            case 8:
                if (_view31.alpha==0)
                    [self make2or4:_view31 secondArg:&numberOfAddedSquares];
                break;
            case 9:
                if (_view32.alpha==0)
                    [self make2or4:_view32 secondArg:&numberOfAddedSquares];
                break;
            case 10:
                if (_view33.alpha==0)
                    [self make2or4:_view33 secondArg:&numberOfAddedSquares];
                break;
            case 11:
                if (_view34.alpha==0)
                    [self make2or4:_view34 secondArg:&numberOfAddedSquares];
                break;
            case 12:
                if (_view41.alpha==0)
                    [self make2or4:_view41 secondArg:&numberOfAddedSquares];
                break;
            case 13:
                if (_view42.alpha==0)
                    [self make2or4:_view42 secondArg:&numberOfAddedSquares];
                break;
            case 14:
                if (_view43.alpha==0)
                    [self make2or4:_view43 secondArg:&numberOfAddedSquares];
                break;
            case 15:
                if (_view44.alpha==0)
                    [self make2or4:_view44 secondArg:&numberOfAddedSquares];
                break;
        }
    }
}

- (BOOL)image:(UIImage *)image1 isEqualTo:(UIImage *)image2
{
    NSData *data1 = UIImagePNGRepresentation(image1);
    NSData *data2 = UIImagePNGRepresentation(image2);
    
    return [data1 isEqual:data2];
}

- (void) incrementImage:(UIImageView*) imageViewToChange {
    
    UIImage *image = [UIImage imageNamed:@"2.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"4.png"];
        return;
    }
    image = [UIImage imageNamed:@"4.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"8.png"];
        return;
    }
    image = [UIImage imageNamed:@"8.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"16.png"];
        return;
    }
    image = [UIImage imageNamed:@"16.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"32.png"];
        return;
    }
    image = [UIImage imageNamed:@"32.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"64.png"];
        return;
    }
    image = [UIImage imageNamed:@"64.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"128.png"];
        return;
    }
    image = [UIImage imageNamed:@"128.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"256.png"];
        return;
    }
    image = [UIImage imageNamed:@"256.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"512.png"];
        return;
    }
    image = [UIImage imageNamed:@"512.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"1024.png"];
        return;
    }
    image = [UIImage imageNamed:@"1024.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"2048.png"];
        return;
    }
    image = [UIImage imageNamed:@"2048.png"];
    if ([self image:imageViewToChange.image isEqualTo:image]) {
        imageViewToChange.image = [UIImage imageNamed:@"4096.png"];
        return;
    }
}

- (void) combineViewsAndIncrement:(UIImageView*) baseView otherView:(UIImageView*) changingView{
    [self incrementImage:baseView];
    changingView.alpha=0;
}

- (void) updateBaseView:(UIImageView*) baseView otherView:(UIImageView*) changingView{
    baseView.alpha = 1;
    baseView.image = changingView.image;
    changingView.alpha = 0;
}

- (BOOL) isEnabledandEqualTo:(UIImageView*) baseView otherView:(UIImageView*) changingView{
    return (changingView.alpha == 1 && [self image:baseView.image isEqualTo:changingView.image]);
}
- (IBAction)restartButtonHandler:(id)sender {
    //reenable swiping
    _rightSwipe.enabled=1;
    _leftSwipe.enabled=1;
    _downSwipe.enabled=1;
    _upSwipe.enabled=1;
    
    //clear board
    _view11.alpha=0; _view12.alpha=0; _view13.alpha=0; _view14.alpha=0;
    _view21.alpha=0; _view22.alpha=0; _view23.alpha=0; _view24.alpha=0;
    _view31.alpha=0; _view32.alpha=0; _view33.alpha=0; _view34.alpha=0;
    _view41.alpha=0; _view42.alpha=0; _view43.alpha=0; _view44.alpha=0;
    
    [_view11 setImage:[UIImage imageNamed:@"2.png"]];
    [_view12 setImage:[UIImage imageNamed:@"2.png"]];
    [_view13 setImage:[UIImage imageNamed:@"2.png"]];
    [_view14 setImage:[UIImage imageNamed:@"2.png"]];
    [_view21 setImage:[UIImage imageNamed:@"2.png"]];
    [_view22 setImage:[UIImage imageNamed:@"2.png"]];
    [_view23 setImage:[UIImage imageNamed:@"2.png"]];
    [_view24 setImage:[UIImage imageNamed:@"2.png"]];
    [_view31 setImage:[UIImage imageNamed:@"2.png"]];
    [_view32 setImage:[UIImage imageNamed:@"2.png"]];
    [_view33 setImage:[UIImage imageNamed:@"2.png"]];
    [_view34 setImage:[UIImage imageNamed:@"2.png"]];
    [_view41 setImage:[UIImage imageNamed:@"2.png"]];
    [_view42 setImage:[UIImage imageNamed:@"2.png"]];
    [_view43 setImage:[UIImage imageNamed:@"2.png"]];
    [_view44 setImage:[UIImage imageNamed:@"2.png"]];
    
    //disable gameover and restart button
    _gameOverView.hidden=1;
    _RestartButton.hidden=1;
    _RestartButton.enabled=0;
    
    [self createRandomSquares];
}

- (void) createResetDialog {
    //show game over and restart button
    NSLog(@"Game Over...resetting");
    [self.view bringSubviewToFront:_gameOverView];
    _gameOverView.hidden=0;
    _RestartButton.hidden=0;
    _RestartButton.enabled=1;
    [self.view bringSubviewToFront:_RestartButton];
    
    //disable swipes just in case
    _rightSwipe.enabled=0;
    _leftSwipe.enabled=0;
    _downSwipe.enabled=0;
    _upSwipe.enabled=0;
}
- (void) checkIfNoMoreMoves {
    //are all boxes enabled?
    if(_view11.alpha==1 && _view12.alpha==1 &&_view13.alpha==1 &&_view14.alpha==1 &&
       _view21.alpha==1 && _view22.alpha==1 && _view23.alpha==1 && _view24.alpha==1 &&
       _view31.alpha==1 && _view32.alpha==1 && _view33.alpha==1 && _view34.alpha==1 &&
       _view41.alpha==1 && _view42.alpha==1 && _view43.alpha==1 && _view44.alpha==1 )
    {
        //if image vertically/horizontally adjacent is the same, then more moves can be done and we return
        //checking row 1
        if([self image:_view11.image isEqualTo:_view21.image] ||
           [self image:_view11.image isEqualTo:_view12.image])
            return;
        if([self image:_view12.image isEqualTo:_view13.image] ||
           [self image:_view12.image isEqualTo:_view22.image])
            return;
        if([self image:_view13.image isEqualTo:_view14.image] ||
           [self image:_view13.image isEqualTo:_view23.image])
            return;
        if([self image:_view14.image isEqualTo:_view24.image])
            return;
        
        //checking row 2
        if([self image:_view21.image isEqualTo:_view22.image] ||
           [self image:_view21.image isEqualTo:_view31.image])
            return;
        if([self image:_view22.image isEqualTo:_view23.image] ||
           [self image:_view22.image isEqualTo:_view32.image])
            return;
        if([self image:_view23.image isEqualTo:_view24.image] ||
           [self image:_view23.image isEqualTo:_view33.image])
            return;
        if([self image:_view24.image isEqualTo:_view34.image])
            return;
        
        //checking row 3
        if([self image:_view31.image isEqualTo:_view32.image] ||
           [self image:_view31.image isEqualTo:_view41.image])
            return;
        if([self image:_view32.image isEqualTo:_view33.image] ||
           [self image:_view32.image isEqualTo:_view42.image])
            return;
        if([self image:_view33.image isEqualTo:_view34.image] ||
           [self image:_view33.image isEqualTo:_view43.image])
            return;
        if([self image:_view34.image isEqualTo:_view44.image])
            return;
        
        //checking row 4
        if([self image:_view41.image isEqualTo:_view42.image])
            return;
        if([self image:_view42.image isEqualTo:_view43.image])
            return;
        if([self image:_view43.image isEqualTo:_view44.image])
            return;
        
        //if we haven't returned by now, there are no more moves to be done - game over
        [self performSelector:@selector(createResetDialog) withObject:nil afterDelay:.75];
    }
}

- (IBAction)leftSwipeHandler:(id)sender {
    int nothingHappened = 0;//at end, if no tiles changed, this will prevent spawning new tiles
    NSLog(@"Left Swipe");
    //update column 1 (leftmost column)
    if (_view11.alpha == 1) {
        if ([self isEnabledandEqualTo:_view11 otherView:_view12]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view11 otherView:_view12];
        }
        else if ([self isEnabledandEqualTo:_view11 otherView:_view13] && _view12.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view11 otherView:_view13];
        }
        else if ([self isEnabledandEqualTo:_view11 otherView:_view14] && _view12.alpha == 0 && _view13.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view11 otherView:_view14];
        }
    }
    else {
        if (_view12.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view11 otherView:_view12];
        }
        else if (_view13.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view11 otherView:_view13];
        }
        else if (_view14.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view11 otherView:_view14];
        }
    }
    if (_view21.alpha == 1){
        if ([self isEnabledandEqualTo:_view21 otherView:_view22]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view21 otherView:_view22];
        }
        else if ([self isEnabledandEqualTo:_view21 otherView:_view23] && _view22.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view21 otherView:_view23];
        }
        else if ([self isEnabledandEqualTo:_view21 otherView:_view24] && _view22.alpha == 0 && _view23.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view21 otherView:_view24];
        }
    }
    else {
        if (_view22.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view21 otherView:_view22];
        }
        else  if (_view23.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view21 otherView:_view23];
        }
        else if (_view24.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view21 otherView:_view24];
        }
    }
    if (_view31.alpha == 1){
        if ([self isEnabledandEqualTo:_view31 otherView:_view32]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view31 otherView:_view32];
        }
        else if ([self isEnabledandEqualTo:_view31 otherView:_view33] && _view32.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view31 otherView:_view33];
        }
        else if ([self isEnabledandEqualTo:_view31 otherView:_view34] && _view32.alpha == 0 && _view33.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view31 otherView:_view34];
        }
    }
    else {
        if (_view32.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view31 otherView:_view32];
        }
        else if (_view33.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view31 otherView:_view33];
        }
        else if (_view34.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view31 otherView:_view34];
        }
    }
    if (_view41.alpha == 1){
        if ([self isEnabledandEqualTo:_view41 otherView:_view42]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view41 otherView:_view42];
        }
        else if ([self isEnabledandEqualTo:_view41 otherView:_view43] && _view42.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view41 otherView:_view43];
        }
        else if ([self isEnabledandEqualTo:_view41 otherView:_view44] && _view42.alpha == 0 && _view43.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view41 otherView:_view44];
        }
    }
    else {
        if (_view42.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view41 otherView:_view42];
        }
        else if (_view43.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view41 otherView:_view43];
        }
        else if (_view44.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view41 otherView:_view44];
        }
    }
    
    /******************************************************
     UPDATE ROW 2
     *******************************************************/
    if (_view12.alpha == 1) {
        if ([self isEnabledandEqualTo:_view12 otherView:_view13]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view12 otherView:_view13];
        }
        else if ([self isEnabledandEqualTo:_view12 otherView:_view14] && _view13.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view12 otherView:_view14];
        }
    }
    else {
        if (_view13.alpha == 1){
            if ([self isEnabledandEqualTo:_view13 otherView:_view14])
                [self combineViewsAndIncrement:_view13 otherView:_view14];
            nothingHappened = 1;
            [self updateBaseView:_view12 otherView:_view13];
        }
        else if (_view14.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view12 otherView:_view14];
        }
    }
    
    if (_view22.alpha == 1){
        if ([self isEnabledandEqualTo:_view22 otherView:_view23]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view22 otherView:_view23];
        }
        else if ([self isEnabledandEqualTo:_view22 otherView:_view24] && _view23.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view22 otherView:_view24];
        }
    }
    else {
        if (_view23.alpha == 1){
            if ([self isEnabledandEqualTo:_view23 otherView:_view24])
                [self combineViewsAndIncrement:_view23 otherView:_view24];
            nothingHappened = 1;
            [self updateBaseView:_view22 otherView:_view23];
        }
        else if (_view24.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view22 otherView:_view24];
        }
    }
    
    if (_view32.alpha == 1){
        if ([self isEnabledandEqualTo:_view32 otherView:_view33]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view32 otherView:_view33];
        }
        else if ([self isEnabledandEqualTo:_view32 otherView:_view34] && _view33.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view32 otherView:_view34];
        }
    }
    else {
        if (_view33.alpha == 1) {
            if ([self isEnabledandEqualTo:_view33 otherView:_view34])
                [self combineViewsAndIncrement:_view33 otherView:_view34];
            nothingHappened = 1;
            [self updateBaseView:_view32 otherView:_view33];
        }
        else if (_view34.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view32 otherView:_view34];
        }
    }
    
    if (_view42.alpha == 1){
        if ([self isEnabledandEqualTo:_view42 otherView:_view43]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view42 otherView:_view43];
        }
        else if ([self isEnabledandEqualTo:_view42 otherView:_view44] && _view43.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view42 otherView:_view44];
        }
    }
    else {
        if (_view43.alpha == 1){
            if ([self isEnabledandEqualTo:_view43 otherView:_view44])
                [self combineViewsAndIncrement:_view43 otherView:_view44];
            nothingHappened=1;
            [self updateBaseView:_view42 otherView:_view43];
        }
        else if (_view44.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view42 otherView:_view44];
        }
    }
    
    /******************************************************
     UPDATE COLUMN 3
     *******************************************************/
    
    if (_view13.alpha == 1) {
        if ([self isEnabledandEqualTo:_view13 otherView:_view14]){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view13 otherView:_view14];
        }
    }
    else {
        if (_view14.alpha == 1){
            nothingHappened =1;
            [self updateBaseView:_view13 otherView:_view14];
        }
    }
    //*******************************************************
    
    if (_view23.alpha == 1){
        if ([self isEnabledandEqualTo:_view23 otherView:_view24]){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view23 otherView:_view24];
        }
    }
    else {
        if (_view24.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view23 otherView:_view24];
        }
    }
    
    //*******************************************************
    if (_view33.alpha == 1){
        if ([self isEnabledandEqualTo:_view33 otherView:_view34]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view33 otherView:_view34];
        }
    }
    else {
        if (_view34.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view33 otherView:_view34];
        }
    }
    
    //*******************************************************
    if (_view43.alpha == 1){
        if ([self isEnabledandEqualTo:_view43 otherView:_view44]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view43 otherView:_view44];
        }
    }
    else {
        if (_view44.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view43 otherView:_view44];
        }
    }

    if(nothingHappened)
        [self createRandomSquares];
    [self checkIfNoMoreMoves];
}

- (IBAction)upSwipeHandler:(id)sender {
    NSLog(@"Up Swipe");
    int nothingHappened=0;
    //update row 1
    if (_view11.alpha == 1) {
        if ([self isEnabledandEqualTo:_view11 otherView:_view21]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view11 otherView:_view21];
        }
        else if ([self isEnabledandEqualTo:_view11 otherView:_view31] && _view21.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view11 otherView:_view31];
        }
        else if ([self isEnabledandEqualTo:_view11 otherView:_view41] && _view21.alpha == 0 && _view31.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view11 otherView:_view41];
        }
    }
    else {
        if (_view21.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view11 otherView:_view21];
        }
        else if (_view31.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view11 otherView:_view31];
        }
        else if (_view41.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view11 otherView:_view41];
        }
    }
    if (_view12.alpha == 1){
        if ([self isEnabledandEqualTo:_view12 otherView:_view22]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view12 otherView:_view22];
        }
        else if ([self isEnabledandEqualTo:_view12 otherView:_view32] && _view22.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view12 otherView:_view32];
        }
        else if ([self isEnabledandEqualTo:_view12 otherView:_view42] && _view22.alpha == 0 && _view32.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view12 otherView:_view42];
        }
    }
    else {
        if (_view22.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view12 otherView:_view22];
        }
        else  if (_view32.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view12 otherView:_view32];
        }
        else if (_view42.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view12 otherView:_view42];
        }
    }
    if (_view13.alpha == 1){
        if ([self isEnabledandEqualTo:_view13 otherView:_view23]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view13 otherView:_view23];
        }
        else if ([self isEnabledandEqualTo:_view13 otherView:_view33] && _view23.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view13 otherView:_view33];
        }
        else if ([self isEnabledandEqualTo:_view13 otherView:_view43] && _view23.alpha == 0 && _view33.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view13 otherView:_view43];
        }
    }
    else {
        if (_view23.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view13 otherView:_view23];
        }
        else if (_view33.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view13 otherView:_view33];
        }
        else if (_view43.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view13 otherView:_view43];
        }
    }
    if (_view14.alpha == 1){
        if ([self isEnabledandEqualTo:_view14 otherView:_view24]){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view14 otherView:_view24];
        }
        else if ([self isEnabledandEqualTo:_view14 otherView:_view34] && _view24.alpha == 0){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view14 otherView:_view34];
        }
        else if ([self isEnabledandEqualTo:_view14 otherView:_view44] && _view24.alpha == 0 && _view34.alpha == 0){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view14 otherView:_view44];
        }
    }
    else {
        if (_view24.alpha == 1){
            nothingHappened =1;
            [self updateBaseView:_view14 otherView:_view24];
        }
        else if (_view34.alpha == 1){
            nothingHappened =1;
            [self updateBaseView:_view14 otherView:_view34];
        }
        else if (_view44.alpha == 1){
            nothingHappened =1;
            [self updateBaseView:_view14 otherView:_view44];
        }
    }
    
    /******************************************************
     UPDATE ROW 2
     *******************************************************/
    if (_view21.alpha == 1) {
        if ([self isEnabledandEqualTo:_view21 otherView:_view31]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view21 otherView:_view31];
        }
        else if ([self isEnabledandEqualTo:_view21 otherView:_view41] && _view21.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view21 otherView:_view41];
        }
    }
    else {
        if (_view31.alpha == 1){
            if ([self isEnabledandEqualTo:_view31 otherView:_view41])
                [self combineViewsAndIncrement:_view31 otherView:_view41];
            nothingHappened=1;
            [self updateBaseView:_view21 otherView:_view31];
        }
        else if (_view41.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view31 otherView:_view41];
        }
    }
    
    if (_view22.alpha == 1){
        if ([self isEnabledandEqualTo:_view22 otherView:_view32]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view22 otherView:_view32];
        }
        else if ([self isEnabledandEqualTo:_view22 otherView:_view42] && _view32.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view22 otherView:_view42];
        }
    }
    else {
        if (_view32.alpha == 1){
            if ([self isEnabledandEqualTo:_view32 otherView:_view42])
                [self combineViewsAndIncrement:_view32 otherView:_view42];
            nothingHappened=1;
            [self updateBaseView:_view22 otherView:_view32];
        }
        else if (_view42.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view32 otherView:_view42];
        }
    }
    
    if (_view23.alpha == 1){ //32 = 33
        if ([self isEnabledandEqualTo:_view23 otherView:_view33]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view23 otherView:_view33];
        }
        else if ([self isEnabledandEqualTo:_view23 otherView:_view43] && _view33.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view23 otherView:_view43];
        }
    }
    else {
        if (_view33.alpha == 1) {
            if ([self isEnabledandEqualTo:_view33 otherView:_view43])
                [self combineViewsAndIncrement:_view33 otherView:_view43];
            nothingHappened=1;
            [self updateBaseView:_view23 otherView:_view33];
        }
        else if (_view43.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view33 otherView:_view43];
        }
    }
    
    if (_view24.alpha == 1){
        if ([self isEnabledandEqualTo:_view24 otherView:_view34]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view24 otherView:_view34];
        }
        else if ([self isEnabledandEqualTo:_view24 otherView:_view44] && _view34.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view24 otherView:_view44];
        }
    }
    else {
        if (_view34.alpha == 1){
            if ([self isEnabledandEqualTo:_view34 otherView:_view44])
                [self combineViewsAndIncrement:_view34 otherView:_view44];
            nothingHappened=1;
            [self updateBaseView:_view24 otherView:_view34];
        }
        else if (_view44.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view34 otherView:_view44];
        }
    }
    
    /******************************************************
     UPDATE ROW 3
     *******************************************************/
    
    if (_view31.alpha == 1) {
        if ([self isEnabledandEqualTo:_view31 otherView:_view41]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view31 otherView:_view41];
        }
    }
    else {
        if (_view21.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view31 otherView:_view41];
        }
    }
    //*******************************************************
    
    if (_view32.alpha == 1){
        if ([self isEnabledandEqualTo:_view32 otherView:_view42]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view32 otherView:_view42];
        }
    }
    else {
        if (_view42.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view32 otherView:_view42];
        }
    }
    
    //*******************************************************
    if (_view33.alpha == 1){
        if ([self isEnabledandEqualTo:_view33 otherView:_view43]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view33 otherView:_view43];
        }
    }
    else {
        if (_view43.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view33 otherView:_view43];
        }
    }
    
    //*******************************************************
    if (_view34.alpha == 1){
        if ([self isEnabledandEqualTo:_view34 otherView:_view44]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view34 otherView:_view44];
        }
    }
    else {
        if (_view44.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view34 otherView:_view44];
        }
    }
    if(nothingHappened)
        [self createRandomSquares];
    [self checkIfNoMoreMoves];
}

- (IBAction)downSwipeHandler:(id)sender {
    NSLog(@"Down Swipe");
    int nothingHappened=0;
    if (_view41.alpha == 1) {
        if ([self isEnabledandEqualTo:_view41 otherView:_view31]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view41 otherView:_view31];
        }
        else if ([self isEnabledandEqualTo:_view41 otherView:_view21] && _view31.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view41 otherView:_view21];
        }
        else if ([self isEnabledandEqualTo:_view41 otherView:_view11] && _view31.alpha == 0 && _view21.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view41 otherView:_view11];
        }
    }
    else {
        if (_view31.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view41 otherView:_view31];
        }
        else if (_view21.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view41 otherView:_view21];
        }
        else if (_view11.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view41 otherView:_view11];
        }
    }
    if (_view42.alpha == 1){
        if ([self isEnabledandEqualTo:_view42 otherView:_view32]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view42 otherView:_view32];
        }
        else if ([self isEnabledandEqualTo:_view42 otherView:_view22] && _view32.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view42 otherView:_view22];
        }
        else if ([self isEnabledandEqualTo:_view42 otherView:_view12] && _view32.alpha == 0 && _view22.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view42 otherView:_view12];
        }
    }
    else {
        if (_view32.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view42 otherView:_view32];
        }
        else  if (_view22.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view42 otherView:_view22];
        }
        else if (_view12.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view42 otherView:_view12];
        }
    }
    if (_view43.alpha == 1){
        if ([self isEnabledandEqualTo:_view43 otherView:_view33]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view43 otherView:_view33];
        }
        else if ([self isEnabledandEqualTo:_view43 otherView:_view23] && _view33.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view43 otherView:_view23];
        }
        else if ([self isEnabledandEqualTo:_view43 otherView:_view13] && _view33.alpha == 0 && _view23.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view43 otherView:_view13];
        }
    }
    else {
        if (_view33.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view43 otherView:_view33];
        }
        else if (_view23.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view43 otherView:_view23];
        }
        else if (_view13.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view43 otherView:_view13];
        }
    }
    if (_view44.alpha == 1){
        if ([self isEnabledandEqualTo:_view44 otherView:_view34]){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view44 otherView:_view34];
        }
        else if ([self isEnabledandEqualTo:_view44 otherView:_view24] && _view34.alpha == 0){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view44 otherView:_view24];
        }
        else if ([self isEnabledandEqualTo:_view44 otherView:_view14] && _view34.alpha == 0 && _view24.alpha == 0){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view44 otherView:_view14];
        }
    }
    else {
        if (_view34.alpha == 1){
            nothingHappened =1;
            [self updateBaseView:_view44 otherView:_view34];
        }
        else if (_view24.alpha == 1){
            nothingHappened =1;
            [self updateBaseView:_view44 otherView:_view24];
        }
        else if (_view14.alpha == 1){
            nothingHappened =1;
            [self updateBaseView:_view44 otherView:_view14];
        }
    }
    
    /******************************************************
     UPDATE ROW 3
     *******************************************************/
    if (_view31.alpha == 1) {
        if ([self isEnabledandEqualTo:_view31 otherView:_view21]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view31 otherView:_view21];
        }
        else if ([self isEnabledandEqualTo:_view31 otherView:_view11] && _view21.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view31 otherView:_view11];
        }
    }
    else {
        if (_view21.alpha == 1){
            if ([self isEnabledandEqualTo:_view21 otherView:_view11])
                [self combineViewsAndIncrement:_view21 otherView:_view11];
            nothingHappened=1;
            [self updateBaseView:_view31 otherView:_view21];
        }
        else if (_view11.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view31 otherView:_view11];
        }
    }
    
    if (_view32.alpha == 1){//22=32
        if ([self isEnabledandEqualTo:_view32 otherView:_view22]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view32 otherView:_view22];
        }
        else if ([self isEnabledandEqualTo:_view32 otherView:_view12] && _view22.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view32 otherView:_view12];
        }
    }
    else {
        if (_view22.alpha == 1){
            if ([self isEnabledandEqualTo:_view22 otherView:_view12])
                [self combineViewsAndIncrement:_view22 otherView:_view12];
            nothingHappened=1;
            [self updateBaseView:_view32 otherView:_view22];
        }
        else if (_view12.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view32 otherView:_view12];
        }
    }
    
    if (_view33.alpha == 1){ //32 = 33
        if ([self isEnabledandEqualTo:_view33 otherView:_view23]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view33 otherView:_view23];
        }
        else if ([self isEnabledandEqualTo:_view33 otherView:_view13] && _view23.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view33 otherView:_view13];
        }
    }
    else {
        if (_view23.alpha == 1) {
            if ([self isEnabledandEqualTo:_view23 otherView:_view13])
                [self combineViewsAndIncrement:_view23 otherView:_view13];
            nothingHappened=1;
            [self updateBaseView:_view33 otherView:_view23];
        }
        else if (_view13.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view33 otherView:_view13];
        }
    }
    
    if (_view34.alpha == 1){
        if ([self isEnabledandEqualTo:_view34 otherView:_view24]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view34 otherView:_view24];
        }
        else if ([self isEnabledandEqualTo:_view34 otherView:_view14] && _view24.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view34 otherView:_view14];
        }
    }
    else {
        if (_view24.alpha == 1){
            if ([self isEnabledandEqualTo:_view24 otherView:_view14])
                [self combineViewsAndIncrement:_view24 otherView:_view14];
            nothingHappened=1;
            [self updateBaseView:_view34 otherView:_view24];
        }
        else if (_view14.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view34 otherView:_view14];
        }
    }
    
    /******************************************************
     UPDATE ROW 2
     *******************************************************/
    
    if (_view21.alpha == 1) {
        if ([self isEnabledandEqualTo:_view21 otherView:_view11]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view21 otherView:_view11];
        }
    }
    else {
        if (_view11.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view21 otherView:_view11];
        }
    }
    //*******************************************************
    
    if (_view22.alpha == 1){
        if ([self isEnabledandEqualTo:_view22 otherView:_view12]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view22 otherView:_view12];
        }
    }
    else {
        if (_view12.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view22 otherView:_view12];
        }
    }
    
    //*******************************************************
    if (_view23.alpha == 1){
        if ([self isEnabledandEqualTo:_view23 otherView:_view13]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view23 otherView:_view13];
        }
    }
    else {
        if (_view13.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view23 otherView:_view13];
        }
    }
    
    //*******************************************************
    if (_view24.alpha == 1){
        if ([self isEnabledandEqualTo:_view24 otherView:_view14]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view24 otherView:_view14];
        }
    }
    else {
        if (_view14.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view24 otherView:_view14];
        }
    }
    if(nothingHappened)
        [self createRandomSquares];
    [self checkIfNoMoreMoves];
}

- (IBAction)rightSwipeHandler:(id)sender {
    NSLog(@"Right Swipe");
    int nothingHappened = 0;//at end, if no tiles changed, this will prevent spawning new tiles
    //update column 4 (leftmost column)
    if (_view14.alpha == 1) {
        if ([self isEnabledandEqualTo:_view14 otherView:_view13]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view14 otherView:_view13];
        }
        else if ([self isEnabledandEqualTo:_view14 otherView:_view12] && _view13.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view14 otherView:_view12];
        }
        else if ([self isEnabledandEqualTo:_view14 otherView:_view11] && _view13.alpha == 0 && _view12.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view14 otherView:_view11];
        }
    }
    else {
        if (_view13.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view14 otherView:_view13];
        }
        else if (_view12.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view14 otherView:_view12];
        }
        else if (_view11.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view14 otherView:_view11];
        }
    }
    if (_view24.alpha == 1){
        if ([self isEnabledandEqualTo:_view24 otherView:_view23]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view24 otherView:_view23];
        }
        else if ([self isEnabledandEqualTo:_view24 otherView:_view22] && _view23.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view24 otherView:_view22];
        }
        else if ([self isEnabledandEqualTo:_view24 otherView:_view21] && _view23.alpha == 0 && _view22.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view24 otherView:_view21];
        }
    }
    else {
        if (_view23.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view24 otherView:_view23];
        }
        else  if (_view22.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view24 otherView:_view22];
        }
        else if (_view21.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view24 otherView:_view21];
        }
    }
    if (_view34.alpha == 1){
        if ([self isEnabledandEqualTo:_view34 otherView:_view33]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view34 otherView:_view33];
        }
        else if ([self isEnabledandEqualTo:_view34 otherView:_view32] && _view33.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view34 otherView:_view32];
        }
        else if ([self isEnabledandEqualTo:_view34 otherView:_view31] && _view33.alpha == 0 && _view32.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view34 otherView:_view31];
        }
    }
    else {
        if (_view33.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view34 otherView:_view33];
        }
        else if (_view32.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view34 otherView:_view32];
        }
        else if (_view31.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view34 otherView:_view31];
        }
    }
    if (_view44.alpha == 1){
        if ([self isEnabledandEqualTo:_view44 otherView:_view43]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view44 otherView:_view43];
        }
        else if ([self isEnabledandEqualTo:_view44 otherView:_view42] && _view43.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view44 otherView:_view42];
        }
        else if ([self isEnabledandEqualTo:_view44 otherView:_view41] && _view43.alpha == 0 && _view42.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view44 otherView:_view41];
        }
    }
    else {
        if (_view43.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view44 otherView:_view43];
        }
        else if (_view42.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view44 otherView:_view42];
        }
        else if (_view41.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view44 otherView:_view41];
        }
    }
    
    /******************************************************
     UPDATE COLUMN 2
     *******************************************************/
    if (_view13.alpha == 1) {
        if ([self isEnabledandEqualTo:_view13 otherView:_view12]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view13 otherView:_view12];
        }
        else if ([self isEnabledandEqualTo:_view13 otherView:_view11] && _view12.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view13 otherView:_view11];
        }
    }
    else {
        if (_view12.alpha == 1){
            if ([self isEnabledandEqualTo:_view12 otherView:_view11])
                [self combineViewsAndIncrement:_view12 otherView:_view11];
            nothingHappened = 1;
            [self updateBaseView:_view13 otherView:_view12];
        }
        else if (_view11.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view13 otherView:_view11];
        }
    }
    
    if (_view23.alpha == 1){
        if ([self isEnabledandEqualTo:_view23 otherView:_view22]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view23 otherView:_view22];
        }
        else if ([self isEnabledandEqualTo:_view23 otherView:_view21] && _view22.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view23 otherView:_view21];
        }
    }
    else {
        if (_view22.alpha == 1){
            if ([self isEnabledandEqualTo:_view22 otherView:_view21])
                [self combineViewsAndIncrement:_view22 otherView:_view21];
            nothingHappened = 1;
            [self updateBaseView:_view23 otherView:_view22];
        }
        else if (_view21.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view23 otherView:_view21];
        }
    }
    
    if (_view33.alpha == 1){
        if ([self isEnabledandEqualTo:_view33 otherView:_view32]){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view33 otherView:_view32];
        }
        else if ([self isEnabledandEqualTo:_view33 otherView:_view31] && _view32.alpha == 0){
            nothingHappened = 1;
            [self combineViewsAndIncrement:_view33 otherView:_view31];
        }
    }
    else {
        if (_view32.alpha == 1) {
            if ([self isEnabledandEqualTo:_view32 otherView:_view31])
                [self combineViewsAndIncrement:_view32 otherView:_view31];
            nothingHappened = 1;
            [self updateBaseView:_view33 otherView:_view32];
        }
        else if (_view31.alpha == 1){
            nothingHappened = 1;
            [self updateBaseView:_view33 otherView:_view31];
        }
    }
    
    if (_view43.alpha == 1){
        if ([self isEnabledandEqualTo:_view43 otherView:_view42]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view43 otherView:_view42];
        }
        else if ([self isEnabledandEqualTo:_view43 otherView:_view41] && _view42.alpha == 0){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view43 otherView:_view41];
        }
    }
    else {
        if (_view42.alpha == 1){
            if ([self isEnabledandEqualTo:_view42 otherView:_view41])
                [self combineViewsAndIncrement:_view42 otherView:_view41];
            nothingHappened=1;
            [self updateBaseView:_view43 otherView:_view42];
        }
        else if (_view41.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view43 otherView:_view41];
        }
    }
    
    /******************************************************
     UPDATE COLUMN 2
     *******************************************************/
    
    if (_view12.alpha == 1) {
        if ([self isEnabledandEqualTo:_view12 otherView:_view11]){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view12 otherView:_view11];
        }
    }
    else {
        if (_view11.alpha == 1){
            nothingHappened =1;
            [self updateBaseView:_view12 otherView:_view11];
        }
    }
    //*******************************************************
    
    if (_view22.alpha == 1){
        if ([self isEnabledandEqualTo:_view22 otherView:_view21]){
            nothingHappened =1;
            [self combineViewsAndIncrement:_view22 otherView:_view21];
        }
    }
    else {
        if (_view21.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view22 otherView:_view21];
        }
    }
    
    //*******************************************************
    if (_view32.alpha == 1){
        if ([self isEnabledandEqualTo:_view32 otherView:_view31]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view32 otherView:_view31];
        }
    }
    else {
        if (_view31.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view32 otherView:_view31];
        }
    }
    
    //*******************************************************
    if (_view42.alpha == 1){
        if ([self isEnabledandEqualTo:_view42 otherView:_view41]){
            nothingHappened=1;
            [self combineViewsAndIncrement:_view42 otherView:_view41];
        }
    }
    else {
        if (_view41.alpha == 1){
            nothingHappened=1;
            [self updateBaseView:_view42 otherView:_view41];
        }
    }
    
    if(nothingHappened)
        [self createRandomSquares];
    [self checkIfNoMoreMoves];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
