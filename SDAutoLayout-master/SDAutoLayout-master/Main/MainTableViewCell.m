//
//  MainTableViewCell.m
//  SDAutoLayout-master
//
//  Created by shen on 17/4/15.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "MainTableViewCell.h"


#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"


//屏幕的宽和高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kMarg 10
#define kHeightLabel 30

@implementation MainTableViewCell{
    UILabel *_titleLabel;
    UILabel *_contentLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
    }
    return self;
}

-(void)addSubviews{
    
    _titleLabel = [UILabel new];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor colorWithRed:249.0/255 green:123.0/255 blue:134.0/255 alpha:100];
    [self.contentView addSubview:_titleLabel];
    
    _contentLabel = [UILabel new];
    _contentLabel.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:100];
    _contentLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_contentLabel];
    
    
    _titleLabel.sd_layout.widthIs(kScreenWidth - kMarg *4).heightIs(kHeightLabel).topSpaceToView(self.contentView, kMarg).leftSpaceToView(self.contentView,kMarg * 2);

    _contentLabel.sd_layout.topSpaceToView(_titleLabel, kMarg).rightSpaceToView(self.contentView, kMarg * 2).leftSpaceToView(self.contentView,kMarg * 2).autoHeightRatio(0);
    
    
    //***********************高度自适应cell设置步骤************************
    
    
    [self setupAutoHeightWithBottomView:_contentLabel bottomMargin:10];
}

-(void)setText:(NSString *)text{
    
    _titleLabel.text = @"愿你被这个世界温柔相待";
    _contentLabel.text = [NSString stringWithFormat:@"        %@",text];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
