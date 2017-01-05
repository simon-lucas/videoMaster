package com.spiral.maryrose.charactercase.views
{

import flash.display.Sprite;
import com.spiral.views.ImageLoader;
import com.spiral.events.ImageLoaderEvent;

public class Instruction extends Sprite
{
	public var image:ImageLoader;
	public function Instruction()
	{
		super();
		init();
	}
	
	public function init():void{
		image = new ImageLoader();
		image.loadImage("media/images/Touch.png")
		addChild(image)
		image.addEventListener(ImageLoaderEvent.LOADED,onLoaded)
		
	}
	public function onLoaded(e:ImageLoaderEvent):void{
		image.x=-image.width/2;	
	}
}

}