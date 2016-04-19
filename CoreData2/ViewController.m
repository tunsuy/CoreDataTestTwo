//
//  ViewController.m
//  CoreData2
//
//  Created by tunsuy on 12/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "ViewController.h"
#import "Blog.h"
#import "CreateDataViewController.h"

static NSString *const modelName = @"Blog";

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *refreshListBtn = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStyleDone target:self action:@selector(refreshList:)];
    UIBarButtonItem *createBlogBtn = [[UIBarButtonItem alloc] initWithTitle:@"新建" style:UIBarButtonItemStyleDone target:self action:@selector(createBlog:)];
    self.navigationItem.leftBarButtonItem = refreshListBtn;
    self.navigationItem.rightBarButtonItem = createBlogBtn;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}

- (void)refreshList:(UIBarButtonItem *)sender {
    [_tableView reloadData];
}

- (void)createBlog:(UIBarButtonItem *)sender {
    CreateDataViewController *createDataVC = [[CreateDataViewController alloc] init];
//    [self presentViewController:createDataVC animated:YES completion:nil];
    [self.navigationController pushViewController:createDataVC animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [CoreDataManagerInstance numberOfSectionsWithModelName:modelName];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [CoreDataManagerInstance numberOfRowsWithModelName:modelName inSection:section-1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"listblogcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    Blog *blog = [CoreDataManagerInstance objectWithModelName:modelName atIndexPath:indexPath];
    cell.textLabel.text = blog.content;
    cell.textLabel.font = [UIFont systemFontOfSize:kCreateDataViewControllerFontSize];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Blog *blog = [CoreDataManagerInstance objectWithModelName:modelName atIndexPath:indexPath];
    return [TextOperateHelper calculateHeight:blog.content];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
