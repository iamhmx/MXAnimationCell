# MXAnimationCell
UITableViewCell动画效果
## 效果示例
* 渐变<br/>![fade](https://github.com/iamhmx/MXAnimationCell/blob/master/MXAnimationCellDemo/screenshots/fade.gif)
  
* 从左进入<br/>![left](https://github.com/iamhmx/MXAnimationCell/blob/master/MXAnimationCellDemo/screenshots/slidefromleft.gif)

## 使用说明
#### 方法一：使用Cocoapods安装
    * pod 'MXAnimationCell'
    * #import "UITableViewCell+MXCellAnimationExtral.h"
#### 方法二：导入代码文件
    * 将MXAnimationCellClass文件夹内容添加到项目中
    * #import "UITableViewCell+MXCellAnimationExtral.h"
#### 在代理方法中添加代码
```objc
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //显示动画
    [cell showAnimationType:MXCellAnimationSlideFromLeft indexPath:indexPath];
}
```
## 代码示例
```objc
/*ViewController.m*/
#import "UITableViewCell+MXCellAnimationExtral.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource> {
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MXAnimationCellDemo";
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshTableView)];
}

- (void)refreshTableView {
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %ld",indexPath.row];
    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //显示动画
    [cell showAnimationType:MXCellAnimationSlideFromLeft indexPath:indexPath];
}

@end
```
