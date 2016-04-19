//
//  CreateDataViewController.m
//  CoreData2
//
//  Created by tunsuy on 12/4/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "CreateDataViewController.h"
#import "Blog+Operation.h"

#define kTextViewInitLineCount 4

@interface CreateDataViewController ()

@property (nonatomic, strong) UITextView *inputTextView;
@property (nonatomic, strong) NSMutableDictionary *userDataDic;

@end

@implementation CreateDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *cancleBtn = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancleCreate:)];
    UIBarButtonItem *finishBtn = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(finishCreate:)];
    self.navigationItem.leftBarButtonItem = cancleBtn;
    self.navigationItem.rightBarButtonItem = finishBtn;
    
    _inputTextView = [[UITextView alloc] initWithFrame:CGRectMake(kTextMargin, 84, [UIScreen mainScreen].bounds.size.width-kTextMargin*2, kCreateDataViewControllerFontSize*kTextViewInitLineCount)];
    _inputTextView.font = [UIFont systemFontOfSize:kCreateDataViewControllerFontSize];

    [self.view addSubview:_inputTextView];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardWillHideNotification object:nil];
    
    _userDataDic = [[NSMutableDictionary alloc] init];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [_inputTextView becomeFirstResponder];
//    self.navigationController.navigationBarHidden = YES;
}

- (void)cancleCreate:(UIBarButtonItem *)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)finishCreate:(UIBarButtonItem *)sender {
    NSString *content = [self.inputTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [_userDataDic setValue:content forKey:@"content"];
    
    [Blog createUserData:[self.userDataDic copy] withCallBack:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)keyboardChanged:(NSNotification *)notification {
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
