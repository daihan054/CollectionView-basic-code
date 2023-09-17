//
//  ViewController.h
//  ButtonDemoApp
//
//  Created by REVE Systems on 14/9/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *buttonCollectionView;
@property (strong, nonatomic) NSArray *buttonArray;

@end

