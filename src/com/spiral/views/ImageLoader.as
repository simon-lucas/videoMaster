package com.spiral.views
{

import flash.display.Sprite;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.display.Bitmap;
import com.spiral.events.ImageLoaderEvent;
import flash.net.URLRequest;

public class ImageLoader extends Loader
{
	protected var debug:Boolean=false;
	public function ImageLoader()
	{
		super();
		init();
		if (debug) trace("new ImageLoader")
	}
	public function init():void{
		contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
	    contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
	}
	public function loadImage(filePath:String):void
	{	
		var image:URLRequest = new URLRequest(filePath);
		load(image);	
	}

	public function completeHandler(e:Event):void{
		if (debug) trace("completeHandler");
		var bitmaps=Bitmap(this.content);
		bitmaps.smoothing=true;
		dispatchEvent( new ImageLoaderEvent(ImageLoaderEvent.LOADED))
	}	
	
	public function ioErrorHandler(e:IOErrorEvent):void{
		if (debug) trace("ioErrorHandler", e);
	}
	
	public function unLoadImage(e:Event=null):void{
		if (debug) trace("ImageLoader::unLoadImage");

		var bitmaps=Bitmap(this.content)
		//if (bitmaps && bitmaps.bitmapData.width!=0) bitmaps.bitmapData.dispose();
				
		try {
			bitmaps.bitmapData.dispose()
		    //trace(myBitmapData.getPixel(1, 1));
		} catch (error:Error) {
		    if (debug) trace(error); // ArgumentError
		}
		this.unload();
	}
		
	public function dispose(e:Event=null):void{
		if (debug) trace("ImageLoader::dispose");
		contentLoaderInfo.removeEventListener(Event.COMPLETE, completeHandler);
	    contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		unLoadImage();
	}	

}

}