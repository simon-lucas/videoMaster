﻿package com.spiral.maryrose.charactercase.views{import flash.display.Sprite;import flash.net.URLRequest;import com.spiral.maryrose.charactercase.model.Config;import com.spiral.events.ImageLoaderEvent;import com.spiral.views.ImageLoader;import flash.display.MovieClip;import com.spiral.maryrose.charactercase.events.MenuObjectEvent;import flash.events.MouseEvent;import com.studioshitless.Utilities.DrawRectangle;public class MenuObject extends Sprite{	public var imageLoader1:ImageLoader = new ImageLoader();	private var imageLoader2:ImageLoader = new ImageLoader();	private var debug:Boolean=false;	private var pointer:Pointer;	private var objectIndex:uint;	private var menuHeight:uint;	private var bgRect:Sprite;		public function MenuObject(file1:String,file2:String,menuHeight:uint,objIndex:uint)	{		super();		pointer=new Pointer();		this.menuHeight=menuHeight;		pointer.visible=true;		loadImages(file1);		objectIndex=objIndex;	}		public function loadImages(file1:String):void{		if (debug) trace(file1)		imageLoader1.addEventListener(ImageLoaderEvent.LOADED,imageLoaded1)		imageLoader1.loadImage(Config.imagesPath+file1);		//imageLoader2.addEventListener(ImageLoaderEvent.LOADED,imageLoaded2)		//imageLoader2.loadImage(Config.imagesPath+file2);	}		public function imageLoaded1(e:ImageLoaderEvent):void	{				bgRect=new Sprite();		addChild (imageLoader1);		imageLoader1.x = 0;		imageLoader1.y = 0;		addChild(bgRect);		addChild(pointer);		pointer.x=imageLoader1.width/2;		pointer.y=menuHeight-((menuHeight-imageLoader1.height)/2);		dispatchEvent(new MenuObjectEvent(MenuObjectEvent.OBJ_LOADED));		addEventListener(MouseEvent.CLICK,objectClicked);			}		public function imageLoaded2(e:ImageLoaderEvent):void	{		addChild (imageLoader2);		imageLoader2.x = 0;		imageLoader2.y = 0;		imageLoader2.visible=false;	}		public function setBGRectSize(space:Number=18):void{		var rectangular:DrawRectangle = new DrawRectangle(-space/2,-space/2,imageLoader1.width+space, imageLoader1.height+space)		bgRect.addChild(rectangular)		bgRect.alpha=0.0	}		public function objectClicked(e:MouseEvent):void{		var objEvt:MenuObjectEvent=new MenuObjectEvent(MenuObjectEvent.CLICK);		objEvt.objectIndex=objectIndex;		dispatchEvent(objEvt);			}		public function get objWidth():Number{		return imageLoader1.width;	}	public function get objHeight():Number{		return imageLoader1.height;	}			public function hilight(state:Boolean):void{		if (state){			pointer.alpha=1;		}else{			pointer.alpha=0.0;		}				//if (state==true){						//imageLoader1.visible=false;			//imageLoader2.visible=true;				//	}else{			//imageLoader2.visible=false;			//imageLoader1.visible=true;	//	}	}	public function dispose():void{		removeEventListener(MouseEvent.CLICK,objectClicked)		imageLoader1.dispose();		//imageLoader2.dispose();		removeChild(imageLoader1);		removeChild(bgRect);				//removeChild(imageLoader2);	}}}