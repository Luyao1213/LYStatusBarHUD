//
//  ViewController.m
//  LYStatusBarHUDDemo

//

#import "ViewController.h"
#import "LYStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)message:(id)sender {
    [LYStatusBarHUD ly_showMessage:@"没有什么事!!!!"];
}

- (IBAction)hide:(id)sender {
    [LYStatusBarHUD ly_hide];
}

- (IBAction)loading:(id)sender {
    [LYStatusBarHUD ly_showLoading:@"正在加载中..."];
}

- (IBAction)error:(id)sender {
    [LYStatusBarHUD ly_showError:@"加载失败!"];
}

- (IBAction)success:(id)sender {
    [LYStatusBarHUD ly_showSuccess:@"加载成功!"];
}
@end
