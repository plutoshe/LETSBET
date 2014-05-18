//
//  PSViewController.m
//  LetsBet
//
//  Created by PlutoShe on 5/14/14.
//  Copyright (c) 2014 PlutoShe. All rights reserved.
//

#import "PSViewController.h"


typedef NS_OPTIONS(NSUInteger, ScrollingState) {
    ScrollingStateAuto      = 1 << 0,
    ScrollingStateManual    = 1 << 1,
    ScrollingStateLooping   = 1 << 2,
};

@interface PSViewController () {
    CGSize windowSize;
    NSArray *pages;
    ScrollingState _currentState;
    
    int _currentPageIndex;
    
    BOOL _autoScrollEnabled;
    BOOL _autoScrollLooping;
    CGFloat _autoScrollDurationOnPage;
    
    PSTutorialLabelStyle *_commonPageSubTitleStyle;
    PSTutorialLabelStyle *_commonPageDescriptionStyle;
    
}

@property (weak, nonatomic) IBOutlet UILabel *welcomeLable;
@property (nonatomic, assign) BOOL autoScrollEnabled;
@property (nonatomic, assign) BOOL autoScrollLooping;
@property (nonatomic, assign) CGFloat autoScrollDurationOnPage;
@property (nonatomic, retain) PSTutorialLabelStyle *commonPageSubTitleStyle;
@property (nonatomic, retain) PSTutorialLabelStyle *commonPageDescriptionStyle;


// Pages management.
- (void)setPages:(NSArray*)pages;
- (NSUInteger)numberOfPages;

// Scrolling.
- (void)startScrolling;
- (void)stopScrolling;

// State.
- (ScrollingState)getCurrentState;

/*
 CGSize _windowSize;
 ScrollingState _currentState;
 
 NSArray *_pages;
 int _currentPageIndex;
 
 BOOL _autoScrollEnabled;
 BOOL _autoScrollLooping;
 CGFloat _autoScrollDurationOnPage;
 
 ICETutorialLabelStyle *_commonPageSubTitleStyle;
 ICETutorialLabelStyle *_commonPageDescriptionStyle;
 
 ButtonBlock _button1Block;
 ButtonBlock _button2Block;*/
 @property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

 @property (weak, nonatomic) IBOutlet UIImageView *frontgoundImage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
 
 @property (weak, nonatomic) IBOutlet UIButton *signIn;
 @property (weak, nonatomic) IBOutlet UIButton *signUp;
/*
 @property (nonatomic, assign) BOOL autoScrollEnabled;
 @property (nonatomic, assign) BOOL autoScrollLooping;
 @property (nonatomic, assign) CGFloat autoScrollDurationOnPage;
 @property (nonatomic, retain) ICETutorialLabelStyle *commonPageSubTitleStyle;
 @property (nonatomic, retain) ICETutorialLabelStyle *commonPageDescriptionStyle;
*/
@end

@implementation PSViewController
@synthesize autoScrollEnabled = _autoScrollEnabled;
@synthesize autoScrollLooping = _autoScrollLooping;
@synthesize autoScrollDurationOnPage = _autoScrollDurationOnPage;
@synthesize commonPageSubTitleStyle = _commonPageSubTitleStyle;
@synthesize commonPageDescriptionStyle = _commonPageDescriptionStyle;

- (NSUInteger)numberOfPages{
    if (pages)
        return [pages count];
    
    return 0;
}

#pragma mark - Pages
// Set the list of pages (ICETutorialPage)
- (void)setPages:(NSArray *)pages1{
    pages = pages1;
}
- (void)setOriginLayersState{
    NSLog(@"---");
    _currentState = ScrollingStateAuto;
    [_backgroundImage setBackgroundColor:[UIColor redColor]];
    [_frontgoundImage setBackgroundColor:[UIColor greenColor]];
    [self setLayersPicturesWithIndex:0];
}
- (void)setLayersPicturesWithIndex:(NSInteger)index{
    _currentPageIndex = (int)index;
    [self setLayersPrimaryAlphaWithPageIndex:index];
    [self setFrontLayerPictureWithPageIndex:index];
    [self setBackLayerPictureWithPageIndex:index];
}
- (void)setLayersPrimaryAlphaWithPageIndex:(NSInteger)index{
    [_frontgoundImage setAlpha:1];
    [_backgroundImage setAlpha:0];
}

