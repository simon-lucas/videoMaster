﻿package  {		import flash.display.MovieClip;	import StateMachine.*;	import flash.display.Sprite;	import flash.events.MouseEvent;	import flash.events.Event;		import data.Global;		import com.greensock.loading.LoaderMax;	import com.greensock.events.LoaderEvent;	import com.greensock.loading.ImageLoader;	import com.greensock.loading.ImageLoader;	import com.greensock.TweenLite; 	import com.greensock.plugins.TweenPlugin;		import data.CSVData;	import data.CSVLoader;		public class VideoApp extends MovieClip {				public var machine: StateMachine						public static const ATTRACTOR:String = "attractor";		public static const VIDEO:String = "video";		public static const MENU:String = "menu";		public static const TIMELINE:String = "timeline";		public static const INTRO:String = "intro";		public static const LANG:String = "lang";				public var attractorSprite : AttractorSprite		public var langSprite : LangSprite		public var menuSprite : MenuSprite		public var videoSprite : VideoSprite		public var introSprite : IntroSprite		public var timelineSprite : TimeLineSprite				public var contentSprite :Sprite;					public function VideoApp() {			// constructor code		}				public function init() {			// constructor code			trace("VideoApp init")			var cvsLoader=new CSVLoader()			cvsLoader.addEventListener("onParsed",startApp)			var bugger = "csvfile_"+Global.version			trace(Global[bugger])			cvsLoader.loadCSV("data/"+Global[bugger])		}				public function startApp(e:Event):void{			createStateMachine()						createSprites()							goAttractorState()				}				public function createStateMachine():void{					machine = new StateMachine()			machine.addState(ATTRACTOR, new AttractorState(this), 	[LANG, INTRO, MENU, VIDEO, TIMELINE]);			machine.addState(MENU, 		new MenuState(this), 		[INTRO, VIDEO, TIMELINE, ATTRACTOR]);			machine.addState(VIDEO, 	new VideoState(this), 		[MENU]);			machine.addState(INTRO, 	new IntroState(this), 		[LANG, MENU]);			machine.addState(LANG, 		new LanguageState(this), 	[ATTRACTOR, MENU]);			machine.addState(TIMELINE, 	new TimeLineState(this), 	[MENU]);		}				public function createSprites():void{						attractorSprite = new AttractorSprite()			attractorSprite.init()			//attractorSprite.scaleX=attractorSprite.scaleY = 2							menuSprite = new MenuSprite()			menuSprite.init()			menuSprite.addEventListener("playVideoStory", goVideoState)			menuSprite.addEventListener("showTimeLine", goTimeLineState)			menuSprite.addEventListener("goLang", goLangState)							//menuSprite.scaleX=menuSprite.scaleY = 2						langSprite = new LangSprite()			langSprite.init();			langSprite.addEventListener("goMenu", goIntroState)							videoSprite = new VideoSprite()			videoSprite.addEventListener("videoEnded", goMenuState)							introSprite = new IntroSprite()			introSprite.addEventListener("introEnded", goMenuState)						timelineSprite = new TimeLineSprite()			timelineSprite.addEventListener("closeTimeLine", goMenuState)							contentSprite = new Sprite()			addChild(contentSprite)			addChild(attractorSprite)		}				public function goAttractorState(e:MouseEvent=null):void{			machine.setState(ATTRACTOR);		}				public function goMenuState(e:Event=null):void{						machine.setState(MENU);		}				public function goTimeLineState(e:Event=null):void{						machine.setState(TIMELINE);		}				public function goIntroState(e:Event=null):void{			trace("XXXX goIntroState")			machine.setState(INTRO);		}				public function goVideoState(e:Event=null):void{			machine.setState(VIDEO);		}				public function goLangState(e:Event=null):void{			machine.setState(LANG);		}						public function showStage(stateName:String):void{			trace("showStage", stateName)			switch (stateName){				case ATTRACTOR:				attractorSprite.visible=true				break;				case LANG:				contentSprite.addChild(langSprite);				break;				case INTRO:				contentSprite.addChild(introSprite)								introSprite.init("movies/"+Global.version+"/"+Global[Global.version][0])				break;				case MENU:				contentSprite.addChild(menuSprite)				break;				case VIDEO:				contentSprite.addChild(videoSprite)								videoSprite.init("movies/"+Global.version+"/"+Global[Global.version][Global.currentVideoIndex+1])				break;				case TIMELINE:				contentSprite.addChild(timelineSprite)				break;			}		}				public function hideStage(stateName:String):void{			trace("hideStage", stateName)			switch (stateName){				case ATTRACTOR:				attractorSprite.visible=false				//removeChild(attractor);				break;				case LANG:				contentSprite.removeChild(langSprite)				break;				case INTRO:				contentSprite.removeChild(introSprite)				//removeChild(intro1)				break;				case MENU:				contentSprite.removeChild(menuSprite)				//removeChild(menu)				break;				case VIDEO:				contentSprite.removeChild(videoSprite)				break;				case TIMELINE:				contentSprite.removeChild(timelineSprite)				//removeChild(write)				break;			}				}										public function progressHandler(event:LoaderEvent):void{			//trace("progress: " + event.target.progress);		}				public function errorHandler(event:LoaderEvent):void{			trace("error occured with " + event.target + ": " + event.text);		}							}	}