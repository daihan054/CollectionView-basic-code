//
//  ViewController.h
//  ButtonDemoApp
//
//  Created by REVE Systems on 14/9/23.
//

#import <UIKit/UIKit.h>
#import "ActionTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *buttonArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