- (void)setFrontLayerPictureWithPageIndex:(NSInteger)index{
    [self setBackgroundImage:_frontgoundImage withIndex:index];
}
- (void)setBackLayerPictureWithPageIndex:(NSInteger)index{
    [self setBackgroundImage:_backgroundImage withIndex:index + 1];
}

- (void)setBackgroundImage:(UIImageView *)imageView withIndex:(NSInteger)index{
    NSLog(@"%ld", index);
    if (index >= [pages count]){
        [imageView setImage:nil];
        return;
    }
    NSLog(@"%@", [[pages objectAtIndex:index] pictureName]);
    NSString *imageName = [NSString stringWithFormat:@"%@",[[pages objectAtIndex:index] pictureName]];
    [imageView setImage:[UIImage imageNamed:imageName]];

}

/*
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ( viewController ==  rootViewController) {
        [navigationController setNavigationBarHidden:YES animated:animated];
    } else if ( [navigationController isNavigationBarHidden] ) {
        [navigationController setNavigationBarHidden:NO animated:animated];
    }
}
 
*/
- (void) viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = YES;
}
- (void) viewWillDisappear:(BOOL)animated {
    [self stopScrolling];
}
- (void)viewDidLoad
{

     [super viewDidLoad];
//            self.navigationController.navigationBar.hidden = YES;
//    self.navigationController.navigationBar.alpha = 0.300;
 //   self.navigationController.navigationBar.translucent = YES;
//self.edgesForExtendedLayout=UIRectEdgeNone;
//    [self.navigationController.navigationBar ]
    self.navigationController.navigationBar.hidden = YES;
    [self.signIn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"button-background"]]];
//    [_signIn setTitle:@"SignIn" forState:UIControlStateNormal];
    [self.signUp setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"button-background"]]];
//    [_signUp setTitle:@"SignIn" forState:UIControlStateNormal];
    [_welcomeLable setText:@"Welcome\nTo\nLet'sBet!"];
