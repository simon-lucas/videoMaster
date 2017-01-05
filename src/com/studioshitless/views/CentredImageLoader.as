package com.studioshitless.views
{

import flash.display.Sprite;
import com.studioshitless.views.ImageLoader;
import com.studioshitless.events.ImageLoaderEvent;

public class CentredImageLoader extends Sprite
{
	public var iLoader:ImageLoader;
	public function CentredImageLoader()
	{
		super();
	}
	public function loadImage(s:String)
	{
		iLoader= new ImageLoader()
		
		addChild(iLoader);
		iLoader.addEventListener(ImageLoaderEvent.LOADED,onLoaded)
		iLoader.loadImage(s);
	}
	public function onLoaded(e:ImageLoaderEvent):void
	{
		iLoader.x= -iLoader.width/2
		iLoader.y= -iLoader.height/2
		doZoom()
	}
	public function doZoom():void{
		iLoader.scaleX=iLoader.scaleY=0.2
			iLoader.x= -iLoader.width/2
			iLoader.y= -iLoader.height/2
	}
}

}