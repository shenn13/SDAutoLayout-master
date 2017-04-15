//
//  MainTableViewCell.m
//  SDAutoLayout-master
//
//  Created by shen on 17/4/15.
//  Copyright © 2017年 shen. All rights reserved.
//

#import "MainTableViewCell.h"
#import "MainModel.h"


#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"


//屏幕的宽和高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define W(x) kScreenWidth*(x)/320.0
#define H(y) kScreenHeight*(y)/568.0
#define kMarg 10
#define kHeightLabel 30

@implementation MainTableViewCell{
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UIImageView *_imageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor colorWithRed:240.0/255 green:241.0/255 blue:236.0/255 alpha:1];
        
        [self addSubviews];
    }
    return self;
}

-(void)addSubviews{
    
    
    UIImageView *lineView = [UIImageView new];
    lineView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:lineView];
    
    _titleLabel = [UILabel new];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor colorWithRed:249.0/255 green:123.0/255 blue:134.0/255 alpha:100];
    [self.contentView addSubview:_titleLabel];
    
    _contentLabel = [UILabel new];
    _contentLabel.textColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:100.0/255 alpha:100];
    _contentLabel.font = [UIFont systemFontOfSize:16];
    _contentLabel.numberOfLines = 0;
    [self.contentView addSubview:_contentLabel];
    
    
    _imageView = [UIImageView new];
    _imageView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_imageView];
    
    
    lineView.sd_layout.widthIs(kScreenWidth).heightIs(kMarg).topSpaceToView(self.contentView,0);
    
    _titleLabel.sd_layout.widthIs(kScreenWidth - kMarg *4).heightIs(kHeightLabel).topSpaceToView(lineView, kMarg).leftSpaceToView(self.contentView,kMarg * 2);

    _contentLabel.sd_layout.topSpaceToView(_titleLabel, kMarg).rightSpaceToView(self.contentView, kMarg * 2).leftSpaceToView(self.contentView,kMarg * 2).autoHeightRatio(0);
    
    _imageView.sd_layout.topSpaceToView(_contentLabel,kMarg).rightSpaceToView(self.contentView, kMarg *10).widthIs(kScreenWidth - kMarg*20).heightIs(H(200));
}


-(void)setModel:(MainModel *)model{
    _model = model;
    
    _titleLabel.text = model.title;
    _contentLabel.text = [NSString stringWithFormat:@"        %@",model.content];
    _imageView.image = [UIImage imageNamed:model.image];
    
    //***********************高度自适应cell设置步骤************************
    [self setupAutoHeightWithBottomView:_imageView bottomMargin:20];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
