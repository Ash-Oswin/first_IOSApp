//
//  ViewController.m
//  test
//
//  Created by 谢政 on 2020/4/29.
//  Copyright © 2020 maimemo. All rights reserved.
//

#import "ViewController.h"

//NSString *docPath() {
//    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//                                                            NSUserDomainMask,
//                                                            YES);
//
//    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
//}
@interface ViewController () {

}

@end

@implementation ViewController
#pragma mark - application delegate callback

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
    
    //创建并设置控件的x轴与y轴的位置与宽度和高度  (x, y, width, height);
    CGRect tableFrame = CGRectMake(0, 150, self.view.frame.size.width,
                                   self.view.frame.size.height - 100);
    
    CGRect fieldFrame = CGRectMake(40, 75, 245, 35);
    CGRect buttonFrame = CGRectMake(310, 75, 70, 30);
    
    // 获取数据容器的实例
    self.tasks_data = [DataPersistence sharedInstance];
    
    // 实例化UITableView并设置样式与位置
    self.taskTable = [[UITableView alloc] initWithFrame: tableFrame
                                                  style: UITableViewStylePlain];
    // 关闭系统自带的表格分割线
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;

    // 创建新的单元格时，告诉UITableView对象要实例化哪个类
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // 设置taskTable的数据源为self
    self.taskTable.dataSource = self;
    
    
    // 创建UITextField对象 样式设置为圆角矩形
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap Insert";
    
    // 创建UIButton为圆角矩形 设置按钮的位置和按钮的标题 设置按钮的字体大小
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    [self.insertButton setTitle: @"Insert"
                       forState: UIControlStateNormal];
    self.insertButton.titleLabel.font = [UIFont systemFontOfSize: 20.0];
    
    [self.insertButton addTarget:self
                          action:@selector(addTask:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: self.taskTable];
    [self.view addSubview: self.taskField];
    [self.view addSubview: self.insertButton];
        
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Button Actions
- (void)addTask: (id)sender {
    NSString *text = [self.taskField text];
    
    // 如果提交空白则返回
    if ([text length] == 0) {
        return;
    }
    
    // 将文本添加到数据容器中，用于给taskTable提供数据
    [self.tasks_data addData:text];
    // 刷新表格视图，显示新加入的任务
    [self.taskTable reloadData];
    // 清空文本框内容
    [self.taskField setText:@""];
    // 关闭键盘
    [self.taskField resignFirstResponder];
}

#pragma mark - manager table view
// 根据指定的表格段索引给出相应表格段所包含的行数
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // 因为应用里只有一个表格段，所以可以只返回行数
    return [[self.tasks_data getData] count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 为了提升性能，检查是否有可重用的UITableViewCell
    // 没有可以重用的UITableViewCell对象时创建新的
    UITableViewCell *c =
        [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    // 根据模型对象（重新设置UITableViewCell）对象
    NSString *item = [[self.tasks_data getData] objectAtIndex: indexPath.row];
    
    c.textLabel.text = item;
    c.textLabel.font = [UIFont systemFontOfSize: 25.0];
    
    // 最后将设置好的行对象返回出去
    return c;
}

#pragma mark - injectioiii
// injectioniii config
- (void)injected
{
  //自定义修改...
  //重新加载view
  [self loadView];
  [self viewDidLoad];
  [self viewWillLayoutSubviews];
  [self viewWillAppear:NO];
}

@end
