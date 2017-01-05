﻿/*Object menu takes xml formatted list of objects to initresponds to HilightObject methodHilightObject dispatches showObject Eventobject responds to mouseClicks and dispatches navigation event*/package com.spiral.maryrose.charactercase.views{import flash.display.Sprite;import com.spiral.maryrose.charactercase.events.ObjectMenuEvent;import com.spiral.maryrose.charactercase.views.MenuObject;import com.spiral.maryrose.charactercase.events.MenuObjectEvent;import com.spiral.maryrose.charactercase.views.Instruction;public class ObjectMenu extends Sprite{		private var objects:XMLList;	private const spacer:uint=108;	private var menuHeight:uint;	private var menuLoadCounter:uint;	private var counter:uint;	public  var menuObjects:Vector.<MenuObject> = new Vector.<MenuObject>();	private var debug:Boolean=false;	private var instruction:Instruction;		public function ObjectMenu(objects:XMLList,menuHeight:uint)	{		super();		init(objects,menuHeight);		if (debug) trace("new menu");	}	public function init(objects:XMLList,menuHeight:uint)	{		var bg:Sprite= new menuStrip();		var instruction = new Instruction();				addChild(bg)		addChild(instruction);		instruction.x= this.width/2-instruction.width/2		instruction.y=5		this.objects = objects;		this.menuHeight=menuHeight;		counter=0;		menuLoadCounter=0;		for each (var xml:XML in objects){			//trace(xml.files.@thumb);						var mObj:MenuObject  = new MenuObject(xml.files.@thumb, xml.files.@thumbOn,menuHeight,counter);			addChild(mObj);			mObj.addEventListener(MenuObjectEvent.OBJ_LOADED,objectLoaded);			mObj.addEventListener(MenuObjectEvent.CLICK,objectClicked);			mObj.x= counter*spacer;			counter++;			menuObjects.push(mObj);		}		unHilightAll();	}	/*	UTLITY FUNCTION TO COUNT OBJECTS AS THEY ARE LOADED	*/	public function objectLoaded(e:MenuObjectEvent):void{		menuLoadCounter++;		if (menuLoadCounter==counter){			spaceObjects();			//trace("spaceObjects")		}		//trace("dobtspaceObjects",menuLoadCounter,counter)	}		/*	FUNCTION TO SPACE OUT MENU ITEMS ONCE THEY ARE LOADED	*/	public function spaceObjects():void{		//horizontal spacing		var totalWidth:uint;		for each (var obj:MenuObject in menuObjects){			//trace("obj.width",obj.objWidth)			totalWidth+=obj.objWidth;		}		//trace("spaceObjects",totalWidth)		var space:Number=1080 - totalWidth;		var s:Number=space/(counter+1)	;			var lastobjEdge:Number=0;		for (var i:uint=0; i< counter; i++){			menuObjects[i].x=lastobjEdge + s;			lastobjEdge=menuObjects[i].x+menuObjects[i].objWidth;			//vertical			menuObjects[i].y = (menuHeight-menuObjects[i].objHeight)/2;			menuObjects[i].setBGRectSize(s-4);		}			}		public function objectClicked(e:MenuObjectEvent):void{		var menuEvt:ObjectMenuEvent=new ObjectMenuEvent(ObjectMenuEvent.CLICK);		menuEvt.objectIndex=e.objectIndex;			dispatchEvent(menuEvt);		}		public function hilightObject(index: uint)	{		if (debug) trace("ObjectMenu::hilightObject", index);		var objEvt:ObjectMenuEvent;		unHilightAll();		if (index<menuObjects.length){			objEvt = new ObjectMenuEvent(ObjectMenuEvent.ON_HILIGHT_OBJECT);			objEvt.objectIndex = index;			menuObjects[index].hilight(true);			dispatchEvent(objEvt);		}else{			objEvt = new ObjectMenuEvent(ObjectMenuEvent.ON_END_SEQUENCE);			dispatchEvent(objEvt);		}	}		public function unHilightAll():void{		for (var i:uint =0; i < menuObjects.length; i++){			menuObjects[i].hilight(false);		}	}		public function dispose()	{		for (var i:uint =0; i < menuObjects.length; i++){			menuObjects[i].dispose();			menuObjects[i].removeEventListener(MenuObjectEvent.OBJ_LOADED,objectLoaded)			removeChild(menuObjects[i]);		}	}				}}