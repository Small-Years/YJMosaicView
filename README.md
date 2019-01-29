# 原图加马赛克工具

原理：原图按比例缩小到屏幕尺寸显示，手指移动将路径点重新乘上缩小的比例，然后实时显示的点对应原图上的点生成的图，并不是通过layer渲染的失真缩小图，所以经过此方法处理过的图片，不会存在图片编辑后尺寸变小、失真、分辨率降低等问题。

效果图：
![效果图](http://lc-nxp0vq41.cn-n1.lcfile.com/45ef8657369dc85e9a86.gif "效果图")

### 实现功能：

1. 马赛克画笔功能，可自定义马赛克图案 ，马赛克大小
2. 编辑器可放大，放大后双指移动视图，单指画马赛克
3. 上一步，下一步
4. 实现了对原图做处理功能，并不是失真保存图案
5. 优化了处理时 CPU 占用太高问题 



使用方式：

1、将YJMosaiView文件夹拖入项目

2、创建马赛克画板,双指放大操作，将MosaiView添加到一个UIScrollView上即可：

```
/**
创建马赛克画板

@param image 原图
@param frame 画板frame
*/
- (void)createMosaicsView:(UIImage *)image withFrame:(CGRect)frame {
if (mainScrollView != nil) {
[mainScrollView removeFromSuperview];
mainScrollView = nil;
}
mainScrollView = [[UIScrollView alloc] initWithFrame:frame];

mainScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
mainScrollView.showsHorizontalScrollIndicator = NO;
mainScrollView.showsVerticalScrollIndicator = NO;
mainScrollView.delegate = self;
mainScrollView.clipsToBounds = NO;
mainScrollView.y = frame.origin.y;
[self.view addSubview:mainScrollView];

CGFloat img_Width = (image.size.width * mainScrollView.height)/image.size.height;
CGRect showRect = CGRectMake(0, 0, img_Width, mainScrollView.height);
if (image.size.width > image.size.height) {
CGFloat img_Height = (image.size.height * mainScrollView.width)/image.size.width;
showRect = CGRectMake(0, 0, mainScrollView.width,img_Height);
showRect.origin.y = (mainScrollView.height - img_Height)*0.5;
}


self.mosaicView = [[MosaiView alloc] initWithFrame:showRect];
self.mosaicView.centerX = mainScrollView.width * 0.5;
self.mosaicView.deleagate = self;
self.mosaicView.originalImage = image;//原图
### 注意：mosaicImage 这个图是根据原图生成的马赛克图片，如果需要其他种类的马赛克图，只需要将新样式的马赛克图赋值给这个属性即可。
self.mosaicView.mosaicImage = image;//马赛克图
[mainScrollView addSubview:self.mosaicView];

mainScrollView.maximumZoomScale = 2.0;
mainScrollView.minimumZoomScale = 1;
mainScrollView.panGestureRecognizer.minimumNumberOfTouches = 2;
mainScrollView.panGestureRecognizer.delaysTouchesBegan = NO;
mainScrollView.pinchGestureRecognizer.delaysTouchesBegan = NO;   
}
```
代理方法
```

#pragma mark -UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
return self.mosaicView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
CGFloat Ws = mainScrollView.frame.size.width - mainScrollView.contentInset.left - mainScrollView.contentInset.right;
CGFloat Hs = mainScrollView.frame.size.height - mainScrollView.contentInset.top - mainScrollView.contentInset.bottom;
CGFloat W = mainScrollView.frame.size.width;
CGFloat H = mainScrollView.frame.size.height;

CGRect rct = self.mosaicView.frame;
rct.origin.x = MAX((Ws-W)/2, (SCREEN_WIDTH - self.mosaicView.width)*0.5);
rct.origin.y = MAX((Hs-H)/2, (mainScrollView.height - self.mosaicView.height)*0.5);
self.mosaicView.frame = rct;
}

```

详细介绍简书地址：

https://www.jianshu.com/p/50c8eeb5badd

更详细使用规则清查看demo，若此经验对你有所帮助，劳烦各位给个Star   (＾－＾)V  

