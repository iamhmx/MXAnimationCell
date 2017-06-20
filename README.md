# MXAnimationCell
UITableViewCell动画效果
## 效果示例
* 渐变<br/>![fade](https://github.com/iamhmx/MXAnimationCell/blob/master/MXAnimationCellDemo/screenshots/fade.gif)
  
* 从左进入<br/>![left](https://github.com/iamhmx/MXAnimationCell/blob/master/MXAnimationCellDemo/screenshots/left.gif)

* 从右进入<br/>![left](https://github.com/iamhmx/MXAnimationCell/blob/master/MXAnimationCellDemo/screenshots/right.gif)

* 展开<br/>![left](https://github.com/iamhmx/MXAnimationCell/blob/master/MXAnimationCellDemo/screenshots/expand.gif)

* 交叉<br/>![left](https://github.com/iamhmx/MXAnimationCell/blob/master/MXAnimationCellDemo/screenshots/cross.gif)
## 使用说明
#### 方法一：使用Cocoapods安装
    * pod 'MXAnimationCell'
    * #import "MXAnimationCellManager.h"
#### 方法二：导入代码文件
    * 将MXAnimationCellClass文件夹内容添加到项目中
    * #import "MXAnimationCellManager.h"
#### 添加代码
```objc
//绑定展示动画的tableView
[MXAnimationCellManager shareInstance].tableView = _tableView;
//指定动画类型
[MXAnimationCellManager shareInstance].type = MXCellAnimationExpand;
//在需要显示动画的地方调用show方法
[[MXAnimationCellManager shareInstance] show];
```
## 代码示例
```objc
/*ViewController.m*/
#import "MXAnimationCellManager.h"

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
    
    [MXAnimationCellManager shareInstance].tableView = _tableView;
    [MXAnimationCellManager shareInstance].type = MXCellAnimationExpand;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshTableView)];
}

- (void)refreshTableView {
    [[MXAnimationCellManager shareInstance] show];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
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

@end
```
