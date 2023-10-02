//
//  ViewController.m
//  ButtonDemoApp
//
//  Created by REVE Systems on 14/9/23.
//

#import "ViewController.h"
#import "ButtonCollectionViewCell.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonArray = @[@"Go to text", @"Go to image node Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate", @"Go to question node Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate",@"Go to email node",@"Go to appointment node",@"Go to schedule node",@"Go to DB node",@"Go to programming node",@"Go to enjoy node",@"Go to dance node"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ActionTableViewCell" bundle:nil] forCellReuseIdentifier:@"ActionTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableView DataSource & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActionTableViewCell" forIndexPath:indexPath];
    cell.buttonArray = self.buttonArray;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActionTableViewCell"];
    cell.buttonArray = self.buttonArray;
    [cell layoutIfNeeded];
    CGFloat totalHeight = 0;
    
    totalHeight += [cell calculateHeightForButtonCollectionView];
    
    NSLog(@"_DDaihan Total height is %f", totalHeight);
    return totalHeight;}

@end