//    _welcomeLable.lineBreakMode = UILineBreakModeWordWrap;
        _welcomeLable.numberOfLines = 0;

    _autoScrollEnabled = YES;
    _autoScrollLooping = YES;
    _autoScrollDurationOnPage = TUTORIAL_DEFAULT_DURATION_ON_PAGE;
    
    
    PSTutorialPage *layer1 = [[PSTutorialPage alloc] initWithSubTitle:@"Picture 1"
                                                          description:@"Champs-Elysées by night"
                                                          pictureName:@"Picture1"];
    PSTutorialPage *layer2 = [[PSTutorialPage alloc] initWithSubTitle:@"Picture 2"
                                                          description:@"The Eiffel Tower with\n cloudy weather"
                                                          pictureName:@"Picture2"];
    PSTutorialPage *layer3 = [[PSTutorialPage alloc] initWithSubTitle:@"Picture 3"
                                                          description:@"An other famous street of Paris"
                                                          pictureName:@"Picture3"];
    PSTutorialPage *layer4 = [[PSTutorialPage alloc] initWithSubTitle:@"Picture 4"
                                                          description:@"The Eiffel Tower with a better weather"
                                                          pictureName:@"Picture4"];
    PSTutorialPage *layer5 = [[PSTutorialPage alloc] initWithSubTitle:@"Picture 5"
                                                          description:@"The Louvre's Museum Pyramide"
                                                          pictureName:@"Picture5"];
    
    
    // Set the common style for SubTitles and Description (can be overrided on each page).
    PSTutorialLabelStyle *subStyle = [[PSTutorialLabelStyle alloc] init];
    [subStyle setFont:TUTORIAL_SUB_TITLE_FONT];
    [subStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [subStyle setLinesNumber:TUTORIAL_SUB_TITLE_LINES_NUMBER];
    [subStyle setOffset:TUTORIAL_SUB_TITLE_OFFSET];
    
    PSTutorialLabelStyle *descStyle = [[PSTutorialLabelStyle alloc] init];
    [descStyle setFont:TUTORIAL_DESC_FONT];
    [descStyle setTextColor:TUTORIAL_LABEL_TEXT_COLOR];
    [descStyle setLinesNumber:TUTORIAL_DESC_LINES_NUMBER];
    [descStyle setOffset:TUTORIAL_DESC_OFFSET];
    
    // Load into an array.
    pages = @[layer1,layer2,layer3,layer4,layer5];
    
    // Override point for customization after application launch.
    
    // Set the common styles, and start scrolling (auto scroll, and looping enabled by default)
    [self setCommonPageSubTitleStyle:subStyle];
    [self setCommonPageDescriptionStyle:descStyle];
    

    

    
   
    [[self view] setBackgroundColor:[UIColor blackColor]];
    windowSize = [[UIScreen mainScreen] bounds].size;

    [_scrollView setContentSize:CGSizeMake([self numberOfPages] * windowSize.width,
                                           _scrollView.contentSize.height)];
    [_scrollView setPagingEnabled:YES];
    
    // PageControl configuration.
    [_pageControl setNumberOfPages:[self numberOfPages]];
    [_pageControl setCurrentPage:0];
    
    
    // Overlays.
    [self setOverlayTexts];
    
    // Preset the origin state.
    [self setOriginLayersState];
    
    // Run the auto-scrolling.

    NSLog(@"!!!!");
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Picture1"]];
    [self.backgroundImage setImage:[UIImage imageNamed:@"Picture1"]];
        [self.frontgoundImage setImage:[UIImage imageNamed:@"Picture1"]];

    [self startScrolling];
        [self autoScrollToNextPage];
    
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Animations
- (void)animateScrolling{
    if (_currentState & ScrollingStateManual)
        return;
    
    // Jump to the next page...
    int nextPage = _currentPageIndex + 1;
    if (nextPage == [self numberOfPages]){
        // ...stop the auto-scrolling or...
        if (!_autoScrollLooping){
            _currentState = ScrollingStateManual;
            return;
        }
        
        // ...jump to the first page.
        nextPage = 0;
        _currentState = ScrollingStateLooping;
        
        // Set alpha on layers.
        [self setLayersPrimaryAlphaWithPageIndex:0];
        [self setBackLayerPictureWithPageIndex:-1];
    } else {
        _currentState = ScrollingStateAuto;
    }
    
    // Make the scrollView animation.
    [_scrollView setContentOffset:CGPointMake(nextPage * windowSize.width,0)
                         animated:YES];
    
    // Set the PageControl on the right page.
    [_pageControl setCurrentPage:nextPage];
    
    // Call the next animation after X seconds.
    [self autoScrollToNextPage];
}


#pragma mark - Scrolling management
// Run it.
- (void)startScrolling{
    
    [self autoScrollToNextPage];
}

// Call the next animation after X seconds.
- (void)autoScrollToNextPage{
    if (_autoScrollEnabled)
        [self performSelector:@selector(animateScrolling)
                   withObject:nil
                   afterDelay:_autoScrollDurationOnPage];
}

// Manually stop the scrolling
- (void)stopScrolling{
    _currentState = ScrollingStateManual;
}

#pragma mark - State management
// State.
- (ScrollingState)getCurrentState{
    return _currentState;
}

#pragma mark - Overlay management
// Setup the Title Label.
- (void)setOverlayTitle{
    // ...or change by an UIImageView if you need it.
    [_welcomeLable setText:@"Welcome to Let's Bet"];
}


// Setup the SubTitle/Description style/text.
- (void)setOverlayTexts{
    int index = 0;
    for(PSTutorialPage *page in pages){
        // SubTitles.
        if ([[[page subTitle] text] length]){
            UILabel *subTitle = [self overlayLabelWithText:[[page subTitle] text]
                                                     layer:[page subTitle]
                                               commonStyle:_commonPageSubTitleStyle
                                                     index:index];
            [_scrollView addSubview:subTitle];
        }
        // Description.
        if ([[[page description] text] length]){
            UILabel *description = [self overlayLabelWithText:[[page description] text]
                                                        layer:[page description]
                                                  commonStyle:_commonPageDescriptionStyle
                                                        index:index];
            [_scrollView addSubview:description];
        }
        
        index++;
    }
}

- (UILabel *)overlayLabelWithText:(NSString *)text
                            layer:(PSTutorialLabelStyle *)style
                      commonStyle:(PSTutorialLabelStyle *)commonStyle
                            index:(NSUInteger)index{
    // SubTitles.
    UILabel *overlayLabel = [[UILabel alloc] initWithFrame:CGRectMake((index  * windowSize.width),
                                                                      windowSize.height - [commonStyle offset],
                                                                      windowSize.width,
                                                                      TUTORIAL_LABEL_HEIGHT)];
    [overlayLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [overlayLabel setNumberOfLines:[commonStyle linesNumber]];
    [overlayLabel setBackgroundColor:[UIColor clearColor]];
    [overlayLabel setTextAlignment:NSTextAlignmentCenter];
    
    // Datas and style.
    [overlayLabel setText:text];
    [style font] ? [overlayLabel setFont:[style font]] :
    [overlayLabel setFont:[commonStyle font]];
    if ([style textColor])
        [overlayLabel setTextColor:[style textColor]];
    else
        [overlayLabel setTextColor:[commonStyle textColor]];
    
    [_scrollView addSubview:overlayLabel];
    return overlayLabel;
}

- (void)didReceiveMemoryWarning
{
      NSLog(@"~~~~~");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Setup layer's alpha.


// Animate the fade-in/out (Cross-disolve) with the scrollView translation.
- (void)disolveBackgroundWithContentOffset:(float)offset{
    if (_currentState & ScrollingStateLooping){
        // Jump from the last page to the first.
        [self scrollingToFirstPageWithOffset:offset];
    } else {
        // Or just scroll to the next/previous page.
        [self scrollingToNextPageWithOffset:offset];
    }
}

// Handle alpha on layers when the auto-scrolling is looping to the first page.
- (void)scrollingToFirstPageWithOffset:(float)offset{
    
//    NSLog(@"!");
    // Compute the scrolling percentage on all the page.
    offset = (offset * windowSize.width) / (windowSize.width * [self numberOfPages]);
    
    // Scrolling finished...
    if (offset == 0){
        // ...reset to the origin state.
        [self setOriginLayersState];
        return;
    }
    
    // Invert alpha for the back picture.
    float backLayerAlpha = (1 - offset);
    float frontLayerAlpha = offset;
    
    // Set alpha.
    [_backgroundImage setAlpha:backLayerAlpha];
    [_frontgoundImage setAlpha:frontLayerAlpha];
}

// Handle alpha on layers when we are scrolling to the next/previous page.
- (void)scrollingToNextPageWithOffset:(float)offset{
    // Current page index in scrolling.
    NSInteger page = (int)(offset);
    
    // Keep only the float value.
    float alphaValue = offset - (int)offset;
    
    // This is only when you scroll to the right on the first page.
    // That will fade-in black the first picture.
    if (alphaValue < 0 && _currentPageIndex == 0){
        [_backgroundImage setImage:nil];
        [_frontgoundImage setAlpha:(1 + alphaValue)];
        return;
    }
    
    // Switch pictures, and imageView alpha.
    if (page != _currentPageIndex)
        [self setLayersPicturesWithIndex:page];
    
    // Invert alpha for the front picture.
    float backLayerAlpha = alphaValue;
    float frontLayerAlpha = (1 - alphaValue);
    
    // Set alpha.
    [_backgroundImage setAlpha:backLayerAlpha];
    [_frontgoundImage setAlpha:frontLayerAlpha];
}

- (IBAction)AccSignIn:(UIButton*)sender {
    NSLog(@"@@@");

}

- (IBAction)AccSignUp:(UIButton*)sender {
}

- (IBAction)didClickOnPageControl:(UIPageControl *)sender {
    _currentState = ScrollingStateManual;
    
    // Make the scrollView animation.
    [_scrollView setContentOffset:CGPointMake(sender.currentPage * windowSize.width,0)
                         animated:YES];
    
    // Set the PageControl on the right page.
    [_pageControl setCurrentPage:sender.currentPage];
}


#pragma mark - ScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // Get scrolling position, and send the alpha values.
    float scrollingPosition = scrollView.contentOffset.x / windowSize.width;
    [self disolveBackgroundWithContentOffset:scrollingPosition];
    
    if (_scrollView.isTracking)
        _currentState = ScrollingStateManual;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // Update the page index.
    [_pageControl setCurrentPage:_currentPageIndex];
}

@end
