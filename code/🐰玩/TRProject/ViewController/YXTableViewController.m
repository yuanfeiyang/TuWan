//
//  YXTableViewController.m
//  TRProject
//
//  Created by spare on 16/6/14.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTableViewController.h"
#import "YXTableViewCell.h"
#import "YXTwoTableViewCell.h"
#import "YXViewController.h"
#import "TRPicViewController.h"
#import "YXViewModel.h"
#import "YXVideoViewController.h"
@interface YXTableViewController ()<iCarouselDelegate, iCarouselDataSource>
/** <#属性描述#> */
@property (nonatomic) YXViewModel *yxVM;
/** <#属性描述#> */
@property (nonatomic) iCarousel *ic;
/** <#属性描述#> */
@property (nonatomic) UIPageControl * pc;


@end

@implementation YXTableViewController{

    NSTimer *_timer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[self.yxVM typeForRow:indexPath.row] isEqualToString:@"all"]) {
        YXViewController *vc = [[YXViewController alloc]initWithURL:[self.yxVM detailHtmlForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([[self.yxVM typeForRow:indexPath.row] isEqualToString:@"pic"]) {
        TRPicViewController *vc = [[TRPicViewController alloc]initWithAid:[self.yxVM aidForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    if ([[self.yxVM typeForRow:indexPath.row] isEqualToString:@"video"]) {
        YXVideoViewController *vc = [[YXVideoViewController alloc]initWithAid:[self.yxVM aidForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

#pragma mark - iCarouselDelegate, iCarouselDataSource Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.yxVM.indexPicList.count;

}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:carousel.bounds];
        UIImageView *iv = [UIImageView new];
        iv.tag = 100;
        [view addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        iv.contentMode = UIViewContentModeScaleToFill;
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    [iv setImageURL:[self.yxVM iconForRow:index]];
    return view;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{

    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{

    _pc.currentPage = carousel.currentItemIndex;
}
- (iCarousel *)ic{
   
        _ic = [[iCarousel alloc]initWithFrame:CGRectMake(0, 0, 0, kScreenW*220/360)];
        _ic.delegate = self;
        _ic.dataSource = self;
        
        _pc = [UIPageControl new];
        _pc.numberOfPages = self.yxVM.indexPicList.count;
        [_ic addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(0);
        }];
        [_timer invalidate];
        _timer = nil;
        
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
        
    
    return _ic;

}


- (instancetype)initWithStyle:(UITableViewStyle)style dataListType:(DataListType)type{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _dataListType = type;
    }
    return self;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
    if ([self.yxVM.dataList[indexPath.row].showtype isEqualToString:@"0"]) {
        return [tableView fd_heightForCellWithIdentifier:@"identifer" cacheByIndexPath:indexPath configuration:^(YXTableViewCell* cell) {
            cell.titleLb.text = [self.yxVM titleForRow:indexPath.row];
            cell.descriptionLb.text = [self.yxVM descriptionForRow:indexPath.row];
            cell.clickLb.text = [self.yxVM clickForRow:indexPath.row];
            //[cell.iconImage setImageURL:[self.yxVM litpicURLForRow:indexPath.row]];
            [cell.iconImage setImageWithURL:[self.yxVM litpicURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"anon"]];
            
        }];

    }
    
    
    return [tableView fd_heightForCellWithIdentifier:@"identifer" cacheByIndexPath:indexPath configuration:^(YXTwoTableViewCell* cell) {
        cell.titleLb.text = [self.yxVM titleForRow:indexPath.row];
        cell.clickLb.text = [self.yxVM clickForRow:indexPath.row];
        [cell.icons enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //[obj setImageURL:[self.yxVM infoIconURLForRow:indexPath.row index:idx]];
            [obj setImageWithURL:[self.yxVM infoIconURLForRow:indexPath.row index:idx] placeholder:[UIImage imageNamed:@"anon"]];
        }];

    }];
    
    */
    if ([self.yxVM.dataList[indexPath.row].showtype isEqualToString:@"0"]) {
        return 100;
    }
    return 140;

}


- (YXViewModel *)yxVM{
    if (!_yxVM) {
        _yxVM = [[YXViewModel alloc]initWithType:_dataListType];
    }
    return _yxVM;

}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[YXTableViewCell class] forCellReuseIdentifier:@"Cell1"];
    [self.tableView registerClass:[YXTwoTableViewCell class] forCellReuseIdentifier:@"Cell2"];
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.yxVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
            }else{
                [self.tableView reloadData];
                if (self.yxVM.headerNumber>0) {
                    self.tableView.tableHeaderView = self.ic;
                }else{
                    self.tableView.tableHeaderView = nil;
                
                }
                
                if (self.yxVM.isLoadMore) {
                    [self.tableView.mj_footer resetNoMoreData];
                }else{
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
                
            }
            [self.tableView.mj_header endRefreshing];
        }];
        
        
        
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.yxVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
            }else{
                [self.tableView reloadData];
                if (!self.yxVM.isLoadMore) {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                    
                }
                
            }
        }];
        [self.tableView.mj_footer endRefreshing];
        }];
    
    [self.tableView.mj_header beginRefreshing];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.yxVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.yxVM.dataList[indexPath.row].showtype isEqualToString:@"0"]) {
      YXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
        cell.titleLb.text = [self.yxVM titleForRow:indexPath.row];
        cell.descriptionLb.text = [self.yxVM descriptionForRow:indexPath.row];
        cell.clickLb.text = [self.yxVM clickForRow:indexPath.row];
        //[cell.iconImage setImageURL:[self.yxVM litpicURLForRow:indexPath.row]];
        [cell.iconImage setImageWithURL:[self.yxVM litpicURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"anon"]];
        return cell;
        
    }
    if ([self.yxVM.dataList[indexPath.row].showtype isEqualToString:@"1"]) {
        YXTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
        cell.titleLb.text = [self.yxVM titleForRow:indexPath.row];
        cell.clickLb.text = [self.yxVM clickForRow:indexPath.row];
        [cell.icons enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //[obj setImageURL:[self.yxVM infoIconURLForRow:indexPath.row index:idx]];
            [obj setImageWithURL:[self.yxVM infoIconURLForRow:indexPath.row index:idx] placeholder:[UIImage imageNamed:@"anon"]];
        }];
//        [cell.iconImage1 setImageURL:[self.yxVM icon1URLShowForRow:indexPath.row]];
//        [cell.iconImage2 setImageURL:[self.yxVM icon2URLShowForRow:indexPath.row]];
//        [cell.iconImage3 setImageURL:[self.yxVM icon3URLShowForRow:indexPath.row]];
        
        return cell;
    
    }
    
    
    
    
    return nil;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
