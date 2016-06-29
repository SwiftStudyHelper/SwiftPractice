import UIKit
import Photos

protocol BeautyGirlViewControllerDelegate :NSObjectProtocol{
    
    func clickItem(size:CGSize,model:CellModel)
    
}


class BeautyGirlViewController:UIViewController {
    
    var collectionView:UICollectionView?
    
    var layout:WaterfallLayout?
    
    var allPhotos:PHFetchResult?
    
    var photoManager:PHCachingImageManager?
    
    var datasource = [CellModel]()
    
    weak var delegate:BeautyGirlViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func setData() {
        
        let options = PHFetchOptions()
        // 按图片生成时间排序
        options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        allPhotos = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: options)
        
        photoManager = PHCachingImageManager()
        
        allPhotos?.enumerateObjectsUsingBlock({ (object:AnyObject!, count:Int, stop:UnsafeMutablePointer<ObjCBool>) in
            
            if object is PHAsset{
                
                let asset = object as! PHAsset
                
                let model = CellModel()
                
                model.image = asset
                
                model.w = CGFloat(asset.pixelWidth)
                
                model.h = CGFloat(asset.pixelHeight)
                
                let dateFormatter = NSDateFormatter()
                
                dateFormatter.dateFormat = "MM-dd-yyyy"
                
                model.name = dateFormatter.stringFromDate(asset.modificationDate!)
                
                let itemW = (self.collectionView?.frame.width)! / (self.layout?.columnCount)!
                
                let itemH = itemW * (CGFloat(asset.pixelHeight)/CGFloat(asset.pixelWidth))
                
                let imageSize = CGSize(width: itemW,
                    height: itemH)
                
                /* For faster performance, and maybe degraded image */
                let options = PHImageRequestOptions()
                
                options.deliveryMode = .FastFormat
                
                options.synchronous = true
                
                self.photoManager?.requestImageForAsset(asset, targetSize: imageSize, contentMode: PHImageContentMode.AspectFit, options: options, resultHandler: { (image, info) in
                    
                    model.smallImage = image!
                    
                    self.datasource.append(model)
                    
                    print(model.name)
                    
                })
            }
            
        })
        
    }
    
    func createUI() {
        
        
        
        
        //初始化colletionView
        
        layout = WaterfallLayout()
        
        collectionView = UICollectionView(frame: CGRectMake(SCREEN_W*6, 0, SCREEN_W, SCREEN_H-Navi_H-Bar_H), collectionViewLayout: layout!)
        
        collectionView?.backgroundColor = UIColor.whiteColor()
        
        collectionView?.registerNib(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        collectionView?.dataSource = self
        
        collectionView?.delegate = self
        
        layout!.columnCount = 3
        
        layout!.columnMargin = 10
        
        layout!.rowMargin = 10
        
        layout!.edge = UIEdgeInsetsMake(10, 10, 10, 10)
        
        layout?.delegate = self
        
        self.view.addSubview(collectionView!)
        
        
        
    }
    
    
}

extension BeautyGirlViewController:UICollectionViewDataSource,UICollectionViewDelegate
{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.datasource.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = (collectionView.dequeueReusableCellWithReuseIdentifier("CustomCollectionViewCell", forIndexPath: indexPath) as! CustomCollectionViewCell)
        
        cell.refreshCellWithModle(self.datasource[indexPath.row])
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
        print((collectionView.cellForItemAtIndexPath(indexPath)?.frame.size)!)  
        
        self.delegate?.clickItem((collectionView.cellForItemAtIndexPath(indexPath)?.frame.size)!,model:self.datasource[indexPath.row])
        
        
    }

    
    
}

extension BeautyGirlViewController:WaterfallLayoutdelegate
{
    
    func waterlayout(layout:WaterfallLayout,index:NSInteger,itemWidth:CGFloat) -> CGFloat
    {
        
        
        let model = self.datasource[index]
        
        return  itemWidth*model.h/model.w
        
    }
    
}
