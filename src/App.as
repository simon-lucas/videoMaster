﻿package  {		import flash.display.MovieClip;	import VideoApp;	import data.Global;	import flash.display.StageDisplayState;	import flash.geom.Rectangle;	import flash.display.StageAlign;	import flash.display.StageScaleMode;			public class App extends MovieClip {				private var videoApp:VideoApp		[SWF(width="1920", height="1080", backgroundColor="#000000", frameRate="30")] 			public function App() {			// constructor code			var scalingRect:Rectangle = new Rectangle(0, 0, 3840, 2160);			//var rect:Rectangle = new Rectangle();			stage.displayState = StageDisplayState.FULL_SCREEN			//stage.nativeWindow.bounds = scalingRect			stage.align = StageAlign.TOP_LEFT;			stage.scaleMode = StageScaleMode.NO_SCALE;															loadApp()		}				public function loadData():void{			Global.configData.timeoutsecs = 60		}				public function loadApp():void{			videoApp = new VideoApp()			addChild(videoApp)			videoApp.init()			}	}	}