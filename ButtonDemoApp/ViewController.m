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
    
    self.buttonArray = @[@"Feature 1", @"Feature 2", @"Feature 3",@"Feature 4",@"Feature 5",@"Feature 6",@"Feature 7",@"Feature 1", @"Feature 2", @"Feature 3",@"Feature 4",@"Feature 5",@"Feature 6",@"Feature 7"];
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
    return cell.calculateTotalHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
