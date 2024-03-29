//
//  PostViewController.m
//  TestHomeworks
//
//  Created by Inocchi on 2014/07/13.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import "PostViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface PostViewController ()

@end

@implementation PostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    naiyou.delegate = self;
    naiyou.returnKeyType = UIReturnKeyDone;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)question:(id)sender{
    NSLog(@"書き込みします");
    //書き込みしてます。
    PFObject *que = [PFObject objectWithClassName:@"Q"];
    que[@"image"] = @"az.jpg";
    que[@"name"] = username1.text;
    que[@"text"] = naiyou.text;
    [que saveInBackground];
}

/*
-(IBAction)photo:(id)sender{
    NSLog(@"画像送信");
    PFObject *pht = [PFObject objectWithClassName:@"P"];
    pht[@"image"] = image.images;
    [pht saveInBackground];
}
*/ 

//キーボードを消す
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // キーボードを消す
    [naiyou resignFirstResponder] ;
    return YES;
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[picker presentedViewController] dismissViewControllerAnimated:YES completion:nil];
    //s[[picker2 presentedViewController] dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)cameraButtonTouched:(id)sender{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        [imagePickerController setAllowsEditing:YES];
        [imagePickerController setDelegate:self];
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
    else
    {
        NSLog(@"camera invalid");
    }
}

/*
-(IBAction)libraryButtonTouched:(id)sender{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *photoPickerController = [[UIImagePickerController alloc]init];
        [UIImagePickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [photoPickerController setAllowsEditing:YES];
        [photoPickerController setDelegate:self];
        [self presentViewController:photoPickerController animated:YES completion:nil];
 
 
    }
    else{
        NSLog(@"photo library invaild");
    }
}
*/

@end
